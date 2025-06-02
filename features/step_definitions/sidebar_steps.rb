When('I open the sidebar') do
  find('#react-burger-menu-btn').click
end

When('I click on "Logout"') do
  find('a#logout_sidebar_link', visible: :all).click
end

When('I click on "About"') do
  find('a#about_sidebar_link', visible: :all).click
end

Then('I should be redirected to the login page') do
  expect(page).to have_current_path('/', ignore_query: true)
end

Then('I should be redirected to {string}') do |expected_url|
  sleep 1 
  current = page.current_url
  expect(current).to include(expected_url)
end

When('I click on "All Items"') do
  find('a#inventory_sidebar_link', visible: :all).click
end

Then('the item prices should be incorrect') do
  expected_prices = ["$29.99", "$9.99", "$15.99", "$49.99", "$7.99", "$39.99"]

  actual_prices = all('div.inventory_item_price').map(&:text)

  puts "Visual_user prices: #{actual_prices}"

  expect(actual_prices).not_to eq(expected_prices)
end

Then('the item prices should change each time All Items is clicked') do
  initial_prices = all('div.inventory_item_price').map(&:text)
  puts "Primer conjunto de precios: #{initial_prices}"

  find('a#inventory_sidebar_link').click
  sleep 1 

  second_prices = all('div.inventory_item_price').map(&:text)
  puts "Segundo conjunto de precios: #{second_prices}"

  expect(second_prices).not_to eq(initial_prices)
end

