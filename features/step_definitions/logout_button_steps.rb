When /^I click on the logout button$/ do
    visit root_path
    click_link "Sign Out"
end

Then /^I should be logged out and returned to the regular home page$/ do
    expect(page).to have_content("Signed out successfully.")
end
