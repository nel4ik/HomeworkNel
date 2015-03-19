# require_relative 'ModuleHeader.rb'
# include Header

username = 'nel90'
password = 'qwerty'
username1 = username+'member1'
username2 = username+'member2'

Given(/^i am on registration page$/) do
  visit RegisterPage
end

When(/^i fill up registration data with "([^"]*)" and "([^"]*)"$/) do |name, pass|
  name = username
  pass = password

  on(RegisterPage).login_field = name
  on(RegisterPage).password_field = pass
  on(RegisterPage).password_confirm_field = pass
  on(RegisterPage).first_name_field = 'nel'+username
  on(RegisterPage).last_name_field = 'nel'+username
  on(RegisterPage).email_field = username+'@test.com'
end

And(/^click submit button$/) do
  on(RegisterPage).submit_button
end

Then(/^I should be registered as "([^"]*)"$/) do |user|
  user = username
  expect(@browser.link(class:'user').text).to include user
end


When(/^i fill up registration form with empty login$/) do
  on(RegisterPage).register_user('login_field' => ' ')
end

Then(/^i should see error message "([^"]*)"$/) do |message|
  on(RegisterPage).error_messages.should include message
end

Given(/^i am on login page$/) do
  visit LoginPage
end

When(/^i fill login and password and click Login button$/) do
  on(LoginPage).login(username,password)
end

Then(/^I am logged in as "([^"]*)"$/) do |correct_user|
  correct_user = username
  expect(@browser.link(class:'user').text).to include correct_user
end

When(/^i create new project$/) do
  @browser.link(class: 'projects').click
  @browser.link(class: 'icon-add').click
  on(NewProjectPage).create_project('project'+username)
end

Then(/^new project is created$/) do
  on(NewProjectPage).notification.should include 'Successful creation.'
end

When(/^i change version of a project to "([^"]*)"$/) do |project_name|
  project_name = 'version1'+username
  on(NewProjectPage).change_project_version(project_name)
end

Then(/^version is changed$/) do
  on(NewProjectPage).notification.should include 'Successful creation.'
end


