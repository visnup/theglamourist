require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'rack/mobile-detect'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module TheGlamourist
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Use mobile detect middlware
    config.middleware.use Rack::MobileDetect

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Pacific Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Precompile additional assets.
    # application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
    config.assets.precompile += %w( modernizr.min.js theglamourist.svg theglamourist.eot )

    # Remove frame protection
    config.action_dispatch.default_headers.delete 'X-Frame-Options'
  end
end
