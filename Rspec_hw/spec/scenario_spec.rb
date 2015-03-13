require 'spec_helper'
require 'page-object'
require_relative '../../Rspec_hw/Pages/my_account_page'

describe 'full scenario' do
  describe "Registration flow" do
    context 'after registration' do
      before :each do
        visit(RegisterPage).register_as('asdfg')
      end
      it_behaves_like 'current url include', 'my/account'
      it_behaves_like 'flash notice' , 'Your account has been activated. You can now login'

      end

        it 'should be logged in' do
          expect(@current_page.text).to include 'Logged in'
      end

    end


  describe 'Login flow' do

  end


  end