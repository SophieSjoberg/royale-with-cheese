When("I click {string} button") do |button|
  click_link_or_button button
  sleep(2)
  @stripe_iframe = all('iframe[name=stripe_checkout_app]').last
end

When("I fill in stripe form field {string} with {string}") do |field, value|
  within_frame @stripe_iframe do
    fill_in field, with: value
  end
end

Then("show me the page") do
  save_and_open_page
end

And(/^I submit the stripe form$/) do
  within_frame @stripe_iframe do
    find('.Section-button').click
  end
  sleep(5)
end
