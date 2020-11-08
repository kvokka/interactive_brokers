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
