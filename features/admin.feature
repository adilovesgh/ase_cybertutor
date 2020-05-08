Feature: admin

  As an admin
  So that I can control who teaches a subject
  I want to be able to approve tutor requests

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

Scenario: admin account gets created
  When I change to be logged in with name "Aseadmin" and email "aseadmin@aseadmin.com" and password "aseadmin"
  Then I should see "Admin"

Scenario: none admin cannot access the admin page
  Then I should not see "Admin"
  When I visit the admin page
  Then I should see "Only admins can enter the accounts page!"

Scenario: admin account can make other accounts reviewers and revoke the reviewer status
  When I change to be logged in with name "Aseadmin" and email "aseadmin@aseadmin.com" and password "aseadmin"
  Then I should see "Admin"

  When I press on "Admin"
  Then I should see "Jeff Harper"
  When I press on "Make Reviewer"
  Then I should not see "Make Reviewer"

  Then I should see "Revoke Reviewer"
  When I press on the second "revokereviewer"
  Then I should see "Make Reviewer"