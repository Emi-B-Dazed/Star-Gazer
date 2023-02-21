Feature: Event Information
    As a user
    I want to see more information on an astrological event
    So that I can plan according to event information

    Scenario: User clicks an event
        Given on the homepage
        When I click on an event
        Then I should see detailed information on that event
