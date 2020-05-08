Feature: Change tutor rate

  As a tutor
  So that I can be flexible with my rate
  I want to be able to increase or decrease my rate per hour

Background: 

  Given that I am logged in with name "Jeff Harper" and email "j@b.com" and password "password"
  And I press on "Account"
  And I press on "Change Rate"
  Then I should see "New Rate"

 Scenario: add a new subject to tutor
  When I enter "30.00" for the rate
  And I press Save Changes
  Then I should see "$30.00/hr"

Scenario: enter in integer
  When I enter "40" for the rate
  And I press Save Changes
  Then I should see "$40.00/hr"

Scenario: enter in an invalid input
  When I enter "apple" for the rate
  And I press Save Changes
  Then I should see "Please enter in a valid rate"

  When I enter "11.111" for the rate
  And I press Save Changes
  Then I should see "Please enter in a valid rate"