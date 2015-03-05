require_relative 'D:\git\HW\cucumber_hw\features\support\ModuleRegisterLogin.rb'
require_relative 'D:\git\HW\cucumber_hw\features\support\ModuleCreateProject'
include RegisterAndLogin
include CreateProject
username = 'nel73'
password = 'qwerty'
username1 = username+'member1'
username2 = username+'member2'

Given(/^i am on registration page$/) do
  @browser.goto 'http://demo.redmine.org'
end

When(/^i fill up registration data$/) do
  register_user(username,password)
end

And(/^click submit button$/) do
  @browser.button(value: 'Submit').click
end

Then(/^I should be registered$/) do
  expect(@browser.link(class:'user').text).to include username
end

When(/^i fill up registration form with incorrect (.*), (.*)$/) do |name, pass|
  register_user(name,pass)
  @browser.button(value: 'Submit').click
end

Then(/^i should see appropriate (.*)$/) do |error_message|
  expect(@browser.div(id:'errorExplanation').text).to include ('Login can\'t be blank')
end

Given(/^i am on login page$/) do
  @browser.link(class: 'login').click
end

When(/^i fill login and password and click Login button$/) do
  login(username,password)
end

Then(/^I am logged in as correct user$/) do
  expect(@browser.link(class:'user').text).to include username
end

Given(/^i am logged in$/) do
  @browser.link(class: 'login').click
  login(username,password)
end

When(/^i create new project$/) do
create_project('project'+username)
end

Then(/^new project is created$/) do
  expect(@browser.div(id:'flash_notice').text).to include 'Successful creation.'
end

When(/^i change version of a project$/) do
  edit_project_version('version'+username)
end

Then(/^version is changed$/) do
  expect(@browser.div(id:'flash_notice').text).to include 'Successful creation.'
end