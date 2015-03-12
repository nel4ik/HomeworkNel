class RegisterPage
  include PageObject
  include DataMagic
  page_url 'http://demo.redmine.org/account/register'


  text_field :login_field, id:'user_login'
  text_field :password_field, id:'user_password'
  text_field :password_confirm_field, id:'user_password_confirmation'
  text_field :first_name_field, id:'user_firstname'
  text_field :last_name_field, id:'user_lastname'
  text_field :email_field, id:'user_mail'
  button :submit_button, value:'Submit'
  div :error_div, id:'errorExplanation'
  unordered_list(:error_messages) do |page|
    page.error_div_element.unordered_list_element
  end

  def register_user(user= {})
    populate_page_with data_for(:registerpage, user)
    submit_button
  end

end