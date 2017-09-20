class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    Session.find_by_token(session[:token]).update(name:user.name.split(' ')[0])
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    Session.find_by_token(session[:token]).update(name:'')
    redirect_to root_path
  end
end
