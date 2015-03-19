class NewProjectPage
  include PageObject

  text_field :name, id: 'project_name'
  text_field :identifier, id: 'project_identifier'
  button :create, value: 'Create'
  link :versions, id: 'tab-versions'
  link :change_version, class: 'icon-add'

  text_field :version_name, id: 'version_name'
  button :commit, name: 'commit'
  div :notification, id:'flash_notice'

  def create_project(projectname)
    self.name = projectname
    self.identifier = projectname+'12345678901'
    create
  end

  def create_bug(bug_name)
    @browser.link(class: 'new-issue').click
    @browser.text_field(id: 'issue_subject').set bug_name
    @browser.button(name: 'commit').click
  end



end