require "rails_helper"

RSpec.describe Event, type: :model do
    context "validation tests" do
        it "Ensures title is present" do
            date = Date.new(2024, 1, 2)
            event = Event.new(description: "description", happens_at: date, tag: "tag", optimal_location: "Optimal Location", public_bool: true)
            expect(event.valid?).to eq(false)
        end

        it "Ensures description is present" do
            date = Date.new(2024, 1, 2)
            event = Event.new(title: "title", happens_at: date, tag: "tag", optimal_location: "Optimal Location", public_bool: true)
            expect(event.valid?).to eq(false)
        end

        it "Ensures happens_at is present" do
            date = Date.new(2024, 1, 2)
            event = Event.new(title: "title", description: "description", tag: "tag", optimal_location: "Optimal Location", public_bool: true)
            expect(event.valid?).to eq(false)
        end

        it "Ensures tag is present" do
            date = Date.new(2024, 1, 2)
            event = Event.new(title: "title", description: "description", happens_at: date, optimal_location: "Optimal Location", public_bool: true)
            expect(event.valid?).to eq(false)
        end

        it "Ensures optimal location is present" do
            date = Date.new(2024, 1, 2)
            event = Event.new(title: "title", description: "description", happens_at: date, tag: "tag", public_bool: true)
            expect(event.valid?).to eq(false)
        end

        it "Ensures public bool is present" do
            date = Date.new(2024, 1, 2)
            event = Event.new(title: "title", description: "description", happens_at: date, tag: "tag", optimal_location: "Optimal Location")
            expect(event.valid?).to eq(false)
        end

        it "Can Save if Valid" do
            date = Date.new(2024, 1, 2)
            event = Event.new(title: "title", description: "description", happens_at: date, tag: "tag", optimal_location: "Optimal Location", public_bool: true)
            expect(event.save).to eq(true)
        end
    end
end
        


