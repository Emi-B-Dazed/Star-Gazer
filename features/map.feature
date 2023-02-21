Feature: Map
    As a user
    I want to have an interactive map with locations of the events that are near me displayed
    So that I can see the locations of each of these events on a map and see how to get to them.

    Scenario: User sees map
        Given on the homepage
        Then I should see a map with all of the events near me
