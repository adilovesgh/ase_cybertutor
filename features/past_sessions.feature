Feature: past sessions

  As a student or tutor
  So that I can manage my schedule better
  I need the past sessions to be separated from normal sessions

Scenario: Approved past session is in the right table
  Given that I am creating an approved past session
  When I click on View your sessions
  Then I should see "Jeff Harper"
  And I should see "Past Sessions" before "Jeff Harper"

  When I change to be logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  When I click on View your sessions
  Then I should see the 2nd "Past Sessions" before "Jack Palmer"

Scenario: Unapproved past session is not visible
  Given that I am creating an unapproved past session
  When I click on View your sessions
  Then I should not see "Jeff Harper"

  When I change to be logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  When I click on View your sessions
  Then I should not see "Jack Palmer"