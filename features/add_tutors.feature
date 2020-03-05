Feature: add tutors

  As an administrator
  So that I can increase the platform for tutoring
  I want to add a new tutor

Scenario: click on link to add new tutor

  Given I am on the all tutors page for "Math"
  When I click on "Add new tutor"
  Then I should see "Register a new tutor for Math"

Scenario: add new tutor

  Given I am on register new tutor page
  When I add "Albert Einstein" for the name
  And I add "50" for the years of experience
  And I add "20" for the rate in dollars per hour
  And I press "Save Changes"
  Then I should redirect to the all tutors page
  And I should see "Albert Einstein" under "Name"
  And I should see "50 years" under "Experience"
  And I should see "$20.00" under "Rate"
