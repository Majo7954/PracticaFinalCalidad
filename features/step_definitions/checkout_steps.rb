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
  expect(page).not_to have_button('Finish')
end

When('I click on Finish') do
  click_button 'Finish'
end

Then('I should see the confirmation message {string}') do |message|
  expect(page).to have_content(message)
end

When('I click on Continue without filling the fields') do
  click_button 'Continue'
end

Then('I should see an error message indicating that fields are required') do
  expect(page).to have_content('Error: First Name is required')
  expect(page).to have_content('Error: Last Name is required')
  expect(page).to have_content('Error: Postal Code is required')
end

When('I enter my first name {string}, last name {string} and postal code {string} and click Continue') do |first_name, last_name, postal_code|
  fill_in 'first-name', with: first_name
  fill_in 'last-name', with: last_name
  fill_in 'postal-code', with: postal_code
  click_button 'Continue'
end

Then('I should see the information I entered on the checkout overview page') do
  expect(page).to have_content('First Name:')
  expect(page).to have_content('Last Name:')
  expect(page).to have_content('Postal Code:')
end

When('I click on Cancel on the checkout information page') do
  click_button 'Cancel'
end

Then('I should be redirected to the products page from the cart') do
  expect(page).to have_content('Products')
end

Then('I should be redirected to the products page from checkout overview') do
  expect(page).to have_content('Products')
end

When('I complete the checkout process by entering my details and clicking Finish') do
  fill_in 'first-name', with: 'Maria'
  fill_in 'last-name', with: 'Lopez'
  fill_in 'postal-code', with: '45678'
  click_button 'Continue'
  click_button 'Finish'
end

Then('I should see a confirmation message with "Thank you for your order!"') do
  expect(page).to have_content('Thank you for your order!')
end