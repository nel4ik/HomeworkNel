Feature: As user I want to have possibility to register to the system and create a project


  Scenario: successful registration
   Given i am on registration page
    When i fill up registration data with "username" and "password"
    And click submit button
    Then I should be registered as "username"

  Scenario: registration with empty login
    Given i am on registration page
    When i fill up registration form with empty login
    Then i should see error message "Login cannot be blank"

    Given i am on login page
    When i fill login and password and click Login button
    Then I am logged in as "correct_user"
#create new project
    When i create new project
    Then new project is created
#change version of project
    When i change version of a project to "project_name"
    Then version is changed



