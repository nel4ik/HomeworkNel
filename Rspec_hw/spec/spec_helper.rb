require 'rspec'
require 'page-object'
require 'watir-webdriver'



RSpec.configure do |config|
  config.include PageObject::PageFactory
  config.before :all do
    @browser = Watir::Browser.new :firefox
  end

  # config.after :all do
  #   @browser.close
  # end

end


shared_examples 'current url include' do |message|
      it "#{message}" do
      expect(@current_page.current_url).to include message
    end
end

shared_examples 'flash notice' do |message|
  describe 'message' do
    it "includes #{message}" do
      expect(on(MyAccountPage).flash_notice).to include message
    end

  end
end