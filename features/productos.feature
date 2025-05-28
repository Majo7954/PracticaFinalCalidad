Feature: Navegación y ordenamiento de productos

  Background:
    Given que estoy en la página de inicio
    And ingreso el usuario "standard_user" y la contraseña "secret_sauce"
    Then debería ver la página de productos

  Scenario: Ver productos listados
    Then debería ver una lista de productos disponibles

  Scenario: Ordenar productos por precio (de menor a mayor)
    When ordeno los productos por "Price (low to high)"
    Then debería ver el primer producto con nombre "Sauce Labs Onesie"
