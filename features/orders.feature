Feature: User can add products to order
  As a user
  In order for me to buy merchandise
  I would like to be able to add products to my order

  Background:
    Given the following products exist
      | title   | description   | price |
      | T-shirt | Blue t-shirt  | 50    |
      | Mug     | Nice mug      | 20    |
      | Gloves  | Stay warm     | 25    |

  Scenario: User can add a product to the cart
    When I visit the "Shop" page
    And I click on "Add to Order" for "T-shirt"
    Then an order should have been created in the database
    And "T-shirt" should be an order item
    Then I should be redirected to the "Shop" page
    And I should see "T-shirt has been added to your order"

  Scenario: User can add a second product to the cart
    When I visit the "Shop" page
    Given there is an order with order item "Mug"
    And I click on "Add to Order" for "Gloves"
    Then I should have "2" products in my order
    Then "Mug" should be an order item
    And "Gloves" should be an order item
    Then I should be redirected to the "Shop" page
    And I should see "Gloves has been added to your order"
