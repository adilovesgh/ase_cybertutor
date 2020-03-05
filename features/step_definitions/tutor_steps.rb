# require 'uri'
# require 'cgi'
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given("I am on the all tutors page for {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Given("I am on register new tutor page") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I add {string} for the name") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When("I add {string} for the years of experience") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When("I add {string} for the rate in dollars per hour") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When("I press {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should redirect to the all tutors page") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see {string} under {string}") do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

When("I see {string} as a subject title") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should be able to click on {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Given("{string} is a subject title") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see all tutors for {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end