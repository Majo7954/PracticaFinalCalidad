@sidebar 
Feature: Sidebar Logout

  Background:
    Given I am on the login page

    @logout
  Scenario: Logout as standard_user
    When I login with username "standard_user" and password "secret_sauce"
    And I open the sidebar
    And I click on "Logout"
    Then I should be redirected to the login page

    @logout
  Scenario: Logout as problem_user
    When I login with username "problem_user" and password "secret_sauce"
    And I open the sidebar
    And I click on "Logout"
    Then I should be redirected to the login page

    @logout
  Scenario: Logout as performance_glitch_user
    When I login with username "performance_glitch_user" and password "secret_sauce"
    And I open the sidebar
    And I click on "Logout"
    Then I should be redirected to the login page

    @logout
  Scenario: Logout as visual_user
    When I login with username "visual_user" and password "secret_sauce"
    And I open the sidebar
    And I click on "Logout"
    Then I should be redirected to the login page

    @logout
  Scenario: Logout as error_user
    When I login with username "error_user" and password "secret_sauce"
    And I open the sidebar
    And I click on "Logout"
    Then I should be redirected to the login page

     @about
Scenario Outline: Redirect to About page from sidebar for each valid user
  When I login with username "<user>" and password "secret_sauce"
  And I open the sidebar
  And I click on "About"
  Then I should be redirected to "https://saucelabs.com/"

Examples:
  | user                     |
  | standard_user           |
  | performance_glitch_user |
  | visual_user             |
  | error_user              |

  @about
  @aboutproblem
  Scenario: Redirect to About page as problem_user
    When I login with username "problem_user" and password "secret_sauce"
    And I open the sidebar
    And I click on "About"
    Then I should be redirected to "https://saucelabs.com/error/404"

    @allitems
   Scenario: Verify item prices are visually altered for visual_user
    When I login with username "visual_user" and password "secret_sauce"
    And I open the sidebar
    And I click on "All Items"
    Then the item prices should be incorrect

    @allitems2
Scenario: Verify prices change on each All Items click for visual_user
  When I login with username "visual_user" and password "secret_sauce"
  And I open the sidebar
  And I click on "All Items"
  Then the item prices should change each time All Items is clicked


  

 

   


    