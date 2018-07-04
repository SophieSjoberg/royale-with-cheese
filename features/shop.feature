Feature: User can access webshop page
  As a user
  In order to see products
  I would like to be able to visit the shop page

  Background:
    Given the following products exist
    Given the following products exist
      | title   | description   | price |
      | T-shirt | Blue t-shirt  | 50    |
      | Mug     | Nice mug      | 20    |
      | Gloves  | Stay warm     | 25    |

  Scenario: Visitor sees a list of products on the webshop page
    When I visit the "Landing" page
    And I click "Shop"
    Then I would like to see "T-shirt" with a description of "Blue t-shirt" and a price of "50.0" $
    And I would like to see "Mug" with a description of "Nice mug" and a price of "20.0" $
