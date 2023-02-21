Feature: Logout Button

    Scenario: 
        Given on the homepage
        When some user signs up
        And enters email
        Then he clicks sign up
        When I click on the logout button 
        Then I should be logged out and returned to the regular home page
