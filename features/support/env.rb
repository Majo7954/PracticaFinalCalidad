require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara-screenshot/cucumber'

Capybara.default_driver = :selenium_chrome
Capybara.app_host = 'https://www.saucedemo.com'
Capybara.default_max_wait_time = 5

Capybara::Screenshot.autosave_on_failure = true
Capybara::Screenshot.prune_strategy = :keep_last_run
