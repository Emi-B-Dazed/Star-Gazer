When /^I click the login Button$/ do
    visit "/Login"
end

Then /^I should see the login page$/ do
    page.should have_content("Email")
end
