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

  Scenario: Login con usuario bloqueado
    When ingreso el usuario "locked_out_user" y la contraseña "secret_sauce"
    Then debería ver un mensaje de error "Epic sadface: Sorry, this user has been locked out."
    And no debería permitir el acceso a la aplicación

  Scenario: Login con usuario con problemas de interfaz
    When ingreso el usuario "problem_user" y la contraseña "secret_sauce"
    Then debería ver la página de productos
    And todas las imágenes deberían ser iguales

  Scenario: Login con usuario con problemas de rendimiento
    When ingreso el usuario "performance_glitch_user" y la contraseña "secret_sauce"
    Then debería ver la página de productos
    And debería experimentar un retraso en el rendimiento

  Scenario: Login con usuario con errores
    When ingreso el usuario "error_user" y la contraseña "secret_sauce"
    Then debería ver la página de productos
    And debería experimentar un retraso en el rendimiento
