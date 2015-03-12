class NewProjectPage
  include PageObject
  page_url 'http://demo.redmine.org/projects/new'

  text_field :name, id: 'project_name'
  text_field :identifier, id: 'project_identifier'
  button :create, value: 'Create'
  link :versions, id: 'tab-versions'
  link :add_versions, class: 'icon icon-add'
  text_field :version_name, id: 'version_name'
  button :commit, name: 'commit'
  div :notification, id:'flash_notice'

  def create_project(projectname)
    self.name = projectname
    self.identifier = projectname+'12345678901'
    create
  end

  def change_project_version(version)
    self.versions
    sleep 2
    self.add_versions
    sleep 2
    self.version_name.set version
    commit
  end

end