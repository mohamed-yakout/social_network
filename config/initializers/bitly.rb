Bitly.use_api_version_3

Bitly.configure do |config|
  config.api_version = 3
  config.login = Rails.application.credentials.config[:bitly][:login]
  config.access_token = Rails.application.credentials.config[:bitly][:access_token]
end
