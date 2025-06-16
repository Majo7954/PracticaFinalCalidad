require_relative '../pages/checkout_page'

checkout_page = CheckoutPage.new

When('I enter my first name {string}, last name {string} and postal code {string}') do |first_name, last_name, postal_code|
  checkout_page.fill_checkout_info(first_name, last_name, postal_code)
end

When('I click on Continue') do
  checkout_page.click_continue
end

Then('I should see the checkout overview page') do
  expect(checkout_page).to be_on_overview_page
end

When('I click on Cancel') do
  checkout_page.click_cancel
end

Then('I should be redirected to the cart page') do
  expect(checkout_page).to be_on_cart_page
end

When('I click on Finish') do
  checkout_page.click_finish
end

Then('I should see the confirmation message {string}') do |message|
  expect(checkout_page.confirmation_message_visible?(message)).to be true
end

When('I click on Continue without filling the fields') do
  checkout_page.continue_without_filling_fields
end

Then('I should see an error message indicating that fields are required') do
  expect(checkout_page.error_fields_required?).to be true
end

When('I enter my first name {string}, last name {string} and postal code {string} and click Continue') do |first_name, last_name, postal_code|
  checkout_page.fill_checkout_info(first_name, last_name, postal_code)
  checkout_page.click_continue
end

Then('I should be redirected to the products page from the cart') do
  expect(checkout_page.redirected_to_products_page?).to be true
end

Then('I should be redirected to the products page from checkout overview') do
  expect(checkout_page.redirected_to_products_page?).to be true
end

When('I complete the checkout process by entering my details and clicking Finish') do
  checkout_page.complete_checkout
end

Then('I should see a confirmation message with "Thank you for your order!"') do
  expect(checkout_page.confirmation_message_visible?('Thank you for your order!')).to be true
end
