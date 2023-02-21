Given /^on the homepage$/ do
  visit root_path
end

When /^some user signs up$/ do
	click_link "Sign Up"
end

And /^enters email$/ do
  fill_in "Email",    with: "user@example.com"
  fill_in "Password", with: "examplePassword"
  fill_in "Password confirmation", with: "examplePassword"
end

Then /^he clicks sign up$/ do
  click_button "Sign up"
end

Given /^I am logged in as an admin and on home page$/ do
  visit root_path  
end

Then /^I can see New Event$/ do
  page.should have_content("New Event")
end

When /^I click Create Event$/ do
  click_link "New Event"
end

Then /^I am taken to the show page about the event$/ do
  page.should have_content("Title")
end