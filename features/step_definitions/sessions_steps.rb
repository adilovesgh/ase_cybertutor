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

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  temp = page.body.split(e2)
  expect(temp[0].include? e1).to eq true
end

Then /I should see the 2nd "(.*)" before "(.*)"/ do |e1, e2|
  temp = page.body.split(e2)
  temp1 = temp[0].split(e1)
  expect(temp1.length == 3).to eq true
end

Then("I should see Sessions for Learning") do
  page.should have_content("Sessions for Learning")
end

Then("I should see Sessions for Teaching") do
  page.should have_content("Sessions for Teaching")
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
  @acct.price_cents += 5000
  @acct.save
  visit '/'  
  click_link "My Account"
end

When("I click {string}") do |string|
  click_button(string)
end

