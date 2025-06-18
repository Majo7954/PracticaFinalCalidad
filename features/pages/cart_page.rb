# features/pages/cart_page.rb
class CartPage
  include Capybara::DSL

  def visit_products_and_add_first_product
    visit 'https://www.saucedemo.com/inventory.html'
    find(:xpath, "(//button[contains(text(),'Add to cart')])[1]").click
  end

  def open_cart
    find(:xpath, "//a[@class='shopping_cart_link']").click
  end

  def remove_product
    find(:xpath, "//button[contains(@data-test, 'remove-')]").click
  end

  def is_cart_empty?
  puts "🛒 Total en carrito: #{cart_count}"
  on_cart_page? && cart_count == 0
  end

  def continue_shopping
    find(:xpath, "//button[text()='Continue Shopping']").click
  end

  def on_products_page?
    has_xpath?("//span[text()='Products']") &&
      has_button?("Add to cart")
  end

  def proceed_to_checkout
    find(:xpath, "//button[text()='Checkout']").click
  end

  def on_checkout_info_page?
    has_xpath?("//span[text()='Checkout: Your Information']")
  end

  def on_cart_page?
    has_xpath?("//span[text()='Your Cart']")
  end

  def cart_count
    all(:xpath, "//div[@class='cart_item']").size
  end
end
