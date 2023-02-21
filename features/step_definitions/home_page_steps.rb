When /^I go to the Logo button$/ do
    visit root_path
end

Then /^I should see home page$/ do
    page.should have_content("Star Gazing")
end
