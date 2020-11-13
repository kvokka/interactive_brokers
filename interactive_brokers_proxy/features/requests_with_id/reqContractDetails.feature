@concurrent
Feature: It should correctly process reqContractDetails request

  Scenario: Send request with correct data
    Given Add to payload next_valid_id
    And   Add to payload Contract
    |      attribute      |       value       |
    |               symbol|               AAPL|
    |             sec_type|                STK|
    |             currency|                USD|
    |         primary_exch|             ISLAND|
    When  Send payload as post to reqContractDetails
    Then  Status code is 200
    And   Is a valid JSON
    And   Nested in [contract] hash include
    |      attribute      |       value       |
    |               symbol|               AAPL|
    |         local_symbol|               AAPL|
    |             sec_type|                STK|
    |         primary_exch|             NASDAQ|

  Scenario: Send request with insufficient data, which is
    handled with appropriate error code
    Given Add to payload next_valid_id
    And   Add to payload Contract
      |      attribute      |       value       |
      |               symbol|               AAPL|
    When  Send payload as post to reqContractDetails
    Then  Status code is 200
    And   Is a valid JSON
    And   Id in [error,req_id] match
    And   Nested in [error] hash include
      |      attribute      |       value       |
      |                 from|            gateway|
      |                 code|                321|

  Scenario: Send request with incorrect data, which is
  handled with appropriate error code
    Given Add to payload next_valid_id
    And   Add to payload Contract
      |      attribute      |       value       |
      |               symbol|               AAPL|
      |             sec_type|                STK|
      |             currency|                USD|
      |         primary_exch|          ISLANDzzz|
    When  Send payload as post to reqContractDetails
    Then  Status code is 200
    And   Is a valid JSON
    And   Id in [error,req_id] match
    And   Nested in [error] hash include
      |      attribute      |       value       |
      |                 from|            gateway|
      |                 code|                200|

  Scenario: Send request with incorrect requested data
    Given Add to payload next_valid_id
    And   Add to payload Contract
      |      attribute      |       value       |
      |      unexcited_field|                 42|
    When  Send payload as post to reqContractDetails
    Then  Status code is 422
    And   Is a valid JSON
    And   Nested in [error] hash include
      |      attribute      |                             value                            |
      |                 from|                                                           gem|
      |              message|unknown keywords: unexcited_field. Check value at position "2"|

