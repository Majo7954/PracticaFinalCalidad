Then('I should be on the products page') do
  expect(page).to have_content('Products')
end

Then('I should see a list of available products') do
  expect(all('.inventory_item').count).to be > 0
end

Then('I should see exactly {int} products listed') do |count|
  expect(all('.inventory_item').size).to eq(count)
end

Then('I should see the product {string} with price {string}') do |name, price|
  product = find('.inventory_item', text: name)
  expect(product).to have_content(price)
end

When('I add the product {string} to the cart') do |product_name|
  find('.inventory_item', text: product_name).find('button').click
end

Then('the cart icon should show {string}') do |count|
  expect(find('.shopping_cart_badge').text).to eq(count)
end

When('I sort the products by {string}') do |criterion|
  find('[data-test="product-sort-container"]').select(criterion)
end

Then('the first product should be {string}') do |product_name|
  first_name = first('.inventory_item_name').text
  expect(first_name).to eq(product_name)
end
