# require 'uri'
# require 'cgi'
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)


Given("that I am logging in as {string} and email {string} and password {string}") do |string, string2, string3|
  if Account.find_by_email(string2).nil?
    visit '/accounts/new'
    fill_in "account_name", with: string
    fill_in "account_email", with: string2
    fill_in "account_password", with: string3
    click_button("Save Changes")
    click_link "Logout"
  end
  @acct = Account.find_by_email(string2)
end

When("I click thye link to Logout") do
  click_link "Logout"
end

When("I click the link to Log in") do
  click_link "Log In"
  page.should have_content("Log In")
end

When("I fill in my email as {string}") do |string|
  fill_in "account_email", with: string
end

When("I fill in my password as {string}") do |string|
  fill_in "account_password", with: string
end

When("I press button {string}") do |string|
  click_button("Save Changes")
end

Given("that I am logged in with name {string} and email {string} and password {string}") do |string, string2, string3|
  if Account.find_by_email(string2).nil?
    visit '/accounts/new'
    fill_in "account_name", with: string
    fill_in "account_email", with: string2
    fill_in "account_password", with: string3
    click_button("Save Changes")
    click_link "Logout"
  end
  @acct = Account.find_by_email(string2)
  click_link "Log In"
  fill_in "account_email", with: string2
  fill_in "account_password", with: string3
  click_button("Save Changes")
end

Given("I press on {string}") do |string|
  click_link(string)
end

Then("I should see Account for {string}") do |string|
  page.should have_content(@acct.name)
end

Given("I am on the account page") do
  str = '/accounts/' + @acct.id.to_s
  str.should == current_path
end

Given("I change to be logged in with name {string} and email {string} and password {string}") do |string, string2, string3|
  click_link "Logout"
  if Account.find_by_email(string2).nil?
    visit '/accounts/new'
    fill_in "account_name", with: string
    fill_in "account_email", with: string2
    fill_in "account_password", with: string3
    click_button("Save Changes")
    click_link "Logout"
  end
  @acct = Account.find_by_email(string2)
  click_link "Log In"
  fill_in "account_email", with: string2
  fill_in "account_password", with: string3
  click_button("Save Changes")
end
