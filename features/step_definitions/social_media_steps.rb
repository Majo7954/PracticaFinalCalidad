require_relative '../pages/footer_page'

Before('@social') do
  @footer = FooterPage.new
end

Then('the Twitter icon should link to {string}') do |expected_url|
  actual_url = @footer.social_icon_href(:twitter)
  expect(actual_url).to eq(expected_url)
end

Then('the Facebook icon should link to {string}') do |expected_url|
  actual_url = @footer.social_icon_href(:facebook)
  expect(actual_url).to eq(expected_url)
end

Then('the LinkedIn icon should link to {string}') do |expected_url|
  actual_url = @footer.social_icon_href(:linkedin)
  expect(actual_url).to eq(expected_url)
end
