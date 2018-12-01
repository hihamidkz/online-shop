Feature: Basket
  A visitor of the online-store website
  Should have a shopping cart
  In order to see what he's chosen to purchase

  @basket01
  Scenario: basket01 - Opening the shopping cart
    Given I have added an item to my shopping cart
    When I click the shopping cart icon
    Then I go to the shopping cart page
    And I can see the products in my shopping cart
  
  @basket02
  Scenario: basket02 - Adding a product to basket
    Given I am on the product page
    When I click the add button
    Then The product is added to my shopping cart

  @basket03
  Scenario: basket03 - Removing a product from basket
    Given I have added an item to my shopping cart
    And I am on the shopping cart page
    When I click the remove item button
    Then The product is removed from my basket