class SidebarPage
  include Capybara::DSL

  def open
    find('#react-burger-menu-btn').click
  end

  def click_logout
    find('a#logout_sidebar_link', visible: :all).click
  end

  def click_about
    find('a#about_sidebar_link', visible: :all).click
  end

  def redirected_to_login?
    URI.parse(current_url).path == '/'
  end

  def redirected_to?(expected_url)
    sleep 1
    current_url.include?(expected_url)
  end

  def click_all_items
    find('a#inventory_sidebar_link', visible: :all).click
  end

  def item_prices_incorrect?
    expected_prices = ["$29.99", "$9.99", "$15.99", "$49.99", "$7.99", "$39.99"]
    actual_prices = all('.inventory_item_price').map(&:text)
    puts "Visual_user prices: #{actual_prices}"
    actual_prices != expected_prices
  end

  def item_prices_change_each_time?
    first_prices = all('.inventory_item_price').map(&:text)
    puts "Primer conjunto de precios: #{first_prices}"
    click_all_items
    sleep 1
    second_prices = all('.inventory_item_price').map(&:text)
    puts "Segundo conjunto de precios: #{second_prices}"
    first_prices != second_prices
  end
end
