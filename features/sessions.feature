Feature: manage sessions

  As a student or tutor
  So that I can manage my sessions
  I want to add and review them

Scenario: view sessions

  Given that I am logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I press on "My Account"
  When I click on View your sessions
  Then I should see Sessions for learning
  And I should see Sessions for teaching
  And I should see a link to Set up a new session to learn

Scenario: add sessions
  Given that I am logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I press on "My Account"
  And I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Sign up to tutor "English"
  And I change to be logged in with name "Jack Palmer" and email "jp@morgan.com" and password "password1"
  And I go to the subjects page
  When I click on Tutors for "English"
  And I click on "Jeff Harper"
  And I click on Sign up for a session
  And I enter "May",31,5,30,"pm",1,0
  And I click Book Changes
  Then I should see Sessions for learning
  And I should see "Jeff Harper"
  And I should see "English"
  And I change to be logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I press on "My Account"
  When I click on View your sessions
  Then I should see Sessions for learning
  And I should see Sessions for teaching
  And I should see "Jack Palmer"
  And I should see "English"

Scenario: check valid month and day
  Given that I am logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I press on "My Account"
  And I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Sign up to tutor "English"
  And I change to be logged in with name "Jack Palmer" and email "jp@morgan.com" and password "password1"
  And I go to the subjects page
  When I click on Tutors for "English"
  And I click on "Jeff Harper"
  And I click on Sign up for a session
  And I enter "Jan",31,5,30,"pm",1,0
  And I click Book Changes
  Then I should see Start time cannot be in the past