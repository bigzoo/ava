class RemindersController < ActionController::API
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
  def index
    reminders = Reminder.where(session_token:token)
    json_response(reminders)
  end
  def show
    @reminder = Reminder.find(params[:id])
    json_response(@reminder)
  end

  def create
    tkn = {session_token:token}
    reminder_param = reminder_params.merge(tkn)
    binding.pry
    @reminder = Reminder.create!(reminder_param)
    json_response(@reminder, :created)
  end

  def update
    @reminder = Reminder.where(id:params[:id],token:token)
    @reminder.update!(reminder_params)
    json_response(@reminder)
  end

  def destroy
    @reminder = Reminder.where(id:params[:id],token:token)
    @reminder.destroy
    render status: 200, json: {
       message: "Your reminder has successfully been delete."
    }
  end

  private
  def token
    session[:token]
  end
  def reminder_params
    params.permit(:time,:date,:recurrence,:name,:user_id,:session_token)
  end
end
