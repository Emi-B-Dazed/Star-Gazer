When /^I click on an event$/ do
    visit events_path
end

Then /^I should see detailed information on that event$/ do
    expect(page).to have_content("Description")
end