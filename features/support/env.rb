require 'coveralls'
Coveralls.wear_merged!('rails')

require 'cucumber/rails'
require 'webmock/cucumber'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

World(FactoryBot::Syntax::Methods)

# Chromedriver.set_version '2.33'

Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: {
          args: %w[ headless no-sandbox disable-popup-blocking disable-gpu window-size=1280,1024]
      }
  )

  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

Capybara.javascript_driver = :chrome
