Feature: Get all Mutants works

  @mutant2
  Scenario: Validate Create a mutant
    When I create a mutant with
    | mutant_name   | power         | real_name     |
    | Hulk          | Anger         | Bruce         |
    Then the response code is "200"

  @mutant3
  Scenario: Validate Get a mutant
    When I retrieve the mutant with the id "2"
    Then the response code is "200"

  Scenario: Validate Update a mutant
    When I update a mutant with the id "(.*)" with
    | mutant_name   | power         | real_name     |
    | Hulk          | Anger         | Bruce         |
    Then the response code is "200"

  Scenario: Validate Delete a mutant
    When I delete the mutant with the id "(.*)"
    Then the response code is "200"

  @mutant3
  Scenario: Validate Get a mutant
    When I retrieve the mutant with the id "2"
    Then the response code is "200"

  @mutant3
  Scenario: Validate Update a mutant
    When I update a mutant with the id "(.*)" with
    | mutant_name   | power         | real_name     |
    | Hulk          | Anger         | Bruce         |
    Then the response code is "200"

  @mutant3
  Scenario: Validate Update a mutant
    When I update a mutant with the id "(.*)" to mutant name "(.*)", real name "(.*)", and power "(.*)"
    Then the response code is "200"

  @mutant3
  Scenario: Validate Delete a mutant
    When I delete the mutant with the id "(.*)"
    Then the response code is "200"

