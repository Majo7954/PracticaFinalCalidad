Feature: Navegación y ordenamiento de productos

  Background:
    Given que estoy en la página de inicio
    And ingreso el usuario "standard_user" y la contraseña "secret_sauce"
    Then debería ver la página de productos

  Scenario: Ver productos listados
    Then debería ver una lista de productos disponibles

  Scenario: Ver todos los productos
    Then debería ver 6 productos listados

  Scenario: Ver información de los productos
    Then debería ver el producto "Sauce Labs Backpack" con precio "$29.99"
    And debería ver el producto "Sauce Labs Bike Light" con precio "$9.99"

  Scenario: Agregar un solo producto al carrito
    When agrego el producto "Sauce Labs Backpack" al carrito
    Then el ícono del carrito debería mostrar 1 artículo

  Scenario: Agregar múltiples productos al carrito
    When agrego el producto "Sauce Labs Backpack" al carrito
    And agrego el producto "Sauce Labs Bolt T-Shirt" al carrito
    Then el ícono del carrito debería mostrar 2 artículos

  Scenario: Ordenar productos por nombre (A a Z)
    When ordeno los productos por "Name (A to Z)"
    Then el primer producto debería ser "Sauce Labs Backpack"

  Scenario: Ordenar productos por precio (de menor a mayor)
    When ordeno los productos por "Price (low to high)"
    Then debería ver el primer producto con nombre "Sauce Labs Onesie"

  Scenario: Cerrar sesión desde el menú
    When abro el menú
    And hago clic en "Logout"
    Then debería ser redirigido a la página de inicio
