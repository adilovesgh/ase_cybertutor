Feature: add money to my balance
	As a student
	So that I can pay for my sessions
	I want to be able to add balance to my account

Background:
	Given that I am logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  	And I press on "Account"
  	Then I should see "$50"

Scenario: add $50 to my balance
	When I click on "Add Balance"
	Then I should see "Select Amount"
	And I should see "Payment Method"
	When I enter credit card informations "4242424242424242" "0222" "22222222"
	Then I should see "$100"

Scenario: withdraw money from my balance
	When I click on "Withdraw Balance"
	Then I should see "Withdraw"
	When I enter amount "30"
	And I click "Save Changes"
	Then I should see "Balance: $20.00"

Scenario: I cannot withdraw more money from than I have
	When I click on "Withdraw Balance"
	Then I should see "Withdraw"
	When I enter amount "100"
	And I click "Save Changes"
	Then I should see "You cannot withdraw more than your balance."

Scenario: I cannot withdraw invalid inputs
	When I click on "Withdraw Balance"
	Then I should see "Withdraw"
	When I enter amount "a"
	And I click "Save Changes"
	Then I should see "Please enter in a valid rate."

	When I enter amount "10.333333"
	And I click "Save Changes"
	Then I should see "Please enter in a valid rate."