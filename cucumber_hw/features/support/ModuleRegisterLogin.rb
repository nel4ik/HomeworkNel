module RegisterAndLogin

def register_user(username,password)
  @browser.link(class: 'register').click
  @browser.text_field(id: 'user_login').set(username)
  @browser.text_field(id: 'user_password').set(password)
  @browser.text_field(id: 'user_password_confirmation').set(password)
  @browser.text_field(id: 'user_firstname').set('nel'+username)
  @browser.text_field(id: 'user_lastname').set('nel'+username)
  @browser.text_field(id: 'user_mail').set(username+'@test.com')
end


def logout
  @browser.link(class: 'logout').click
end


def login(username, password)
  @browser.text_field(id: 'username').set(username)
  @browser.text_field(id: 'password').set(password)
  @browser.button(name: 'login').click
end

def change_password(oldpassword)
  @browser.link(class: 'my-account').click
  @browser.link(class: 'icon icon-passwd').click
  @browser.text_field(id: 'password').set(oldpassword)
  @browser.text_field(id: 'new_password').set(oldpassword+'1')
  @browser.text_field(id: 'new_password_confirmation').set(oldpassword+'1')
  @browser.button(name: 'commit').click
end

end

