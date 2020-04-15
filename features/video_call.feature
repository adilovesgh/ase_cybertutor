Feature: video call with other users

  As a tutor and a student
  So that I can communicate better during a tutoring session
  I want a video call feature that allows me to video chat with other users.

Scenario: approve sessions
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
  Then I should see "Order Summary"
  When I enter credit card informations "4242 4242 4242 4242" "123" "12/2021"
  And I click "Complete Purchase"
  Then I should see Sessions for learning
  And I should see "Jeff Harper"
  And I should see "English"
  And I change to be logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I press on "My Account"
  When I click on View your sessions
  Then I should see link "Approve"
  And I should not see link "Join Room"
  When I press on link "Approve"
  Then I should not see link "Approve"
  And I should see link "Join Room"

  When I press on link "Join Room"
  Then I should see "Select a topic to start your call"