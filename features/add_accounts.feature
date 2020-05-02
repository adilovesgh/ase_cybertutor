Feature: add accounts

  As a new tutor
  So that I can start teaching students
  I want to set up an account

Scenario: click on link to add new account

  Given I am on the accounts page
  When I click on Add new account
  Then I should see "New Account"

Scenario: add new account

  Given I am on create new accounts page
  When I add "Jeff Harper" for the account name
  And I add "jeffharper@abc.com" for the account email
  And I add "password" for the account password
  And I press Save Changes
  Then I should see "Jeff Harper"
