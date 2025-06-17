require_relative '../pages/cart_page'

cart = CartPage.new

Given('I add a product to the cart') do
  cart.visit_products_and_add_first_product
end

When('I remove the product from the cart') do
  cart.remove_first_product
end

Then('the cart should be empty') do
  expect(cart.cart_empty?).to be true
end

When('I click on Continue Shopping') do
  cart.continue_shopping
end

Then('I should be redirected to the products page from the cart') do
  expect(cart.on_products_page?).to be true
end


When('I proceed to checkout from cart') do
  cart.go_to_checkout
end

Then('I should be taken to the checkout information page') do
  expect(cart.on_checkout_info_page?).to be true
end
