class ProjectsPage
  include PageObject

  page_url 'http://demo.redmine.org/projects'

  link :add_project, class: 'icon-add'

end