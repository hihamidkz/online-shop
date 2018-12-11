Feature: Account
	A visitor of the online-store website
	Should be able to sign in/sign up his account
	In order to work with the basket
	
	@acc01
	Scenario: acc01 - Successful Login
		Given I am not logged in
		And I am on the log in page
		When I enter my username
		And I enter my password
		And I click the login button
		Then I am logged in
		
	@acc02
	Scenario: acc02 - Unsuccessful Login
		Given I am not logged in
		And I am on the log in page
		When I enter wrong username
		And I enter wrong password
		And I click the login button
		Then I am not logged in
		And I see the notification that I've written wrong user data
		
	@acc03
	Scenario: acc03 - Logout
		Given I am logged in
		When I click the logout button
		Then I am logged out
		And I see the notification that I am logged out
		
	@acc04
	Scenario: acc04 - Successful Sign up
		Given I am not signed up
		When I click the sign up button
		Then I see sign up form
		When I write valid username and password
		Then I am successfully signed up
