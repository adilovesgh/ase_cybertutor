Feature: manage sessions

  As a student or tutor
  So that I can manage my sessions
  I want to add and review them

Background:
  Given that I am logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I press on "My Account"

Scenario: view sessions

  When I click on View your sessions
  Then I should see Sessions for learning
  And I should see Sessions for teaching
  And I should see a link to Set up a new session to learn

Scenario: add sessions
  When I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Sign up to tutor "English"
  And I change to be logged in with name "Jack Palmer" and email "jp@morgan.com" and password "password1"
  And I go to the subjects page
  And I click on Tutors for "English"
  And I click on "Jeff Harper"
  And I click on Sign up for a session
  And I enter "May",31,5,30,"pm",1,0
  And I click Book Changes
  Then I should see "Order Summary"
  When I enter credit card informations "4242 4242 4242 4242" "123" "12/2021"
  And I click "Complete Purchase"
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
  When I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Sign up to tutor "English"
  And I change to be logged in with name "Jack Palmer" and email "jp@morgan.com" and password "password1"
  And I go to the subjects page
  And I click on Tutors for "English"
  And I click on "Jeff Harper"
  And I click on Sign up for a session
  And I enter "Jan",31,5,30,"pm",1,0
  And I click Book Changes
  Then I should see "Start time cannot be in the past"

Scenario: check valid session request
  When I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Sign up to tutor "English"
  And I go to the subjects page
  And I click on Tutors for "English"
  And I click on "Jeff Harper"
  And I click on Sign up for a session
  And I enter "Jan",31,5,30,"pm",1,0
  And I click Book Changes
  Then I should see "You cannot sign up for your own tutoring sessions"

Scenario: check it is not for 0 minutes
  When I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Sign up to tutor "English"
  And I change to be logged in with name "Jack Palmer" and email "jp@morgan.com" and password "password1"
  And I go to the subjects page
  And I click on Tutors for "English"
  And I click on "Jeff Harper"
  And I click on Sign up for a session
  And I enter "Dec",31,5,30,"pm",0,0
  And I click Book Changes
  Then I should see "Cannot sign up for 0 minutes"

Scenario: check to make sure I cannot book session for times where I already have a booked session
  When I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Sign up to tutor "English"
  And I change to be logged in with name "Jack Palmer" and email "jp@morgan.com" and password "password1"
  And I go to the subjects page
  And I click on Tutors for "English"
  And I click on "Jeff Harper"
  And I click on Sign up for a session
  And I enter "Aug",31,5,30,"pm",1,0
  And I click Book Changes
  Then I should see "Order Summary"
  When I enter credit card informations "4242 4242 4242 4242" "123" "12/2021"
  And I click "Complete Purchase"

  And I go to the subjects page
  When I click on Tutors for "English"
  And I click on "Jeff Harper"
  And I click on Sign up for a session
  And I enter "Aug",31,5,35,"pm",1,0
  And I click Book Changes
  Then I should see "You already have a session conflicting with this!"