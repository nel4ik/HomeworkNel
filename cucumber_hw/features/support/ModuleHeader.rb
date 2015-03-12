module Header
 include PageObject

 link :user_menu, class:'user'
 link :projects, class:'projects'

 def projects
   projects
 end

end