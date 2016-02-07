Feature: Regression basic Mutant API works

  @my_mutant @create
  Scenario: Validate Create a mutant
    When I create a mutant with mutant name "ec-mymutant", real name "ec-myname", and power "ec-mypower"
    Then the response code is "201"

  @my_mutant @retrieve
  Scenario: Validate Retrieve a mutant
    When I retrieve my mutant
    Then the response code is "200"

  @my_mutant @update
  Scenario: Validate Update a mutant
    When I update my mutant to mutant name "ec-mymutant1", real name "ec-myname1", and power "ec-mypower1"
    Then the response code is "200"

  @my_mutant @retrieve
  Scenario: Validate Get all mutants
    When I retrieve all mutants
    Then the response code is "200"

  @my_mutant @delete
  Scenario: Validate Delete a mutant
    When I delete my mutant
    Then the response code is "204"

  @retrieve @neg
  Scenario Outline: Validate Get a mutant that does not exist
    When I retrieve the mutant with the id <id>
    Then the response code is <code>

Examples:
  | id        | code  |
  | "9999999" | "404" |
  | "x"       | "404" |

  @retrieve @neg
  Scenario Outline: Validate Update a mutant that does not exist
    When I update a mutant with the id <id> to mutant name "Bob", real name "Bob", and power "Bob"
    Then the response code is <code>

Examples:
  | id        | code  |
  | "9999999" | "404" |
  | "x"       | "404" |

  @create @neg
  Scenario Outline: Validate Create a mutant with missing info
    Given I create a mutant with mutant name <mutant_name>, real name <real_name>, and power <power>
    Then the response code is "422"

Examples:
  | mutant_name    | real_name    | power         |
  | "ec-mymutant1" | "ec-myname1" | ""            |
  | "ec-mymutant1" | ""           | "ec-mypower1" |
  | ""             | "ec-mynam1"  | "ec-mypower1" |
