require_relative '../pages/checkout_page'

Before do
  @checkout = CheckoutPage.new
end

When('I go to the cart page') do
  @checkout.go_to_cart
end

When('I click on Checkout') do
  @checkout.click_checkout
end

When('I enter my first name {string}, last name {string} and postal code {string}') do |first, last, zip|
  @checkout.fill_information(first, last, zip)
end

When('I click on Continue') do
  @checkout.click_continue
end

When('I click on Finish') do
  @checkout.click_finish
end

When('I click on Cancel') do
  @checkout.click_cancel
end

Then('I should see the checkout overview page') do
  expect(@checkout.checkout_overview_displayed?).to be true
end

Then('I should see the confirmation message {string}') do |message|
  expect(@checkout.confirmation_message_displayed?(message)).to be true
end

Then('I should be redirected to the cart page') do
  expect(@checkout.redirected_to_cart?).to be true
end

Then('I should be redirected to the products page from checkout overview') do
  expect(@checkout.redirected_to_products?).to be true
end

Then('I should see subtotal, tax and total correctly calculated') do
  expect(page).to have_css('.summary_subtotal_label')
  expect(page).to have_css('.summary_tax_label')
  expect(page).to have_css('.summary_total_label')
end
