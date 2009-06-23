Feature: log in
	In order to log in
	People should be able to
	Enter their username and their password

Scenario: good log in
	Given I have initialized the database
	And I am on the homepage
	And I fill in "name" with "Yoann"
	And I fill in "password" with "meteore"

	When I press "Loggin"
	Then I should see "Logged = true"

Scenario: wrong username
	Given I have initialized the database
	And I am on the homepage
	And I fill in "name" with "Doesntexist"
	And I fill in "password" with "meteore"

	When I press "Loggin"
	Then I should see "Logged = false"

Scenario: wrong password
	Given I have initialized the database
	And I am on the homepage
	And I fill in "name" with "Yoann"
	And I fill in "password" with "undefined"

	When I press "Loggin"
	Then I should see "Logged = false"
