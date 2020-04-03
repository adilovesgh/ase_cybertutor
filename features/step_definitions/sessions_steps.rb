# require 'uri'
# require 'cgi'
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

When("I click on View your sessions") do
  click_link("View your sessions")
end

Then("I should see Sessions for learning") do
  page.should have_content("Sessions for learning")
end

Then("I should see Sessions for teaching") do
  page.should have_content("Sessions for teaching")
end

Then("I should see a link to Set up a new session to learn") do
  page.should have_content("Set up a new session to learn")
end

When("I click on Sign up for a session") do
  click_link("Sign up for a session")
end

When("I enter {string},{int},{int},{int},{string},{int},{int}") do |string, int, int2, int3, string2, int4, int5|
  select string.capitalize, from: "session_month"
  select int, from: "session_day"
  select int2, from: "session_start_hour"
  select int3, from: "session_start_minute"
  select string2.downcase, from: "session_start_ampm"
  select int4, from: "session_hours"
  select int5, from: "session_minutes"
end


When("I click Book Changes") do
  click_button("Book Changes")
end

Then("I should see link {string}") do |string|
  page.should have_link string
end

When("I press on link {string}") do |string|
  click_link string
end

Then("I should not see link {string}") do |string|
  page.should_not have_link string
end

When("I enter credit card informations {string} {string} {string}") do |string, string2, string3|
  pending #We have to figure out how to interact with the stripe app, but this is where we would enter in our credit card info
end


When("I click {string}") do |string|
  click_button(string)
end

