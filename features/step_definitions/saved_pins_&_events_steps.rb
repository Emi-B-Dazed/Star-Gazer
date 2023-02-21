When /^they open their account page$/ do
    visit root_path
end

Then /^it will show their saved pins and events$/ do
    page.should have_content("Favorited")
end
