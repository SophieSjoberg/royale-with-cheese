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

  Scenario:
    When I visit the "Shop" page
    And I click on "Add to Order" on "T-shirt"
    Then a cart should be created for me
    And the cart should contain "T-shirt"
    Then I should be redirected to the "Shop" page
    And I should see "T-shirt has been added to cart"

  Scenario: User can add a second product to the cart
    When I visit the "Shop" page
    Given there is a cart with cart item "Mug"
    And I click on "Add to Order" on "Gloves"
    Then I should have "2" products in my cart
    Then the cart should contain "Mug"
    And the cart should contain "Gloves"
    Then I should be redirected to the "Shop" page
    And I should see "Gloves has been added to cart"
