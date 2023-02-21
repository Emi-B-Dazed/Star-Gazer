Feature: Favorite Events
    As a user
    I want to be able to add and edit my favorite events
    So that I can see my favorite events in the event viewer.

   
    Scenario:
        Given on the homepage
        When some user signs up
        And enters email
        Then he clicks sign up
        When I visit my profile
        Then I should see my favorited events in the event viewer
