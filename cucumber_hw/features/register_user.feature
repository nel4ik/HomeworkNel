Feature: As user I want to have possibility to register to the system

  Scenario: successful registration
    Given i am on registration page
    When i fill up registration data
    And click submit button
    Then I should be registered
    And I should be redirected to Home page
