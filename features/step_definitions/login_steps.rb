Given('I am on the login page of SauceDemo') do
  visit 'https://www.saucedemo.com'
end

When('I login with username {string} and password {string}') do |username, password|
  fill_in 'user-name', with: username
  fill_in 'password', with: password
  click_button 'Login'
end

Then('I should be redirected to the inventory page') do
  expect(URI.parse(current_url).path).to eq('/inventory.html')
end

Then('I should not be redirected to the inventory page') do
  expect(URI.parse(current_url).path).not_to eq('/inventory.html')
end

Then('I should see an error message {string}') do |expected_message|
  expect(page).to have_content(expected_message)
end

Then('I should remain on the login page') do
  expect(URI.parse(current_url).path).to eq('/')
end

When('I reload the page') do
  visit current_url
end
