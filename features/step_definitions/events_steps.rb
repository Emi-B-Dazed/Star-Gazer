Given /^I open the main page$/ do
    visit root_path
end

Then /^I should see events$/ do
    expect(page).to have_content("Events")
end