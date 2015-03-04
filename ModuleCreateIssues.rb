module CreateIssues


def create_bug(bug_name)
  @browser.link(class: 'new-issue').click
  @browser.text_field(id: 'issue_subject').set bug_name
  @browser.button(name: 'commit').click
end

def create_feature(feature_name)
  @browser.link(class: 'new-issue').click
  @browser.select_list(id: 'issue_tracker_id').select('Feature')
  sleep 2
  @browser.text_field(id: 'issue_subject').set feature_name
  @browser.button(name: 'commit').click
end

def create_support(support_name)
  @browser.link(class: 'new-issue').click
  @browser.select_list(id: 'issue_tracker_id').select('Support')
  sleep 2
  @browser.text_field(id: 'issue_subject').set support_name
  @browser.button(name: 'commit').click
end


end