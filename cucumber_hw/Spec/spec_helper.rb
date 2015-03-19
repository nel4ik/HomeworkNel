require 'rspec'
require 'page-object'

RSpec.configure do |config|
  config.include PageObject::PageFactory



  config.before :all do
    @browser = Watir::Browser.new :firefox
    @browser.window.maximize
  end

  config.after :all do
    @browser.close
  end

  # config.around :example do |example|
  #   errors = get_js_errors
  #   example.run
  #   unless errors.nil?
  #     @log.
  #   end
  end
