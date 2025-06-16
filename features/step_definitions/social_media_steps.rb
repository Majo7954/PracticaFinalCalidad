require_relative '../pages/footer_page'

footer = FooterPage.new

Then('the Twitter icon should link to {string}') do |expected_url|
  expect(footer.twitter_link[:href]).to eq(expected_url)
end

Then('the Facebook icon should link to {string}') do |expected_url|
  expect(footer.facebook_link[:href]).to eq(expected_url)
end

Then('the LinkedIn icon should link to {string}') do |expected_url|
  expect(footer.linkedin_link[:href]).to eq(expected_url)
end
