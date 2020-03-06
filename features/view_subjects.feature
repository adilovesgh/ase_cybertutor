Feature: view all subjects

Scenario: see subjects from subjects page

  Given I am on the subjects page
  Then I should see "All Subjects"

Scenario: go back to subjects page

  Given I am on the all tutors page
  When I click on "Back to subjects"
  Then I should see all subjects
