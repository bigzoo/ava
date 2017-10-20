require 'google/apis/calendar_v3'
require 'google/api_client/client_secrets.rb'
class GoogleCalendar
  def initialize(current_user)
    configure_client(current_user)
  end

  def configure_client(current_user)
    secrets = Google::APIClient::ClientSecrets.new({"web" => {"access_token" => current_user.oauth_token, "refresh_token" => current_user.refresh_token, "client_id" => ENV['GOOGLE_CLIENT_ID'], "client_secret" => ENV['GOOGLE_CLIENT_SECRET']}})
    @client = Google::Apis::CalendarV3::CalendarService.new
    @client.client_options.application_name = 'Ava'
    @client.authorization = secrets.to_authorization
    @client.authorization.refresh!
    @client.list_calendar_lists #profit!
    # @client = Google::APIClient.new(application_name:'Ava',application_version:'1.0.0')
    # @client.authorization.access_token = current_user.oauth_token
    # @client.authorization.refresh_token = current_user.refresh_token
    # @client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
    # @client.authorization.client_secret = ENV['GOOGLE_CLIENT_SECRET']
    # @client.authorization.refresh!
    # @service = @client.discovered_api('calendar', 'v3')
    response = @client.execute(api_method: @service.calendar_list.list)
  end

  def calendar_id(schedule)
    response = @client.execute(api_method:@service.calendar_list.list)
    calendars = JSON.parse(response.body)
    calendar = calendars["items"].select {|cal|
    cal["id"].downcase == schedule.calendar_id}
    calendar["id"]
  end
end
