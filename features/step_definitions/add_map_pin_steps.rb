When /^I click the add pin button$/ do
    visit root_path
end

Then /^I should be able to click on the map or enter an adress to add a pin$/ do
    expect(page).to have_content("Where do you want to place pin?")
end
