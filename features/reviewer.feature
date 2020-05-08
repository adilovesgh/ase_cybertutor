Feature: reviewer

  As an reviewer
  So that I can expand the tutor network and have more fellow tutors
  I want to be able to approve other tutors

Background:
  Given that I am on the new accounts page
  And I fill in my name as "Jeff Harper"
  And I fill in my email as "j@b.com"
  And I fill in my password as "password"
  And I press button "Save Changes"
  Then I should see Account for "Jeff Harper"
  And I should not see "Tutor Requests"

  When I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Sign up to tutor "English"
  Then I should see "All Pending Subjects" before "English"

Scenario: reviewer accounts can approve subjects
  When I change to be logged in with name "John Palmer" and email "jp@morgan.com" and password "password"

  When I change to be logged in with name "Aseadmin" and email "aseadmin@aseadmin.com" and password "aseadmin"
  Then I should see "Admin"

  When I press on "Admin"
  Then I should see "Jeff Harper"
  When I press on the second "makereviewer"

  And I change to be logged in with name "John Palmer" and email "jp@morgan.com" and password "password"
  Then I should see "Tutor Requests"
  When I press on "Tutor Requests"
  Then I should see "All Tutor Requests"

  When I press on "Approve Tutor"
  And I change to be logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I click on Subjects you teach
  Then I should see "English" before "All Pending Subjects"

Scenario: reviewer cannot approve his or her own tutor request
  When I change to be logged in with name "Aseadmin" and email "aseadmin@aseadmin.com" and password "aseadmin"
  Then I should see "Admin"

  When I press on "Admin"
  Then I should see "Jeff Harper"
  When I press on "Make Reviewer"

  And I change to be logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  Then I should see "Tutor Requests"
  When I press on "Tutor Requests"
  Then I should see "All Tutor Requests"
  When I press on "Approve Tutor"
  Then I should see "You cannot approve yourself!"