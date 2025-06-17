# features/pages/products_page.rb
class ProductsPage
  include Capybara::DSL

  def listed_products?
    has_css?('.inventory_item')
  end

  def product_count
    all('.inventory_item').size
  end

  def product_displayed?(name, price)
    has_css?('.inventory_item_name', text: name) &&
      has_css?('.inventory_item_price', text: price)
  end

  def add_to_cart(product_name)
    find('div.inventory_item', text: product_name).find('button', text: 'Add to cart').click
  end

  def cart_count
    find('.shopping_cart_badge').text
  end

  def sort_by(criteria)
    select criteria, from: 'product_sort_container'
  end

  def first_product_name
    all('.inventory_item_name').first.text
  end
end
