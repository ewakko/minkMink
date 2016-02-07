Feature: Regression basic term API works

  @my_term @create @1
  Scenario: Validate Create a term
    When I create a term with term beginning at "2014-08-23" and ends at "2015-08-23"
    Then the response code is "201"

  @my_term @retrieve @2
  Scenario: Validate Retrieve a term
    When I retrieve my term
    Then the response code is "200"

  @my_term @update @3
  Scenario: Validate Update a term
    When I update my term to begin at "2014-08-30" and end at "2015-08-30"
    Then the response code is "200"

  @my_term @retrieve @4
  Scenario: Validate Get all terms
    When I retrieve all terms
    Then the response code is "200"

  @my_term @delete @5
  Scenario: Validate Delete a term
    When I delete my term
    Then the response code is "204"
