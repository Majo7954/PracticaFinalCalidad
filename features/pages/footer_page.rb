class FooterPage
  include Capybara::DSL

  def twitter_link
    find('a[href="https://twitter.com/saucelabs"]', visible: true)
  end

  def facebook_link
    find('a[href="https://www.facebook.com/saucelabs"]', visible: true)
  end

  def linkedin_link
    find('a[href="https://www.linkedin.com/company/sauce-labs/"]', visible: true)
  end
end
