Feature: Product detail page
  A visitor of the online-store website
	May want to see the details of the product
  In order to know if the product fits his needs

  @pdp01
	Scenario: pdp01 - Product detail page
		Given I am on the product list page
		When I select one of the items
		Then I am on the Product detail page of the selected item
    And I can see details of the product