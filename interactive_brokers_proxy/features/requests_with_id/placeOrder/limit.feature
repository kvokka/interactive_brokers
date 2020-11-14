@concurrent
Feature: It should correctly process placeOrder request with Limit order
  details at https://interactivebrokers.github.io/tws-api/basic_orders.html#limitorder

  Scenario: Send request with correct data
    Given Add to payload next_id
    And   Add to payload Contract
      |      attribute      |       value       |
      |               symbol|               AAPL|
      |             sec_type|                STK|
      |             currency|                USD|
      |         primary_exch|             ISLAND|
      |             exchange|             ISLAND|
    And   Add to payload Order
      |      attribute      |       value       |
      |               action|                BUY|
      |           order_type|                LMT|
      |                  tif|                GTC|
      |       total_quantity|                100|
      |            lmt_price|                 30|
    When  Send payload as post to placeOrder
    Then  Status code is 200
    And   Is a valid JSON
    And   Argument 1 is nested Hash includes in path [contract]
      |      attribute      |       value       |
      |               symbol|               AAPL|
      |         local_symbol|               AAPL|
      |             sec_type|                STK|
      |         primary_exch|             NASDAQ|