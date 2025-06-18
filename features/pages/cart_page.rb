# features/pages/cart_page.rb
class CartPage
  include Capybara::DSL

  def visit_products_and_add_first_product
    visit 'https://www.saucedemo.com/inventory.html'
    find(:xpath, "(//button[contains(text(),'Add to cart')])[1]").click
  end

  def go_to_cart
    find(:xpath, "//a[@class='shopping_cart_link']").click
  end

  def remove_first_product
    find(:xpath, "//button[contains(@data-test, 'remove-')]").click
  end

  def cart_empty?
    has_xpath?("//div[text()='Your Cart']") && !has_xpath?("//div[@class='cart_item']")
  end

  def continue_shopping
    find(:xpath, "//button[text()='Continue Shopping']").click
  end

  def on_products_page?
    has_xpath?("//span[text()='Products']") &&
      has_xpath?("//button[text()='Add to cart']")
  end

  def go_to_checkout
    find(:xpath, "//button[text()='Checkout']").click
  end

  def on_checkout_info_page?
    has_xpath?("//span[text()='Checkout: Your Information']")
  end
end
