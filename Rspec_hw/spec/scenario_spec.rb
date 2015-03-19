require 'spec_helper'
require 'rspec'
require 'page-object'
require 'watir-webdriver'
require_relative '../../Rspec_hw/Pages/login_page'
require_relative '../../Rspec_hw/Pages/RegisterPage'
require_relative '../../Rspec_hw/Pages/my_account_page'
require_relative '../../Rspec_hw/Pages/projects_page'
require_relative '../../Rspec_hw/Pages/new_project_page'
require_relative '../../Rspec_hw/Pages/project_page'


describe 'Full scenario', :external do

  username = 'nel2'
  password = 'qwerty'

  describe 'Registration flow: ' do
    context 'After registration' do
      before :all do
        visit(RegisterPage).register(username, password)
      end
      # it_behaves_like 'current url include', 'my/account'
      it_behaves_like 'flash notice' , 'Your account has been activated. You can now log in.'
      it 'correct user is logged in' do
        expect(on(MyAccountPage).user_element.text).to include username
      end
      after :all do
        on(MyAccountPage).logout_user
      end
    end

    context 'After registration without login' do
      before :all do
        visit(RegisterPage).register_with_default_data('login_field' => ' ')
      end
      it 'error message is shown' do
        expect(on(RegisterPage).error_messages).to include 'Login cannot be blank'
      end
    end

  end

  describe 'Login flow: ' do
    context 'after login as correct user' do
      after :all do
        on(MyAccountPage).logout_user
      end
      before :each do
         visit(LoginPage).login(username,password)
      end
      it 'user should be logged in' do
        expect(on(MyAccountPage).user_element.text).to include username
      end
    end
  end

  describe 'Create Project flow: ' do
    describe 'Creating new project:' do
      before :all do
        visit(LoginPage).login(username,password)
        on(MyAccountPage).projects
        on(ProjectsPage).add_project
        on(NewProjectPage).create_project(username+'6project')
      end
      context 'new project can be created' do
        it_behaves_like 'flash notice' , 'Successful creation.'
      end

      describe 'version of a project can be changed' do
        before :all do
          on(ProjectPage).change_project_version('version1'+username)
        end
        it_behaves_like 'flash notice' , 'Successful creation.'
      end
    end


    describe 'When I create issues for project:' do

      describe 'a bug' do
        before :all do
        on(ProjectPage).create_bug('test_bug'+username)
        end
        context 'succesfull message appears' do
          it_behaves_like 'flash notice' , 'created'
        end
      end

      describe 'a support' do

      end
    end

  end


end