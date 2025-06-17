require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara-screenshot/cucumber'

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
Capybara.save_path = File.join(Dir.pwd, 'screenshots')
