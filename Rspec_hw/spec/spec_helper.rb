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

end


shared_examples 'current url include' do |message|
      it "include #{message}" do
      expect(@current_page.current_url).to include message
    end
end

shared_exaples 'has flash notice' do |message|
  describe 'message' do
    it "is includes #{message}" do
      expect(@current_page.flash_notice).to include message
    end

  end
end