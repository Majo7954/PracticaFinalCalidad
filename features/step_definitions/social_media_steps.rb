Then('the Twitter icon should link to {string}') do |expected_url|
  twitter = find('a[href="https://twitter.com/saucelabs"]', visible: true)
  expect(twitter[:href]).to eq(expected_url)
end

Then('the Facebook icon should link to {string}') do |expected_url|
  facebook = find('a[href="https://www.facebook.com/saucelabs"]', visible: true)
  expect(facebook[:href]).to eq(expected_url)
end

Then('the LinkedIn icon should link to {string}') do |expected_url|
  linkedin = find('a[href="https://www.linkedin.com/company/sauce-labs/"]', visible: true)
  expect(linkedin[:href]).to eq(expected_url)
end
