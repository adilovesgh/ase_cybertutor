Feature: add subjects

  As an administrator or tutor
  I want to add a new subject
  So that I can help students learn that subject

Scenario: click on link to add new subject

  Given I am on the subjects page
  When I click on "Add new subject"
  Then I should see "Create New Subject"

Scenario: add new subject

  Given I am on create new subject page
  When I add "English" for the subject name
  And I press "Save Changes"
  Then I should redirect to the home page
  And I should see "English"
  And I should see a link to "Tutors for English"
