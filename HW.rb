require 'watir-webdriver'
require_relative 'ModuleRegisterLogin'
require_relative 'ModuleCreateProject'
require_relative 'ModuleCreateIssues'
include RegisterAndLogin
include CreateProject
include CreateIssues

@browser = Watir::Browser.new :firefox

@browser.goto 'http://demo.redmine.org'
username = 'nel52'
password = 'qwerty'

register_user(username,password)
fail unless @browser.link(class:'user').text.include? username

logout
#TODO add assert

register_user(username+'member',password)

logout

login(username,password)
fail unless @browser.link(class:'user').text.include? username

change_password(password)
fail unless @browser.div(id: 'flash_notice').text.include? 'Password was successfully updated.'

create_project(username+'testproject')
fail unless @browser.div(id:'flash_notice').text.include? 'Successful creation.'

add_user_to_project(username+'member')
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

#VisibilityOfIssues
@browser.link(class: 'issues').click
