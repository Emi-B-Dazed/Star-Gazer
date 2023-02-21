require 'rails_helper'

RSpec.feature "Favorites", type: :feature do
    context "Create Favorite" do
        before(:each) do
            user = FactoryBot.create(:user)
            login_as(user)
            @event = user.events.create(title: "Test title", description: "Test content", happens_at: DateTime.new(2022, 1, 2), tag: "stars", optimal_location: "Colorado", public_bool: "true")
            visit event_path(@event)
        end

        scenario "Should Be Successful" do
            click_button "Favorite"
            expect(page).to have_content("Favorite event was successfully created.")
        end
    end

    context "Destroy Favorite" do
        before(:each) do
            user = FactoryBot.create(:user)
            login_as(user)
            @event = user.events.create(title: "Test title", description: "Test content", happens_at: DateTime.new(2022, 1, 2), tag: "stars", optimal_location: "Colorado", public_bool: "true")
            @favorite = @event.favorites.create!(user: user)
            visit event_path(@event)
        end

        scenario "Should be Successful" do
            click_button "Unfavorite"

            expect(page).to have_content("Favorite event was successfully destroyed.")
        end
    end
end