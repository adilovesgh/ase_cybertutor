Feature: view all tutors

  As a student of the tutoring website
  So that I can get a tutoring session in real time
  I want to view current tutors

Scenario: see link for subject tutors

  Given I am on the subjects page
  When I see "Math" as a subject title
  Then I should be able to click on "Tutors for Math"

Scenario: see all tutors for a subject

  Given "Math" is a subject title
  When I click on "Tutors for Math"
  Then I should see all tutors for "Math"
