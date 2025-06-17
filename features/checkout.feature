Feature: Checkout process in SauceDemo
  As a user of SauceDemo
  I want to complete the checkout process successfully
  So that I can place an order and receive confirmation

  Background:
    Given I am on the login page of SauceDemo
    When I login with username "standard_user" and password "secret_sauce"
    And I add the product "Sauce Labs Backpack" to the cart
    And I go to the cart page
    And I proceed to checkout from cart

  @info
  Scenario: Complete personal information and proceed
    When I enter my first name "Juan", last name "Perez" and postal code "12345"
    And I click on Continue
    Then I should see the checkout overview page
    And I should see subtotal, tax and total correctly calculated

  @cancel
  Scenario: Cancel checkout from information page
    When I click on Cancel
    Then I should be redirected to the cart page

  @finish
  Scenario: Finish the checkout process and confirm order
    When I enter my first name "Maria", last name "Lopez" and postal code "45678"
    And I click on Continue
    And I click on Finish
    Then I should see the confirmation message "Thank you for your order!"

  @overview-cancel
  Scenario: Cancel checkout from overview page
    When I enter my first name "Ana", last name "Soto" and postal code "78901"
    And I click on Continue
    And I click on Cancel
    Then I should be redirected to the products page from checkout overview
