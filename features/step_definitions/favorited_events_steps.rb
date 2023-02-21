When /^I visit my profile$/ do
  click_link "Edit Profile"
end

Then /^I should see my favorited events in the event viewer$/ do
  page.should have_content("Favorited")
end
