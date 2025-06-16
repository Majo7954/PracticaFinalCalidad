require_relative '../pages/sidebar_page'

sidebar_page = SidebarPage.new

When('I open the sidebar') do
  sidebar_page.open
end

When('I click on "Logout"') do
  sidebar_page.click_logout
end

When('I click on "About"') do
  sidebar_page.click_about
end

Then('I should be redirected to the login page') do
  expect(sidebar_page.redirected_to_login?).to be true
end

Then('I should be redirected to {string}') do |expected_url|
  expect(sidebar_page.redirected_to?(expected_url)).to be true
end

When('I click on "All Items"') do
  sidebar_page.click_all_items
end

Then('the item prices should be incorrect') do
  expect(sidebar_page.item_prices_incorrect?).to be true
end

Then('the item prices should change each time All Items is clicked') do
  expect(sidebar_page.item_prices_change_each_time?).to be true
end

Then('I see the SauceLabs homepage') do
  Capybara.using_wait_time(10) do
    expect(page).to have_xpath("//h1[contains(text(), 'Build apps users love with AI-driven insights')]")
  end
end

Then('I see the tabs and login in the top box') do
  expect(page).to have_xpath("//a[contains(text(), 'Solutions')]")
  expect(page).to have_xpath("//a[contains(text(), 'Pricing')]")
  expect(page).to have_xpath("//a[contains(text(), 'Sign in')]")
end

Then('I see the title {string}') do |expected_title|
  Capybara.using_wait_time(10) do
    expect(page).to have_selector('h1', text: expected_title)
  end
end

Then('I see an error {string} in the homepage') do |error_msg|
  expect(page).to have_content(error_msg)
end

Then('I see a green robot next to the message') do
  expect(page).to have_xpath("//img[contains(@src, '404') and contains(@alt, 'robot')]")
end

Then('Prices range from ${int} to ${int}') do |min, max|
  prices = all(:xpath, "//div[@class='inventory_item_price']").map { |p| p.text.gsub('$', '').to_f }
  expect(prices).not_to be_empty
  expect(prices.all? { |price| price >= min && price <= max }).to be true
end

Given('I am on the login page') do
  visit 'https://www.saucedemo.com/'
end
