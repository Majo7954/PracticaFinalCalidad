Feature: Login en SauceDemo

  Background:
    Given que estoy en la página de inicio

  Scenario: Login exitoso
    When ingreso el usuario "standard_user" y la contraseña "secret_sauce"
    Then debería ver la página de productos

  Scenario: Login con credenciales inválidas
    When ingreso el usuario "fake_user" y la contraseña "fake_password"
    Then debería ver un mensaje de error

  Scenario: Login con campos vacíos
    When ingreso el usuario "" y la contraseña ""
    Then debería ver un mensaje de error
