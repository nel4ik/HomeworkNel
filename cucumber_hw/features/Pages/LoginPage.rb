class LoginPage
  include PageObject
  include DataMagic
  page_url 'http://demo.redmine.org/login'

  text_field :login, id:'username'
  text_field :password, id:'password'
  button :sign_in, name:'login'

  def login(login,password)
    self.login = login
    self.password = password
    sign_in
  end

  def logout
    @browser.link(class: 'logout').click
  end
end