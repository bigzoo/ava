class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :sessionise
  private
  def sessionise
    session[:token] = Session.create(token:rand(36**50).to_s(36)).token if !session[:token] || !Session.exists?(token:session[:token])
    cookies[:token] = session[:token]
  end
end
