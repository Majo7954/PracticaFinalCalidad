class CheckoutPage
  include Capybara::DSL

  def fill_checkout_info(first_name, last_name, postal_code)
    fill_in 'first-name', with: first_name
    fill_in 'last-name', with: last_name
    fill_in 'postal-code', with: postal_code
  end

  def click_continue
    find(:xpath, "//input[@value='Continue']").click
  end

  def on_overview_page?
    has_xpath?("//span[text()='Checkout: Overview']") &&
      has_xpath?("//button[text()='Finish']")
  end

  def click_cancel
    find(:xpath, "//button[text()='Cancel']").click
  end

  def on_cart_page?
    has_xpath?("//span[text()='Your Cart']") &&
      has_xpath?("//button[text()='Continue Shopping']") &&
      !has_xpath?("//button[text()='Finish']")
  end

  def click_finish
    find(:xpath, "//button[text()='Finish']").click
  end

  def confirmation_message_visible?(message)
    has_content?(message)
  end

  def continue_without_filling_fields
    find(:xpath, "//input[@value='Continue']").click
  end

  def error_fields_required?
    has_content?('Error: First Name is required') &&
    has_content?('Error: Last Name is required') &&
    has_content?('Error: Postal Code is required')
  end

  def complete_checkout
    fill_checkout_info('Maria', 'Lopez', '45678')
    click_continue
    click_finish
  end

  def redirected_to_products_page?
    has_xpath?("//span[text()='Products']")
  end
end
