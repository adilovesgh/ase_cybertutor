Feature: past sessions

  As a student or tutor
  So that I can manage my schedule better
  I need the past sessions to be separated from normal sessions

Background:
  Given that I am creating a past session

Scenario: add sessions
  When I click on View your sessions
  Then "Past Sessions" come before "a"