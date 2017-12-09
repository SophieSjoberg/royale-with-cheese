Feature: Movie generator
  As a user
  In order to find a good movie to watch
  I would like to be able to search for various criteria and generate some movie suggestions

  @tmdb
  Scenario:
    When I visit the landing page
    And I fill in "genre" with "action"
    And I click on "Search" button
    Then I should see "Thor: Ragnarok"
    And I should see "Sleight"

  @tmdb
  Scenario: User input wrong keywords
    When I visit the landing page
    And I fill in "genre" with "sadsadcomedy"
    And I click on "Search" button
    Then I should see "wrong entry"
