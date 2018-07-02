Feature: Visitor Sign Up
  As a user
  In order to register an account
  I need to be able to write in my user details and register

  Background:
    Given the following user exists
      | email                  | password    | password_confirmation |
      | cutie123@hotmail.com   | hello123    | hello123              |
    When I visit the "Landing" page
    And I click "Sign up"

  Scenario: Visitor fills in all fields correctly [Happy Path]
    When I fill in "Email" with "hotmale@hotmail.com"
    And I fill in "Password" with "whatever"
    And I fill in "Password confirmation" with "whatever"
    And I click "Sign up"
    Then I should have an account with email "hotmale@hotmail.com" saved in the database
    And I should be redirected to the "Landing" page
    And I should see "Welcome! You have signed up successfully."

  Scenario: Visitor fills in all fields except Password [Sad Path]
    When I fill in "Email" with "hotmale@hotmail.com"
    And I click "Sign up"
    Then I should see "1 error prohibited this user from being saved:"
    And I should see "Password can't be blank"

  Scenario: Visitor fills in all fields except Password Confirmation [Sad Path]
    When I fill in "Email" with "hotmale@hotmail.com"
    And I fill in "Password" with "whatever"
    And I click "Sign up"
    Then I should see "1 error prohibited this user from being saved:"
    And I should see "Password confirmation doesn't match Password"

  Scenario: Visitor fills in all fields except Email [Sad Path]
    When I fill in "Password" with "whatever"
    And I fill in "Password confirmation" with "whatever"
    And I click "Sign up"
    Then I should see "1 error prohibited this user from being saved:"
    And I should see "Email can't be blank"

  Scenario: Visitor fills in all fields with invalid email [Sad Path]
    When I fill in "Email" with "hotmale"
    When I fill in "Password" with "whatever"
    And I fill in "Password confirmation" with "whatever"
    And I click "Sign up"
    Then I should see "1 error prohibited this user from being saved:"
    And I should see "Email is invalid"

  Scenario: Visitor fills in all fields with invalid password [Sad Path]
    When I fill in "Email" with "hotmale@hotmail.com"
    When I fill in "Password" with "what"
    And I fill in "Password confirmation" with "what"
    And I click "Sign up"
    Then I should see "1 error prohibited this user from being saved:"
    And I should see "Password is too short (minimum is 6 characters)"

  Scenario: Visitor fills in all fields with taken email [Sad Path]
    When I fill in "Email" with "cutie123@hotmail.com"
    When I fill in "Password" with "whatever"
    And I fill in "Password confirmation" with "whatever"
    And I click "Sign up"
    Then I should see "1 error prohibited this user from being saved:"
    And I should see "Email has already been taken"

  Scenario: Visitor does not fill in any fields [Sad Path]
    When I click "Sign up"
    Then I should see "2 errors prohibited this user from being saved:"
    And I should see "Email can't be blank"
    And I should see "Password can't be blank"
