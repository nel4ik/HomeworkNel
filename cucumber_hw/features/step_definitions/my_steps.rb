require_relative 'D:\git\HW\cucumber_hw\features\support\ModuleRegisterLogin.rb'
require_relative 'D:\git\HW\cucumber_hw\features\support\ModuleCreateProject'
include RegisterAndLogin
include CreateProject

username = 'nel78'
password = 'qwerty'
username1 = username+'member1'
username2 = username+'member2'

Given(/^i am on registration page$/) do
  @browser.goto 'http://demo.redmine.org'
end

When(/^i fill up registration data with "([^"]*)" and "([^"]*)"$/) do |name, pass|
  name = username
  pass = password
  register_user(username,password)
end

And(/^click submit button$/) do
  @browser.button(value: 'Submit').click
end

Then(/^I should be registered as "([^"]*)"$/) do |user|
  user = username
  expect(@browser.link(class:'user').text).to include user
end

When(/^i fill up registration form with incorrect (.*), (.*)$/) do |name, pass|
  register_user(name,pass)
  @browser.button(value: 'Submit').click
end


Then(/^i should see appropriate (.*)$/) do |error_message|
  expect(@browser.div(id:'errorExplanation').text).to include error_message
end

Given(/^i am on login page$/) do
  @browser.link(class: 'login').click
end

When(/^i fill login and password and click Login button$/) do
  login(username,password)
end

Then(/^I am logged in as "([^"]*)"$/) do |correct_user|
  correct_user = username
  expect(@browser.link(class:'user').text).to include correct_user
end

When(/^i create new project$/) do
create_project('project'+username)
end

Then(/^new project is created$/) do
  expect(@browser.div(id:'flash_notice').text).to include 'Successful creation.'
end

When(/^i change version of a project to "([^"]*)"$/) do |project_name|
  project_name = 'version'+username
  edit_project_version(project_name)
end

Then(/^version is changed$/) do
  expect(@browser.div(id:'flash_notice').text).to include 'Successful creation.'
end


