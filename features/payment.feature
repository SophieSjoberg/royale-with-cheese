Feature: User can pay for products
As a user
In order for me to pay for my products
I would like to be able to perform a transaction

  Background:
    Given the following user exists
      | email                  | password    | password_confirmation |
      | cutie123@hotmail.com   | hello123    | hello123              |

  @javascript @stripe
  Scenario: User can perform transaction [Happy Path]
    Given I visit the "Landing" page
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "cutie123@hotmail.com"
    And I fill in stripe form field "Card number" with "4242 4242 4242 4242"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should be redirected to the "Landing" page
    And I should see "Your transaction was successful!"


  @javascript @stripe
  Scenario: Users card has a declined code [Sad Path]
    Given I visit the "Landing" page
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "cutie123@hotmail.com"
    And I fill in stripe form field "Card number" with "4000000000000002"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should not see "Your transaction was successful!"

  @javascript @stripe
  Scenario: Users card is expired [Sad Path]
    Given I visit the "Landing" page
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "cutie123@hotmail.com"
    And I fill in stripe form field "Card number" with "4000000000000069"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should not see "Your transaction was successful!"


  @javascript @stripe
   Scenario: Users card number is incorrect [Sad Path]
    Given I visit the "Landing" page
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "cutie123@hotmail.com"
    And I fill in stripe form field "Card number" with "4242424242424241"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should not see "Your transaction was successful!"


  @javascript @stripe
    Scenario: Users cvc is incorrect [Sad Path]
    Given I visit the "Landing" page
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "cutie123@hotmail.com"
    And I fill in stripe form field "Card number" with "4000000000000127"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should not see "Your transaction was successful!"


  @javascript @stripe
    Scenario: Processing error [Sad Path]
    Given I visit the "Landing" page
    When I click "Pay with Card" button
    And I fill in stripe form field "Email" with "cutie123@hotmail.com"
    And I fill in stripe form field "Card number" with "4000000000000119"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should not see "Your transaction was successful!"
