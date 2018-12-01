Feature: Purchase
  A visitor of the online-store website
  Should be able to do a purchase
  In order to get the product that he wants

  @pur01
  Scenario: pur01 - Successful purchase
    Given I have added a product to my shopping cart
    When I proceed to the payment page
    And I enter valid delivery details
    And I select a payment method
    And I confirm the order
    Then I see the confirmation page

  @pur02
  Scenario: pur02 - Unsuccessful purchase
    Given I have added a product to my shopping cart
    When I proceed to the payment page
    And I enter invalid delivery details
    And I select a payment method
    And I confirm the order
    Then I see the notification that the details are incorrect