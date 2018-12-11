Feature: Product list page
  A visitor of the online-store website
	Should be able see an overview of products
	In order to select the one that fits his needs

  @plp01
  Scenario: plp01 - Navigating to the product list page
    Given I am on the home page
    When I select the product list page from the menu
    Then I am on the product list page

  @plp02
  Scenario: plp02 - Filtering on the product list page
    Given I am on a Product lister page
	When I select the filter (...)
	And I click the button to confirm filtering
    Then The page is filtered to only show (...) products
