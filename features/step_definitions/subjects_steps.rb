# require 'uri'
# require 'cgi'
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given("I am on the home page") do
  visit '/'
end

When("I click on All Subjects") do
  click_link("All Subjects")
end

Then("I should see All Subjects") do
  page.should have_content("All Subjects")  
end

Then("I should see Log In") do
  page.should have_content("Log In")
end

When("I click on Subjects you teach") do
  click_link("Subjects you teach")
end

Then("I should see All subjects {string} teaches") do |string|
  page.should have_content("All subjects " + string + " teaches")
end

Then("I should see a link to Register to tutor a subject") do
  page.should have_link("Register to tutor a subject")
end

Then("I should see a link to Back to account") do
  page.should have_link("Back to account")
end

When("I click on Register to tutor a subject") do
  click_link("Register to tutor a subject")
end

When("I click on Add new subject") do
  click_link("Add new subject")
end

When("I enter {string} as the name of the subject") do |string|
  fill_in "subject_name", with: string
end

When("I press Save Changes") do
  click_button("Save Changes")
end

Then("I should see Tutors for {string}") do |string|
  page.should have_content(string)
end