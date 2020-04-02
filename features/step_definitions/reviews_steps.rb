# require 'uri'
# require 'cgi'
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given("I am logged in with name {string} and email {string}") do |string, string2|

end

When("I click on {string}") do |string|
  click_link(string)
end

Then("I should see All Reviews for {string}") do |string|
  page.should have_content("All Reviews for " + string)
end

When("I click on Leave a review") do
  click_link("Leave a review")
end

When("I select a rating of {string}") do |string|
  select string, from: "review_rating"
end

When("I fill in a comment of {string}") do |string|
  fill_in "review_comment", with: string
end

When("I click Save Changes") do
  click_button("Save Changes")
end

Then("I should see {string} for the comment") do |string|
  page.should have_content(string)
end

Then("I should see {string} for the rating") do |string|
  page.should have_content(string)
end