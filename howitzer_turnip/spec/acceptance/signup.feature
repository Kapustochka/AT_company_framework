@sign_up_steps
Feature: Sign Up
  As a user
  I want to sign up to the system
  So I can login with a new account

  @smoke
  Scenario: user can open sign up page via menu
    Given home page of web application
    When I click sign up menu item on home page
    Then I should be redirected to sign up page

  @p1
  Scenario: user can receive message about email's confirmation
    Given sign up page of web application
    When I fill form on sign up page with new data
    And I submit sign up form on sign up page
    Then I should see info on sign up page that account was successfully confirmed
    And I should receive confirmation instruction email

  @p1
  Scenario: user can sign up with correct credentials
    Given sign up page of web application
    When I fill form on sign up page with new data
    And I submit sign up form on sign up page
    And I confirm sing up from confirmation instruction email
    Then I should be logged in the system
