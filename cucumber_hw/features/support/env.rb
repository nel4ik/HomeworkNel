require 'rspec'

Before do
  require 'watir-webdriver'
  @browser = Watir::Browser.new :firefox
  @browser.goto 'http://demo.redmine.org'

end


After do
  @browser.close
end
