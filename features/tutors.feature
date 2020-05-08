Feature: tutor a new subject

  As a new tutor
  So that I can start teaching
  I want to sign up to tutor a new subject

Background: 

  Given that I am logged in with name "Jeff Harper" and email "j@b.com" and password "password"

 Scenario: add a new subject to tutor
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
  Then I should see All Subjects "Jeff Harper" Teaches
  And I should see "Science"
  And I go to the subjects page
  And I click on Tutors for "Science"
  And I should see "Jeff Harper"

Scenario: a non-reviewer cannot approve a tutor for a subject
  And I press on "Account"
  When I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Sign up to tutor "Science"
  
  And I should not see "Tutor Requests"
  And I go to "tutor_requests" page
  And I press on "Approve Tutor"
  Then I should see "You do not have authority to approve a tutor!"

Scenario: the reviewer cannot approve their own teach a subject requests
  And I change to be logged in with name "Admin" and email "admin@admin.com" and password "password"
  And I press on "Account"
  When I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Sign up to tutor "Science"

  And I press on "Tutor Requests"
  And I press on "Approve Tutor"
  Then I should see "You cannot approve yourself!"
