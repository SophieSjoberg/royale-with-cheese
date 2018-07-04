Feature: Customer can see a summary of their order and total price
  As a customer
  In order to see what I have ordered and a total price
  I would like be able to see a summary on an order details page

  Background:
    Given the following products exist
      | title   | description   | price |
      | T-shirt | Blue t-shirt  | 50    |
      | Mug     | Nice mug      | 20    |
      | Gloves  | Stay warm     | 25    |

    Given I visit the "Shop" page
    Given there is an order with order item "Mug"
    And I click on "Add to Order" for "Gloves"
    Then I should have "2" products in my order
    Then "Mug" should be an order item
    And "Gloves" should be an order item
    Then I should be redirected to the "Shop" page
    And I should see "Gloves has been added to your order"

  Scenario: Customer can access order page to see order summary and total price
    Given I visit the landing page
    And I click "Order"
    Then I should see "Order Summary"
    And I should see "Mug 20.0 $"
    And I should see "Gloves 25.0 $"
    And I should see "Total: 45.00 $"
