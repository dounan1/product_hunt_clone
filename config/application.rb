require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProductHuntClone
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework  :test_unit, fixture: false
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1


    Capybara.register_driver :headless_chrome do |app|
      capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => { args: %w(headless disable-gpu) + [ 'window-size=1280,800' ] })
      Capybara::Selenium::Driver.new app, browser: :chrome, desired_capabilities: capabilities
    end
    Capybara.save_path = Rails.root.join('tmp/capybara')
    Capybara.javascript_driver = :headless_chrome
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
