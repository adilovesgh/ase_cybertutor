Feature: add money to my balance
	As a student
	So that I can pay for my sessions
	I want to be able to add balance to my account

Background:
	Given that I am logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  	And I press on "Account"
  	Then I should see "$50"
  	When I click on "Add Balance"
	Then I should see "Select Amount"
	And I should see "Payment Method"

Scenario: add $50 to my balance
	When I enter credit card informations "4242424242424242" "0222" "22222222"
	Then I should see "$100"