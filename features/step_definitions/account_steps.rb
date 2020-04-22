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
  @acct_name = string
  fill_in "account_name", with: string
end

When("I add {string} for the account email") do |string|
  @acct_email = string
  fill_in "account_email", with: string
end

When("I add {string} for the account password") do |string|
  fill_in "account_password", with: string
end

Then("I should redirect to the home page") do
  expect(Account.find_by_email(@acct_email)).to_not be nil
  current_path.should == '/'
end

