# features/step_definitions/cart_steps.rb

Given('I add a product to the cart') do
  @products_page ||= ProductsPage.new
  visit '/inventory.html'
  @products_page.add_to_cart('Sauce Labs Backpack')
end

Given('I go to the cart page') do
  @cart_page ||= CartPage.new
  @cart_page.open_cart
end

When('I remove the product from the cart') do
  @cart_page ||= CartPage.new
  @cart_page.remove_product
end

Then('the cart should be empty') do
  @cart_page ||= CartPage.new
  puts "Métodos disponibles en CartPage: #{@cart_page.methods.grep(/cart/)}"
  expect(@cart_page.is_cart_empty?).to be true
end

When('I click on Continue Shopping') do
  @cart_page ||= CartPage.new
  @cart_page.continue_shopping
end

Then('I should be redirected to the products page') do
  @cart_page ||= CartPage.new
  expect(@cart_page.on_products_page?).to be true
end

When('I click on Checkout') do
  @cart_page ||= CartPage.new
  @cart_page.proceed_to_checkout
end

Then('I should be taken to the checkout information page') do
  @cart_page ||= CartPage.new
  expect(@cart_page.on_checkout_info_page?).to be true
end
