Feature: log in

  As a new user
  So that I can view my sessions and tutors
  I want to log in

Scenario: to log in
  
  Given that I am logging in as "Jeff Harper"
  When I click the link to Log in to "Jeff Harper"
  And I fill in my username as "jeffharper"
  And I fill in my password as "abc"
  Then I should see Account for "Jeff Harper"

Scenario: check logged in

  Given that I am logged in with name "Jeff Harper" and email "j@b.com"
  And I am on the account page
  Then I should see Account for "Jeff Harper"

Scenario: change user
  Given that I am logged in with name "Jeff Harper" and email "j@b.com"
  And I change to be logged in with name "Jack Palmer" and email "jp@morgan.com"
  And I am on the account page
  Then I should see Account for "Jack Palmer"