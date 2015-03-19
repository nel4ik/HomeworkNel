
class LoginPage
  include PageObject

  page_url 'http://demo.redmine.org/login'

  text_field :user, id:'username'
  text_field :password, id:'password'
  button :sign_in, name:'login'

  def login(login, password)
    self.user = login
    self.password = password
    sign_in
  end

end