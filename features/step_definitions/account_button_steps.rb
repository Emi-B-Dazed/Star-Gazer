Given /^a user is on the homepage$/ do
    visit root_path
end

When /^a user visits the Log in page$/ do
	click_link "Log In"
end

