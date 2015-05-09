Feature: Register as a new user
  In order to participate in the fame
  As a guest without an existing account
  I want to be able to create a new account

  Scenario: Visiting registration
    Given I'm not logged in
    When I visit a registration page
    Then I should see the registration form
