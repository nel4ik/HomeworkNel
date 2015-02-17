require 'watir-webdriver'

browser = Watir::Browser.new :firefox


browser.goto 'http://demo.redmine.org'
username = 'nel40'

# Register
browser.link(class: 'register').click
browser.text_field(id:'user_login').set(username)
browser.text_field(id:'user_password').set('qwerty')
browser.text_field(id:'user_password_confirmation').set('qwerty')
browser.text_field(id:'user_firstname').set('nel'+username)
browser.text_field(id:'user_lastname').set('nel'+username)
browser.text_field(id:'user_mail').set(username+'@ffff.com')
browser.button(value:'Submit').click

fail unless browser.link(class:'user').text.include? username

#Logout
browser.link(class: 'logout').click


#Login
browser.link(class: 'login').click
browser.text_field(id: 'username').set(username)
browser.text_field(id:'password').set('qwerty')
browser.button(name: 'login').click

fail unless browser.link(class:'user').text.include? username

#ChangePassword
browser.link(class: 'my-account').click
browser.link(class:'icon icon-passwd').click
browser.text_field(id: 'password').set('qwerty')
browser.text_field(id: 'new_password').set('qwerty1')
browser.text_field(id: 'new_password_confirmation').set('qwerty1')
browser.button(name: 'commit').click

fail unless browser.div(id: 'flash_notice').text.include? 'Password was successfully updated.'


#CreateProject
browser.link(class:'projects').click
browser.link(class:'icon-add').click

browser.text_field(id:'project_name').set username+'test project'
browser.text_field(id:'project_identifier').set username+'1234567890'
browser.button(value:'Create').click

fail unless browser.div(id:'flash_notice').text.include? 'Successful creation.'

#AddUsersToProject
browser.link(id: 'tab-members').click
browser.text_field(id: 'principal_search' ).set 'nel1'
sleep 3
browser.checkbox(xpath: "//*[@id='principals']/label[contains(text(),'nel1')]/input").set
browser.checkbox(xpath: ".//*[@id='new_membership']/fieldset/p[2]/label[2]/input").set
browser.button(id: 'member-add-submit').click

#fail unless browser.table(class:'list members').text.include? 'nel1'

#EditProjectVersion
browser.link(id: 'tab-versions').click
browser.link(class: 'icon icon-add').click
browser.text_field(id:'version_name').set 'version'+username
browser.button(name: 'commit').click

fail unless browser.div(id:'flash_notice').text.include? 'Successful creation.'

#CreateABug
browser.link(class: 'new-issue').click
browser.text_field(id:'issue_subject').set 'test issue bug'
browser.button(name: 'commit').click

fail unless browser.div(id: 'flash_notice').text.include? 'created'
