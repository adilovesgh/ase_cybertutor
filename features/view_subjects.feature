Feature: view all subjects

  As an enthusiastic student
  So that I can learn online using the tutoring platform
  I want to see available subjects

Scenario: see subjects from subjects page

  Given I am on the subjects page
  Then I should see all subjects

Scenario: go back to subjects page

  Given I am on the all tutors page
  When I click on "Back to subjects"
  Then I should see all subjects
