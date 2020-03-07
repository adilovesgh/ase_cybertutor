# require 'uri'
# require 'cgi'
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)


Given("that I am logging in as {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When("I click the link to Log in to {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When("I fill in my username as {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When("I fill in my password as {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see Account for {string}") do |string|
  page.should have_content(@acct.name)
end

Given("that I am logged in with name {string} and email {string}") do |string, string2|
  if Account.find_by_email(string2).nil?
    visit '/accounts/new'
    fill_in "account_name", with: string
    fill_in "account_email", with: string2
    click_button("Save Changes")
  end
  click_link "Log in to " + string
  @acct = Account.find_by_email(string2)
end

Given("I am on the account page") do
  str = '/accounts/' + @acct.id.to_s
  str.should == current_path
end

Given("I change to be logged in with name {string} and email {string}") do |string, string2|
  click_link "Logout"
  if Account.find_by_email(string2).nil?
    visit '/accounts/new'
    fill_in "account_name", with: string
    fill_in "account_email", with: string2
    click_button("Save Changes")
  end
  click_link "Log in to " + string
  @acct = Account.find_by_email(string2)
end