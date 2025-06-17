Feature: Verificación de íconos de redes sociales en SauceDemo
  As a user of SauceDemo
  I want to verify that the social media icons link to the correct external sites
  So that I can trust the page’s official external presence

  Background:
    Given I am on the login page of SauceDemo

  @social
  Scenario Outline: Verificar enlaces de íconos de redes sociales con distintos usuarios
    When I login with username "<username>" and password "secret_sauce"
    Then the Twitter icon should link to "https://twitter.com/saucelabs"
    And the Facebook icon should link to "https://www.facebook.com/saucelabs"
    And the LinkedIn icon should link to "https://www.linkedin.com/company/sauce-labs/"

    Examples:
      | username                |
      | standard_user           |
      | problem_user            |
      | performance_glitch_user |
      | visual_user             |
