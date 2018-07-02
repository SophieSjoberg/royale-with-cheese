When('I visit the landing page') do
  visit root_path
end

Then('I should see {string}') do |text|
  expect(page).to have_content text
end

When('I click on {string} button') do |button|
  click_link_or_button button
end

Then('I should see a list of {string}') do |element|
  expect(page).to have_element element
end

Given('I visit the {string} page') do |page_name|
  visit page_path_from(page_name)
end

When('I click {string}') do |element|
  click_link_or_button element
end

Then('show me the page') do
  save_and_open_page
end

Then('I should be redirected to the {string} page') do |page_name|
  expect(page.current_path).to eq page_path_from(page_name)
end

def page_path_from(page_name)
  case page_name.downcase
  when 'landing' then root_path
  when 'sign up' then new_user_registration_path
  when 'login' then new_user_session_path
  when 'shop' then shop_show_path
  when 'order' then order_show_path
  end
end
