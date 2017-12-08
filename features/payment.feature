Feature: User can pay for products
As a user
In order for me to pay for my products
I would like to be able to perform a transaction

  Background:
    Given the following user exists
      | email                  | password    | password_confirmation |
      | cutie123@hotmail.com   | hello123    | hello123              |

  @javascript @stripe
  Scenario: User can perform transaction
    When I click "Pay with card" button
    And I fill in stripe form field "Email" with "cutie123@hotmail.com "
    And I fill in stripe form field "Card number" with "4242 4242 4242 4242"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should be redirected to the "Landing" page
    And I should see "Thank you for your purchase"
