Feature: Manage dragons
  In order to interact other game elements and users
  As a logged in user
  I want to browse and create dragons

  Scenario: Visiting dragon list from the menu
    Given I'm logged in
    When I'm on the Dragon's page
    Then I should see the list of my dragons
