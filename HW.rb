require 'watir-webdriver'
require_relative 'ModuleRegisterLogin'
require_relative 'ModuleCreateProject'
require_relative 'ModuleCreateIssues'
include RegisterAndLogin
include CreateIssues
include CreateProject

@browser = Watir::Browser.new :firefox

@browser.goto 'http://demo.redmine.org'
#Homework with strings:
username = 'nel62'
password = 'qwerty'
username1 = username+'member1'
username2 = username+'member2'

register_user(username,password)
fail unless @browser.link(class:'user').text.include? username

logout

#Homework with array and loop
array_of_users = [username1, username2 ]
array_of_users.each do |user|
  register_user(user,password)
  logout
end


login(username,password)
fail unless @browser.link(class:'user').text.include? username

change_password(password)
fail unless @browser.div(id: 'flash_notice').text.include? 'Password was successfully updated.'

create_project(username+'testproject')
fail unless @browser.div(id:'flash_notice').text.include? 'Successful creation.'

#Homework with loop
array_of_users.each do |user|
  add_user_to_project(user)
end

#fail unless browser.table(class:'list members').text.include? 'nel1'

edit_project_version('version'+username)
fail unless @browser.div(id:'flash_notice').text.include? 'Successful creation.'


create_bug('test bug')
fail unless @browser.div(id: 'flash_notice').text.include? 'created'
fail unless @browser.div(id: 'content').h2.text.include? 'Bug'


create_feature('test feature')
fail unless @browser.div(id: 'flash_notice').text.include? 'created'
fail unless @browser.div(id: "content").h2.text.include? 'Feature'


create_support('test support')
fail unless @browser.div(id: 'flash_notice').text.include? 'created'
fail unless @browser.div(id: "content").h2.text.include? 'Support'

@browser.link(class: 'issues').click

