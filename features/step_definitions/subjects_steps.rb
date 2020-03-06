# require 'uri'
# require 'cgi'
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given("I am on the subjects page") do
  visit '/subjects'
end

When("I click on {string}") do |string|
  click_link string
end

Then("I should see {string}") do |string|
  page.should have_content(string)
end

Given("I am on create new subject page") do
  visit '/subjects/new'
end

When("I add {string} for the subject name") do |string|
  fill_in "subject_name", with: string
end

When("I press {string}") do |string|
  click_button(string)
end

Then("I should redirect to the home page") do
  current_path.should == '/subjects'
end

Then("I should see {string} under {string}") do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see a link to {string}") do |string|
  page.should have_link(string)
end

Then("I should see all subjects") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("I am on the all tutors page") do
  pending # Write code here that turns the phrase above into concrete actions
end