Given('the following user exists') do |table|
  table.hashes.each do |user|
    create(:user, user)
  end
end

Then('I should have an account with email {string} saved in the database') do |email|
  user = User.last
  expect(user.email).to eq email
end

When('I fill in {string} with {string}') do |field, value|
  fill_in field, with: value
end
