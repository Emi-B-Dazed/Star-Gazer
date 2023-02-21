Feature: Account page
    As a User,
    I want to see my account page
    So that I can see my account details.

    Scenario: See account details
        Given on the homepage
        When some user signs up
        And enters email
        Then he clicks sign up
