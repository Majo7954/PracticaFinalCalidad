require_relative '../pages/login_page'

Before do
  @login_page = LoginPage.new
end

Given('I am on the login page of SauceDemo') do
  @login_page.visit_page
end

When('I login with username {string} and password {string}') do |username, password|
  @login_page.login_with(username, password)
end

Then('I should be redirected to the inventory page') do
  expect(@login_page.products_title_visible?).to be true
end

Then('I should remain on the login page') do
  expect(@login_page.still_on_login_fields?).to be true
end

Then('I should see an error message {string}') do |expected_message|
  expect(@login_page.login_failed_message_visible?(expected_message)).to be true
end

When('I reload the page') do
  @login_page.reload
end

Then('I see the swaglab with {int} differents products and prices.') do |count|
  expect(@login_page.number_of_visible_products).to eq(count)
  expect(@login_page.all_products_have_name_and_price?).to be true
end

Given('I am on the login page') do
  @login_page ||= LoginPage.new
  @login_page.visit_page
end

