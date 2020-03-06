# require 'uri'
# require 'cgi'
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given("I am on the accounts page") do
  visit '/accounts'
end

When("I click on Add new account") do
  click_link("Add new account")
end

Then("I should see Create New Account") do
  page.should have_content("Create New Account")
end

Given("I am on create new accounts page") do
  visit '/accounts/new'
end

When("I add {string} for the account name") do |string|
  fill_in "account_name", with: string
end

When("I add {string} for the account email") do |string|
  fill_in "account_email", with: string
end

Then("I should redirect to the accounts page") do
  current_path.should == '/accounts'
end

Then("I should see a link to Log in to {string}") do |string|
  page.should have_content("Log in to " + string)
end