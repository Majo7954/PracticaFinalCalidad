class CheckoutPage
  include Capybara::DSL

  def add_product_to_cart(product_name)
    find('div.inventory_item', text: product_name).find('button').click
  end

  def go_to_cart
    find('.shopping_cart_link').click
  end

  def click_checkout
    click_button('Checkout')
  end

  def fill_information(first, last, zip)
    fill_in 'First Name', with: first
    fill_in 'Last Name', with: last
    fill_in 'Zip/Postal Code', with: zip
  end

  def click_continue
    click_button('Continue')
  end

  def click_finish
    click_button('Finish')
  end

  def click_cancel
    click_button('Cancel')
  end

  def checkout_overview_displayed?
    page.has_current_path?(/checkout-step-two/, url: true) &&
    page.has_content?('Checkout: Overview')
  end

  def confirmation_message_displayed?(message)
    page.has_content?(message)
  end

  def redirected_to_cart?
    page.has_current_path?(/cart/, url: true)
  end

  def redirected_to_products?
    page.has_current_path?(/inventory/, url: true)
  end
end
