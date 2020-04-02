Feature: log in

  As a new user
  So that I can view my sessions and tutors
  I want to log in

Scenario: to log in
  
  Given that I am logging in as "Jeff Harper" and email "j@b.com" and password "password"
  When I click the link to Log in
  And I fill in my email as "j@b.com"
  And I fill in my password as "password"
  And I press button "Save Changes"
  Then I should see Account for "Jeff Harper"

Scenario: check logged in

  Given that I am logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I press on "My Account"
  And I am on the account page
  Then I should see Account for "Jeff Harper"

Scenario: change user
  Given that I am logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I change to be logged in with name "Jack Palmer" and email "jp@morgan.com" and password "password1"
  And I press on "My Account"
  And I am on the account page
  Then I should see Account for "Jack Palmer"