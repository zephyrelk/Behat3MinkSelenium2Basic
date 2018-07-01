Feature: Disambiguation
  Disambiguate from and too options
  As a website trip planner
  I need to be able see possible alternates for entries

  @mink:selenium2
  Scenario: Can get disambiguation for START when user enters ambiguous START point, Headed test
      Given I am on "Trip-Planner"
      And I fill in "from" with "Everett CC"
      And I fill in "to" with "Seattle"
      And I press "trip-submit"
      And I wait 2 seconds
      Then I should be on "https://www.soundtransit.org/Trip-Planner"
      And I should see "Plan your trip!"
      And I should see an "#disambiguate-results" element
      And I should see "We found several starting points for your search"
      And I should see "Did you mean?"

  @mink:selenium2
  Scenario: Can get disambiguation for END when user enters ambiguous END point, Headed test
      Given I am on "Trip-Planner"
      And I fill in "from" with "Everett CC"
      And I fill in "to" with "Seattle"
      And I press "trip-submit"
      And I wait 2 seconds
      And I click on an ".possible-1" element
      And I wait 2 seconds
      Then I should see "We found several ending points for your search"
      And I should see "Did you mean?"

  @mink:selenium2
  Scenario: Can disambiguate START and END and get trip options, Headed test
      Given I am on "Trip-Planner"
      And I fill in "from" with "Everett CC"
      And I fill in "to" with "Seattle"
      And I press "trip-submit"
      And I wait 2 seconds
      And I click on an ".possible-1" element
      And I wait 2 seconds
      And I click on an ".possible-1" element
      And I wait 2 seconds
      Then I should see an "#trip-data" element
      And I should see "Trip Options"
