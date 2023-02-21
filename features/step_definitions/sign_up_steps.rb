Given /^I am on the homepage$/ do
    visit root_path
end

When /^I click the Signup Button$/ do
    expect(page).to have_content("Enter Email&password")
end
