Feature: User can pay for products
  As a user
  In order to pay for products
  I would like to be able to purchase products with a transaction

  Background:
    Given the following user exists
      | email                  | password    | password_confirmation |
      | cutie123@hotmail.com   | hello123    | hello123              |

    And the following products exists in the system
      | product      | price  |
      | something    | $5     |

  @javascript
  Scenario: User can click on "purchase" link
    When I click on the "Shop" button or link
    Then I should be redirected to the "Shop" page
    And I should see "Buy this product"
    When I click on the "Buy" button or link
    And I click the "Pay with Card" stripe button
    And I fill in stripe form field "Card number" with "4242 4242 4242 4242"
    And I fill in stripe form field "CVC" with "123"
    And I fill in stripe form field "Expiry" with "12/2021"
    And I submit the stripe form
    Then I should be redirected to the "Shop" page
    And I should see "Thank you for your purchase"
