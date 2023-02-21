require 'rails_helper'
  
RSpec.feature "Events", type: :feature do

    #Feature Clickable Events List
        context "The visitor should see events" do
            it "Sees Events on homepage" do
                visit root_path
                expect(page).to have_text("Events")
            end
        end

    #Feature Events Clicked
        context "Events should be clickable" do
            it "clicks on events" do
            visit root_path
            expect(page).to have_text("Events")
        end
    end
    
    #Feature Events Search

    #Feature Events Filter

    #Feature Events Viewpage
    context "The visitor should see edit events" do
        before(:each) do
            user = FactoryBot.create(:user)
            login_as(user)
          end
        it "Sees edit Events on Event view" do
            visit events_path
            expect(page).to have_text("Edit")
        end
    end

    context "The visitor should see the Event Description" do
        it "Sees Event Description in View" do
            "waiting for events clicked"
            visit events_path
            expect(page).to have_text("Description")
        end
    end

    context "The visitor should see the Event Location" do
        it "Sees Event Location in View" do
            visit events_path
            expect(page).to have_text("Location")
        end
    end

    context "Create new event" do
        before(:each) do
            user = FactoryBot.create(:user)
            login_as(user)
            
          end

        scenario "should be successful" do
            visit new_event_path
            fill_in "Title", with: "Test Title"
            fill_in "Description", with: "Test Description"
            fill_in 'Happens at', with: DateTime.new(2022, 1, 2)
            page.select 'Eclipses', from: 'Tag'
            fill_in 'Optimal location', with: "Test Location"
            page.select 'True', from: 'event_public_bool'

            click_button "Create Event"
            expect(page).to have_content("Event was successfully created.")
        end

        scenario "should fail" do
            visit new_event_path
            

            click_button "Create Event"
            expect(page).to have_content("errors")
        end

    end

    context "Update event" do
        before(:each) do
            user = FactoryBot.create(:user)
            login_as(user)
            @event = user.events.create(title: "Test title", description: "Test content", happens_at: DateTime.new(2022, 1, 2), tag: "stars", optimal_location: "Colorado", public_bool: "true")
            visit edit_event_path(@event)
        end
        
        scenario "should be successful" do
            click_button "Update Event"
            expect(page).to have_content("Event was successfully updated.")
        end
    
        scenario "should fail" do
            fill_in "Description", with: ""
            click_button "Update Event"
            expect(page).to have_content("error")
        end
      end
    
    context "Remove existing event" do
        before(:each) do
            user = FactoryBot.create(:user)
            login_as(user)
            @event = user.events.create(title: "Test title", description: "Test content", happens_at: DateTime.new(2022, 1, 2), tag: "stars", optimal_location: "Colorado", public_bool: "true")
            visit edit_user_registration_path
        end

        scenario "Should be successful" do
            click_button "Destroy"
            expect(page).to have_content("Event was successfully destroyed.")
        end


    end
 

end
