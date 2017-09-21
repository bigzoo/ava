class NameController < ActionController::API
  before_action :token
  include Response
  rescue_from ActionController::RoutingError do |exception|
    json_response({ error: exception.message }, :bad_request)
  end
  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ error: exception.message }, :not_found)
  end
  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ error: exception.message }, :unprocessable_entity)
  end
  def show
    @ses = Session.find_by_token(token)
    json_response(name: @ses.name)
  end

  def create
    session = Session.find_by_token(token)
    session.update!(name_param)
    render status: 200, json: {
       message: "Name has been saved successfully."
    }
  end

  def update
    session = Session.find_by_token(token)
    session.update!(name_param)
    render status: 200, json: {
       message: "Name has been updated successfully."
    }
  end

  def destroy
    session = Session.find_by_token(token)
    session.update!(name:'')
    render status: 200, json: {
       message: "Name has been deleted successfully."
    }
  end

  private
  def token
    session[:token]
  end
  def name_param
    params.permit(:name)
  end
end
