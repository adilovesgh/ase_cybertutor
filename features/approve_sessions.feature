Feature: approve and reject sessions

  As a tutor
  So that I can manage my schedule and not forced into unwanted sessions
  I want to be able to approve and reject sessions

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
  And I enter "May",31,5,30,"pm",1,5
  And I click Book Changes

  Then I should see Sessions for Learning
  And I should see "Jeff Harper"
  And I should see "English"
  And I change to be logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I press on "Account"
  When I click on View your sessions

Scenario: approve sessions
  Then I should see link "Approve"
  When I press on link "Approve"
  Then I should not see link "Approve"

Scenario: reject sessions
  Then I should see link "Reject"
  When I press on link "Reject"
  Then I should not see link "Reject"
  And I should not see link "Jeff Harper"

  When I change to be logged in with name "Jack Palmer" and email "jp@morgan.com" and password "password1"
  And I press on "Account"
  Then I should see "Balance: $50.00"

Scenario: schedule conflict check 
  Then I should see link "Approve"
  When I press on link "Approve"
  Then I should not see link "Approve"

  And I change to be logged in with name "Bob Bobby" and email "b@b.com" and password "password1"
  When I go to the subjects page
  And I click on Tutors for "English"
  And I click on "Jeff Harper"
  And I click on Sign up for a session
  And I enter "May",31,5,45,"pm",1,0
  And I click Book Changes

  And I change to be logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I press on "Account"
  When I click on View your sessions
  Then I should see link "Approve"
  When I press on link "Approve"
  Then I should see "Approving this will cause a scheduling conflict!"

Scenario: reject sessions gives back money
  Then I should see link "Reject"
  When I press on link "Reject"
  Then I should not see link "Reject"
  And I should not see link "Jeff Harper"

  When I change to be logged in with name "Jack Palmer" and email "jp@morgan.com" and password "password1"
  And I press on "Account"
  And I should see "$50"
