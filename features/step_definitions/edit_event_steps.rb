Given /^I am logged in$/ do
    user = FactoryBot.create(:user)
    login_as(user)
end
When /^I am on edit account page$/ do
    visit edit_user_registration_path
end

Then /^the event has an edit button$/ do
    page.should have_content("Edit")
end
