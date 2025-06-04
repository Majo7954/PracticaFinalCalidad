When('I enter my first name {string}, last name {string} and postal code {string}') do |first_name, last_name, postal_code|
  fill_in 'first-name', with: first_name
  fill_in 'last-name', with: last_name
  fill_in 'postal-code', with: postal_code
end

When('I click on Continue') do
  click_button 'Continue'
end

Then('I should see the checkout overview page') do
  expect(page).to have_content('Checkout: Overview')
  expect(page).to have_button('Finish')
end

When('I click on Cancel') do
  click_button 'Cancel'
end

Then('I should be redirected to the cart page') do
  expect(page).to have_content('Your Cart')
  expect(page).to have_button('Continue Shopping')
end

When('I click on Finish') do
  click_button 'Finish'
end

Then('I should see the confirmation message {string}') do |message|
  expect(page).to have_content(message)
end
