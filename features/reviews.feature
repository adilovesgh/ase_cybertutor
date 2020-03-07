Feature: reviews for tutors

  As a student
  So that I can evaluate my tutor's performance
  I want to add and view reviews for the tutor

Scenario: view reviews

  Given that I am logged in with name "Jeff Harper" and email "j@b.com"
  And I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Sign up to tutor "English"
  And I change to be logged in with name "Jack Palmer" and email "jp@morgan.com"
  And I go to the subjects page
  When I click on Tutors for "English"
  And I click on Reviews for "Jeff Harper"
  Then I should see All Reviews for "Jeff Harper"

Scenario: add reviews
  Given that I am logged in with name "Jeff Harper" and email "j@b.com"
  And I click on Subjects you teach
  And I click on Register to tutor a subject
  And I click on Sign up to tutor "English"
  And I change to be logged in with name "Jack Palmer" and email "jp@morgan.com"
  And I go to the subjects page
  When I click on Tutors for "English"
  And I click on Reviews for "Jeff Harper"
  And I click on Leave a review
  And I select a rating of "5"
  And I fill in a comment of "Wonderful tutor"
  And I click Save Changes
  Then I should see "Wonderful tutor" for the comment
  And I should see "5" for the rating
