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

Scenario: As a tutor, I should see a notification telling me I completed a session and money was added to my balance. The money should also be added to my balance
  Given that I am creating an approved past session
  And I press on "Account"
  Then I should see "Jack Palmer"
  And I should see "Session with Jeff Harper has been completed! Balance of $18.00 has been added to your account."
  And I should see "Balance: $68.00"

Scenario: As a student, I should see a notification telling if my tutor request has timed out. Money should also be added to my balance
  Given that I am creating an unapproved past session
  When I change to be logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  Then I should see "Jeff Harper"
  And I should see "Balance: $70.00"
  And I should see "Session request for a session with Jack Palmer has timed out. Balance of $20.00 has been returned to your account"