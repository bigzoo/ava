class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :sessionise
  helper_method :current_user

  private
  def sessionise
    session[:token] = Session.create(token:rand(36**50).to_s(36)).token if !session[:token]
    cookies.delete :token
    cookies[:token] = session[:token]
  end

  #google auth
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
