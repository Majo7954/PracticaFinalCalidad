class LoginPage
  include Capybara::DSL

  def visit_page
    visit 'https://www.saucedemo.com'
  end

  def login_with(username, password)
    fill_in 'user-name', with: username
    fill_in 'password', with: password
    click_button 'Login'
  end

  def products_title_visible?
    has_xpath?("//span[@class='title' and text()='Products']")
  end

  def login_failed_message_visible?(expected_message)
    has_xpath?("//h3[@data-test='error' and contains(., '#{expected_message}')]")
  end

  def still_on_login_fields?
    has_xpath?("//input[@data-test='username']") && has_xpath?("//input[@data-test='password']")
  end

  def reload
    visit current_url
  end

  def number_of_visible_products
    all(:xpath, "//div[@class='inventory_item']").size
  end

  def all_products_have_name_and_price?
    all_items = all(:xpath, "//div[@class='inventory_item']")
    all_items.all? do |item|
      item.has_xpath?(".//div[@class='inventory_item_name']") &&
      item.has_xpath?(".//div[@class='inventory_item_price']")
    end
  end
end
