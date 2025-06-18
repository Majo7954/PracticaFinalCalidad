require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara-screenshot/cucumber'
require_relative '../pages/products_page'
require_relative '../pages/login_page'
require_relative '../pages/cart_page'
require_relative '../pages/sidebar_page'


Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--disable-features=PasswordLeakDetection')
  options.add_argument('--no-default-browser-check')
  options.add_argument('--no-first-run')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--disable-extensions')
  options.add_argument('--disable-notifications')
  options.add_argument('--incognito')
  options.add_argument('--start-maximized')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :chrome

Capybara.app_host = 'https://www.saucedemo.com'

Capybara.default_max_wait_time = 5

Capybara::Screenshot.autosave_on_failure = true
Capybara::Screenshot.prune_strategy = :keep_last_run
Capybara.save_path = "./screenshots"  
Capybara::Screenshot.register_driver(:chrome) do |driver, path|
  driver.browser.save_screenshot(path)
end

Dir.glob(File.join(File.dirname(__FILE__), '..', 'step_definitions', '*.rb')).each do |file|
  require file
end



