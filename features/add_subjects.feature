Feature: add subjects

  As a tutor
  I want to add a new subject
  So that I can help students learn that subject

Scenario: click on link to add new subject

  Given that I am logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I press on "My Account"
  When I click on Subjects you teach
  And I click on Register to tutor a subject
  Then I should see All Subjects

Scenario: add new subject

  Given that I am logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I press on "My Account"
  When I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Add new subject
  And I enter "Math" as the name of the subject
  And I press Save Changes
  Then I should see Tutors for "Math"