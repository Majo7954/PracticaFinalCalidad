Given('I add a product to the cart') do
  visit 'https://www.saucedemo.com/inventory.html'
  find('.btn_inventory', match: :first).click
end

Given('I go to the cart page') do
  find('.shopping_cart_link').click
end

When('I remove the product from the cart') do
  click_button 'Remove'
end

Then('the cart should be empty') do
  expect(page).to have_content('Your Cart')
  expect(page).not_to have_selector('.cart_item')
end

When('I click on Continue Shopping') do
  click_button 'Continue Shopping'
end

Then('I should be redirected to the products page') do
  expect(current_url).to include('/inventory.html')
end

When('I click on Checkout') do
  click_button 'Checkout'
end

Then('I should be taken to the checkout information page') do
  expect(current_url).to include('/checkout-step-one.html')
end
