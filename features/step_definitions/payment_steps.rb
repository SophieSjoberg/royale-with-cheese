When("I click {string} button") do |button|
  click_button button
end

When("I fill in stripe form field {string} with {string}") do |field, value|
  sleep(2)
  @stripe_iframe = all('iframe[name=stripe_checkout_app]').last
  within_frame @stripe_iframe do
    fill_in field, with: value
  end
end

And(/^I submit the stripe form$/) do
  within_frame @stripe_iframe do
    find('.Section-button').click
  end
  sleep(10)
end

Then("I should be on the {string} page") do |string|
  visit root_path
end
