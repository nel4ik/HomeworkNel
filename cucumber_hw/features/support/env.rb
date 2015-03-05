require 'rspec'
require 'watir-webdriver'


Before do

  @browser = Watir::Browser.new :firefox
  @browser.goto 'http://demo.redmine.org'

end


After do
  @browser.close
end
