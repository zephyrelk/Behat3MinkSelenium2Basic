Feature: Trip Planner Basic Use
  Get from point-A to Point-B
  As a website trip planner
  I need to be able see options from point-A to point-B

  Scenario: Homepage has basic elements on headless test
    Given I am on the homepage
    Then I should see "Plan your trip!"
    And I should see "Find Your Schedule"
    And I should see "Alerts"
    And I should see "Donuts"

  @mink:selenium2
  Scenario: Can enter Trip info on homepage real browser
    Given I am on the homepage
    When I fill in "from" with "Everett CC"
    And I fill in "to" with "Seattle"
    And I press "trip-submit"
    Then I should be on "https://www.soundtransit.org/Trip-Planner"
    And I should see "Trip Planner"
    And I should see an "#planner-form-container" element
    And I should see an "#trip-data" element

  @mink:selenium2
  Scenario: Can enter explicit trip info on Trip Planner page and get routes, real browser
      Given I am on "Trip-Planner"
      And I fill in "from" with "everett"
      And I fill in "to" with "Seatac Int'l-Terminal Arrivals, WA"
      And I press "trip-submit"
      And I wait 2 seconds
      Then I should be on "https://www.soundtransit.org/Trip-Planner"
      And I should see an "#trip-data" element
      And I should see "Trip Options"
