Feature: Visitor Login
  As a visitor
  In order to access my account
  I would like to be able to sign in


  Background:
    Given the following user exists
       | email                | password    | password_confirmation |
       | hotmale@hotmail.com  | cutie123    | cutie123              |
    When I visit the "Landing" page
    And I click "Login"

  Scenario: Visitor fills in all fields [Happy Path]
    When I fill in "Email" with "hotmale@hotmail.com"
    And I fill in "Password" with "cutie123"
    And I click "Log in"
    Then I should be redirected to the "Landing" page
    And I should see "Logged in as, hotmale@hotmail.com"
    And I should see "Logout"
    And I should see "Signed in successfully."
    

  Scenario: Visitor does not fill in Email [Sad Path]
    When I fill in "Password" with "cutie123"
    And I click "Log in"
    Then I should see "Invalid Email or password."


  Scenario: Visitor does not fill in Password [Sad Path]
    When I fill in "Email" with "hotmale@hotmail.com"
    And I click "Log in"
    Then I should see "Invalid Email or password."


  Scenario: Visitor does not fill in both fields [Sad Path]
    When I click "Log in"
    Then I should see "Invalid Email or password."
