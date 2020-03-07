Feature: tutor a new subject

  As a new tutor
  So that I can start teaching
  I want to sign up to tutor a new subject

Scenario: add a new subject to tutor

  Given that I am logged in with name "Jeff Harper" and email "j@b.com"
  When I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Sign up to tutor "Science"
  Then I should see All subjects "Jeff Harper" teaches
  And I should see "Science"
  And I go to the subjects page
  And I click on Tutors for "Science"
  And I should see "Jeff Harper"