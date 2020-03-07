Feature: view all subjects

Scenario: view subjects, not logged in

  Given I am on the home page
  When I click on All Subjects
  Then I should see All Subjects
  And I should see Log In

Scenario: view subjects, logged in

  Given that I am logged in with name "Jeff Harper" and email "j@b.com"
  When I click on Subjects you teach
  Then I should see All subjects "Jeff Harper" teaches
  And I should see a link to Register to tutor a subject
  And I should see a link to Back to account
