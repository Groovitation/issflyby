Given(/^I am an authenticated google user$/) do
  pending # express the regexp above with the code you wish you had
  #User.create(name: "Mashallah Behbehani", email: , provider: , uid: , access_token: ENV['test_access_token'] , refresh_token: ENV['test_access_token'])
end

Given(/^I have the following upcoming flybys:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
  
end

When(/^I go to the homepage$/) do
  visit "/"
end

When(/^I click "(.*?)"$/) do |arg1|
  click_link(arg1)
end

Then(/^the page shows:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |flyby|
    page.has_content?(flyby.to_s)
  end
end

Then(/^I am redirected to the landing page$/) do
  page.has_content?('ISS Flyby!')
end

Then(/^I see the message "(.*?)"$/) do |arg1|
  page.has_content?(arg1)
end

When(/^I see the page has reloaded, and shows "(.*?)"$/) do |arg1|
  page.has_content?(arg1)
end

Then(/^I am sent a card saying "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
