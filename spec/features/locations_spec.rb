require 'rails_helper'
  
RSpec.feature "Locations", type: :feature do
    context "Create New Location" do
        before(:each) do
            user = FactoryBot.create(:user)
            login_as(user)
            
        end
        
        scenario "should be successful" do
            visit new_location_path
            fill_in "Name", with: "Test Name"
            fill_in "Latitude", with: "20.000000"
            fill_in 'Longitude', with: "20.000000"
            fill_in 'Pollution', with: "0"

            click_button "Create Location"
            expect(page).to have_content("Location was successfully created.")
        end

        scenario "should fail" do
            visit new_location_path

            click_button "Create Location"
            expect(page).to have_content("errors")
        end
    end

    context "Update Location" do
        before(:each) do
            user = FactoryBot.create(:user)
            login_as(user)
            @location = user.locations.create(name: "Test Name", latitude: "20.000000", longitude: "20.000000", pollution: "4")
            visit edit_location_path(@location)
        end
        
        scenario "should be successful" do
            click_button "Update Location"
            expect(page).to have_content("Location was successfully updated.")
        end
    
        scenario "should fail" do
            fill_in "Name", with: ""
            click_button "Update Location"
            expect(page).to have_content("error")
        end
      end
    
    context "Destroy Location" do
        before(:each) do
            user = FactoryBot.create(:user)
            login_as(user)
            @location = user.locations.create(name: "Test Name", latitude: "20.000000", longitude: "20.000000", pollution: "4")
            visit edit_user_registration_path
        end

        scenario "Should be successful" do
            click_button "Destroy"
            expect(page).to have_content("Location was successfully destroyed.")
        end
    end
end