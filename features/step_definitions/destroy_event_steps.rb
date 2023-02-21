When /^I am on account page$/ do
    visit edit_user_registration_path
end

Then /^the event has a destroy button$/ do
    page.should have_content("Destroy")
end
