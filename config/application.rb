require_relative 'boot'

require 'rails/all'
require 'neo4j/railtie'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SocialNetwork
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators { |g| g.orm :neo4j }

    config.neo4j.session.type = :http
    config.neo4j.session.url = 'http://localhost:7474'
  end
end
