Then('debería ver una lista de productos disponibles') do
  expect(page).to have_css('.inventory_item', minimum: 1)
end

When('ordeno los productos por {string}') do |criterio|
  find('.product_sort_container').select(criterio)
end

Then('debería ver el primer producto con nombre {string}') do |nombre_producto|
  primer_producto = all('.inventory_item_name').first
  expect(primer_producto.text).to eq(nombre_producto)
end
