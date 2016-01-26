Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, ENV['APP_CK'], ENV['APP_CS']
end
