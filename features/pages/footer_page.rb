class FooterPage
  include Capybara::DSL

  SOCIAL_LINKS = {
    twitter:   'https://twitter.com/saucelabs',
    facebook:  'https://www.facebook.com/saucelabs',
    linkedin:  'https://www.linkedin.com/company/sauce-labs/'
  }

  def social_icon_href(platform)
    find("a[href='#{SOCIAL_LINKS[platform]}']", visible: true)[:href]
  end
end
