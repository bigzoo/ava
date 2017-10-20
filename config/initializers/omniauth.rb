OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
  {
    scope: "userinfo.email,userinfo.profile,calendar",
    client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}},
  access_type: 'offline'
}
end

#
# config.omniauth :google_oauth2, ENV['GOOGLE_CLIENT_ID'],
#   ENV['GOOGLE_CLIENT_SECRET'],
#   { access_type: "offline",
#     prompt: "consent",
#     select_account: true,
#     scope: 'userinfo.email,calendar' }
