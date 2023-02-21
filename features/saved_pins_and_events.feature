Feature: Saved Pins and Events
  As an account holding user
  I want to have saved pins and events
  So that I can come back to them

  Scenario: User Saves a pinned location or event
    Given on the homepage
    When some user signs up
    And enters email
    Then he clicks sign up
    When I visit my profile
    Then it will show their saved pins and events
