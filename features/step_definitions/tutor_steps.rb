# require 'uri'
# require 'cgi'
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

When("I click on Sign up to tutor {string}") do |string|
  if page.has_no_content?(string)
    click_link("Add new subject")
    fill_in "subject_name", with: string
    click_button("Save Changes")
  end
  click_link("Sign up to tutor " + string)
end

Then("I should see {string}") do |string|
  page.should have_content(string)
end

Then("I go to the subjects page") do  
  visit '/subjects'
end

Then("I click on Tutors for {string}") do |string|
  click_link("Tutors for " + string)
end

When("I go to {string} page") do |string|
  visit '/'+string
end

When("I enter {string} for the rate") do |string|
  fill_in "tutor_rate", with: string
end