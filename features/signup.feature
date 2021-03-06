Feature: Signup
In order to use the website
People should be able to signup

Scenario: good signup
	Given I am on the signup page
	And I fill in "name" with "name_1"
	And I fill in "password" with "password_1"
	And I fill in "user[password_confirmation]" with "password_1"
	And I fill in "email" with "myemail@server.com"
	When I press "Sign up"
	Then I should see "Your account has been created"
	
	
Scenario: bad signup
	Given I am on the signup page
	And I fill in "name" with "name_1"
	And I fill in "password" with "p"
	And I fill in "user[password_confirmation]" with "p2"
	And I fill in "email" with "myemail@server.com"
	When I press "Sign up"
	Then I should not see "Your account has been created"
	And I should see "Password doesn't match confirmation"
	And I should see "Password is too short"

