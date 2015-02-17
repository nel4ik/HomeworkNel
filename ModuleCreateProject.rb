module CreateProject

  def create_project(projectname)
    @browser.link(class: 'projects').click
    @browser.link(class: 'icon-add').click

    @browser.text_field(id: 'project_name').set projectname
    @browser.text_field(id: 'project_identifier').set projectname+'1234567890'
    @browser.button(value: 'Create').click
  end

  def add_user_to_project
    @browser.link(id: 'tab-members').click
    @browser.text_field(id: 'principal_search').set 'nel1'
    sleep 1
    @browser.checkbox(xpath: "//*[@id='principals']/label[contains(text(),'nel1')]/input").set
    @browser.checkbox(xpath: ".//*[@id='new_membership']/fieldset/p[2]/label[2]/input").set
    @browser.button(id: 'member-add-submit').click
  end

  def edit_project_version(version)
    @browser.link(id: 'tab-versions').click
    @browser.link(class: 'icon icon-add').click
    @browser.text_field(id: 'version_name').set version
    @browser.button(name: 'commit').click
  end

end