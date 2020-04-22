Feature: log in

  As a new user
  So that I can view my sessions and tutors
  I want to log in

Background:
  Given that I am logged in with name "Jeff Harper" and email "j@b.com" and password "password"

Scenario: to log in
  When I click thye link to Logout
  And I click the link to Log in
  And I fill in my email as "j@b.com"
  And I fill in my password as "password"
  And I press button "Save Changes"
  Then I should see Account for "Jeff Harper"

Scenario: check logged in
  
  When I press on "Account"
  And I am on the account page
  Then I should see Account for "Jeff Harper"

Scenario: change user
  When I change to be logged in with name "Jack Palmer" and email "jp@morgan.com" and password "password1"
  And I press on "Account"
  And I am on the account page
  Then I should see Account for "Jack Palmer"