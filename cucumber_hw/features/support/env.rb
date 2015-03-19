require 'rspec'
require 'watir-webdriver'
require 'page-object'
World(PageObject::PageFactory)

Before do
  @browser = Watir::Browser.new :firefox
  @browser.goto 'http://demo.redmine.org'


end

After do
  @browser.close
end
