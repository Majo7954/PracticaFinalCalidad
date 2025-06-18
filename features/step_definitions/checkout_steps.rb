require_relative '../pages/checkout_page'

When('I enter my first name {string}, last name {string} and postal code {string}') do |first_name, last_name, postal_code| 
  @checkout_page ||= CheckoutPage.new
  @checkout_page.fill_information(first_name, last_name, postal_code)
end

When('I click on Continue') do
  @checkout_page ||= CheckoutPage.new
  @checkout_page.click_continue
end

Then('I should see the checkout overview page') do
  expect(page).to have_content('Checkout: Overview')
  expect(page).to have_button('Finish')
end

When('I click on Cancel') do
  @checkout_page ||= CheckoutPage.new
  @checkout_page.click_cancel
end

Then('I should be redirected to the cart page from checkout') do
  @checkout_page ||= CheckoutPage.new
  expect(@checkout_page.redirected_to_cart?).to be true
  expect(page).to have_content('Your Cart')
end

When('I click on Finish') do
  @checkout_page ||= CheckoutPage.new
  @checkout_page.click_finish
end

Then('I should see the confirmation message {string}') do |message|
  expect(@checkout_page.confirmation_message_displayed?(message)).to be true
end

When('I click on Continue without filling the fields') do
  @checkout_page ||= CheckoutPage.new
  @checkout_page.click_continue
end

Then('I should see an error message indicating that fields are required') do
  expect(page).to have_content('Error: First Name is required')
  expect(page).to have_content('Error: Last Name is required')
  expect(page).to have_content('Error: Postal Code is required')
end

When('I enter my first name {string}, last name {string} and postal code {string} and click Continue') do |first_name, last_name, postal_code|
  @checkout_page ||= CheckoutPage.new
  @checkout_page.fill_information(first_name, last_name, postal_code)
  @checkout_page.click_continue
end

Then('I should see the information I entered on the checkout overview page') do
  expect(page).to have_content('First Name:')
  expect(page).to have_content('Last Name:')
  expect(page).to have_content('Postal Code:')
end

When('I click on Cancel on the checkout information page') do
  @checkout_page ||= CheckoutPage.new
  @checkout_page.click_cancel
end

Then('I should be redirected to the products page from the cart') do
  expect(page).to have_content('Products')
end

Then('I should be redirected to the products page from checkout overview') do
  expect(page).to have_content('Products')
end

When('I complete the checkout process by entering my details and clicking Finish') do
  @checkout_page ||= CheckoutPage.new
  @checkout_page.fill_information('Maria', 'Lopez', '45678')
  @checkout_page.click_continue
  @checkout_page.click_finish
end

Then('I should see a confirmation message with "Thank you for your order!"') do
  expect(@checkout_page.confirmation_message_displayed?('Thank you for your order!')).to be true
end

When('I proceed to checkout from cart') do
  @checkout_page ||= CheckoutPage.new
  @checkout_page.go_to_cart
  @checkout_page.click_checkout
end

Then('I should see subtotal, tax and total correctly calculated') do
  expect(page).to have_content('Item total:')
  expect(page).to have_content('Tax:')
  expect(page).to have_content('Total:')
end

Then('I should be redirected to the cart page') do
  @checkout_page ||= CheckoutPage.new
  expect(@checkout_page.redirected_to_cart?).to be true
  expect(page).to have_content('Your Cart')
end
