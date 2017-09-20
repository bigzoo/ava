OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '973052155629-5amu2tts8ffib8da8ncna0pbs9ghs7en.apps.googleusercontent.com', 'PWLB_3ZFAJDGoD88R2TLKP1E', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end