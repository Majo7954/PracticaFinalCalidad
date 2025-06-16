class ProductsPage
  include Capybara::DSL

  def verify_products_page
    find(:xpath, "//span[text()='Products']")
  end

  def product_names
    all('.inventory_item_name').map(&:text)
  end

  def number_of_products
    all('.inventory_item').size
  end

  def has_product_with_price?(product_name, price)
    item = find(:xpath, "//div[@class='inventory_item'][.//div[text()='#{product_name}']]")
    item.has_text?(price)
  end

  def add_to_cart(product_name)
    find(:xpath, "//div[text()='#{product_name}']/ancestor::div[@class='inventory_item']//button").click
  end

  def cart_icon_count
    find('.shopping_cart_badge').text.to_i
  end

  def sort_by(criteria)
    select_element = find(:xpath, "//select[@data-test='product-sort-container']")
    select_element.select(criteria)
  end


  def first_product_name
    first('.inventory_item_name').text
  end
end
