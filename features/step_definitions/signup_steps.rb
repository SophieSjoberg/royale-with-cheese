Given("the following user exists") do |table|
  table.hashes.each do |user|
    create(:user, user)
  end
end

When("I click on the {string} button or link") do |element|
  click_link_or_button element
end

Then("I should have an account with email {string} saved in the database") do |email|
  user = User.last
  expect(user.email).to eq email
end

When("I fill in {string} with {string}") do |field, value|
  fill_in field, with: value
end

def page_path_from(page_name)
  case page_name.downcase
    when 'landing' then root_path
    when 'sign up' then new_user_registration_path
    when 'login' then new_user_session_path
    when 'webshop' then webshop_show_path
  end
end
