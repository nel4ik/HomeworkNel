class ProjectPage
  include PageObject

  link :settings, class:'settings selected'
  link :versions, id: 'tab-versions'
  link :change_version, css: '#tab-content-versions a.icon-add'
  text_field :version_name, id: 'version_name'
  button :commit, name: 'commit'
  div :notification, id:'flash_notice'

  link :issues, class: 'new-issue'
  text_field :issue_subject, id: 'issue_subject'



  def change_project_version(version)
    settings
    versions
    sleep 2
    change_version
    sleep 1
    self.version_name = version
    commit
  end

  def create_bug(name)
    issues
    self.issue_subject = name
    commit

  end

end