class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :sessionise
  helper_method :current_user

  private
  def sessionise
    session[:token] = Session.create(token:rand(36**50).to_s(36)).token if !session[:token] || !Session.exists?(token:session[:token])
    cookies[:token] = session[:token]
    # cal = GoogleCalendar.new(current_user)
  end

  #google auth
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  && User.exists?(id:session[:user_id])
  end
end
