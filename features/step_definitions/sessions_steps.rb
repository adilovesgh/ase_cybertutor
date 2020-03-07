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

When("I enter {string},{int},{int},{int},{string},{int},{int},{string}") do |string, int, int2, int3, string2, int4, int5, string3|
  select string.capitalize, from: "session_month"
  select int, from: "session_day"
  select int2, from: "session_start_hour"
  select int3, from: "session_start_minute"
  select string2.downcase, from: "session_start_ampm"
  select int4, from: "session_end_hour"
  select int5, from: "session_end_minute"
  select string3.downcase, from: "session_end_ampm"
end

When("I click Book Changes") do
  click_button("Book Changes")
end

Then("I should see Start time cannot be in the past") do
  page.should have_content("Start time cannot be in the past")
end