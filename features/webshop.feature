Feature: User can access webshop page
  As a user
  In order to see products
  I would like to be able to visit the shop page

  Background:
    Given the following product exist
      | title   | description   | price |
      | T-shirt | Blue t-shirt  | 50    |
      | Mug     | Nice mug      | 20    |

  Scenario: Visitor sees a list of products on the webshop page
    When I visit the "Landing" page
    And I click on "Webshop" button or link
    Then I would like to see "T-shirt" with a description of "Blue t-shirt" and a price of "50" kr
    And I would like to see "Mug" with a description of "Nice mug" and a price of "20" kr
