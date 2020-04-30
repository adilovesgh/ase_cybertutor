Feature: tutor a new subject

  As a new tutor
  So that I can start teaching
  I want to sign up to tutor a new subject

Scenario: add a new subject to tutor

  Given that I am logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I press on "Account"
  When I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Sign up to tutor "Science"

  And I change to be logged in with name "Admin" and email "admin@admin.com" and password "password"
  And I press on "Tutor Requests"
  And I press on "Approve Tutor"

  And I change to be logged in with name "Jeff Harpder" and email "j@b.com" and password "password"
  And I press on "Account"
  When I click on Subjects you teach
  Then I should see All subjects "Jeff Harper" teaches
  And I should see "Science"
  And I go to the subjects page
  And I click on Tutors for "Science"
  And I should see "Jeff Harper"