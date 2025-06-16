require_relative '../pages/products_page'

Before do
  @products_page = ProductsPage.new
end

Then('I should be on the products page') do
  @products_page.verify_products_page
end

Then('I should see a list of available products') do
  expect(@products_page.product_names).not_to be_empty
end

Then('I should see exactly {int} products listed') do |expected_count|
  expect(@products_page.number_of_products).to eq(expected_count)
end

Then('I should see the product {string} with price {string}') do |name, price|
  expect(@products_page.has_product_with_price?(name, price)).to be true
end

When('I add the product {string} to the cart') do |product_name|
  @products_page.add_to_cart(product_name)
end

Then('the cart icon should show {string}') do |count|
  expect(@products_page.cart_icon_count).to eq(count.to_i)
end

When('I sort the products by {string}') do |criteria|
  @products_page.sort_by(criteria)
end

Then('the first product should be {string}') do |expected_name|
  expect(@products_page.first_product_name).to eq(expected_name)
end
