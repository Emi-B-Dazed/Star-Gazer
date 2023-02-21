Then /^I should see a map with all of the events near me$/ do
    page.should have_content("Location")
end
