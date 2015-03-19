require_relative '../../Rspec_hw/Modules/common_methods'

class MyAccountPage
  include PageObject
  include CommonMethods

  link :user, class: 'user active'
  link :logout_link, class: 'logout'
  link :projects, class: 'projects'

  def logout_user
    self.logout_link
  end




end