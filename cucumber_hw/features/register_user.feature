Feature: As user I want to have possibility to register to the system and create a project


  Scenario: successful registration
   Given i am on registration page
    When i fill up registration data with "username" and "password"
    And click submit button
    Then I should be registered as "username"


  Scenario Outline: registration with wrong data
    Given i am on registration page
    When i fill up registration form with incorrect <name>, <pass>
    Then i should see appropriate <error message>
    Examples:
      | name | pass|error message|
      |      |qwerty|Login can't be blank\nEmail is invalid|
      |qwertyude |  |Password is too short (minimum is 4 characters)|



  Scenario: login and create new project
    Given i am on login page
    When i fill login and password and click Login button
    Then I am logged in as "correct_user"
#create new project
    When i create new project
    Then new project is created
#add users to project
    When i change version of a project to "project_name"
    Then version is changed



