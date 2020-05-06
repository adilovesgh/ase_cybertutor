Feature: notifications on my account

  As a student or tutor
  So that I know to check my sessions
  I would like a summary of the update on "My Account" page

Background:
  Given that I am logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I press on "Account"
  And I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Sign up to tutor "English"
  And I change to be logged in with name "Admin" and email "admin@admin.com" and password "password"
  And I press on "Tutor Requests"
  And I press on "Approve Tutor"
  
  And I change to be logged in with name "Jack Palmer" and email "jp@morgan.com" and password "password1"
  And I go to the subjects page
  When I click on Tutors for "English"
  And I click on "Jeff Harper"
  And I click on Sign up for a session
  And I enter "May",31,5,30,"pm",1,0
  And I click Book Changes

  Then I should see Sessions for Learning
  And I should see "Jeff Harper"
  And I should see "English"
  And I change to be logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I press on "Account"

Scenario: Tutor is notfied of a session request
  Then I should see "Jack Palmer has sent for a session approval"
  And I should see "New Notification"
  When I click on View your sessions
  Then I should see "No Notification"
  When I click on "Account"
  Then I should not see "Jack Palmer has sent for a session approval"

Scenario: student is notfied of an approve session
  When I click on View your sessions
  Then I should see link "Approve"
  When I press on link "Approve"
  Then I should not see link "Approve"

  When I change to be logged in with name "Jack Palmer" and email "jp@morgan.com" and password "password1"
  Then I should see "Jeff Harper has accepted the session"
  And I should see "New Notification"
  When I click on View your sessions
  And I click on "Account"
  Then I should not see "Jeff Harper has accepted the session"
  And I should see "No Notification"

Scenario: student is notfied of a declined session
  When I click on View your sessions
  Then I should see link "Reject"
  When I press on link "Reject"
  Then I should not see link "Reject"

  When I change to be logged in with name "Jack Palmer" and email "jp@morgan.com" and password "password1"
  Then I should see "Jeff Harper has rejected the session. Balance of $20 has been returned to your account."
  And I should see "New Notification"
  When I click on View your sessions
  And I click on "Account"
  Then I should not see "Jeff Harper has rejected the session. Balance of $20 has been returned to your account."
  And I should see "No Notification"
