# Práctica Final - Gestión de Calidad de Sistemas

Este proyecto corresponde a la práctica final de la materia **Gestión de Calidad de Sistemas**. Consiste en una **suite de pruebas automatizadas** utilizando **Ruby**, **Capybara** y **Cucumber**, para validar funcionalidades clave del sitio web [SauceDemo](https://www.saucedemo.com/).

## Tecnologías utilizadas

- Ruby
- Capybara
- Cucumber
- Selenium (como driver de navegador)
- Page Object Pattern
- Gherkin (para definir escenarios BDD)

## Estructura del Proyecto

```
features/
│
├── pages/                # Clases Page Object (login, productos, etc.)
├── step_definitions/     # Pasos definidos en Ruby (llaman a Page Objects)
├── support/              # Configuraciones (env.rb, hooks.rb)
├── login.feature         # Archivos .feature con escenarios en Gherkin
├── checkout.feature
├── cart.feature
...
```

## Cómo ejecutar las pruebas

1. Instala las dependencias:

```bash
bundle install
```

2. Ejecuta **todas** las pruebas:

```bash
cucumber
```

3. Ejecuta solo los escenarios marcados como BVT (Build Verification Test):

```bash
cucumber --tags @bvt
```

4. Puedes tomar capturas de fallos automáticamente en `/screenshots`.

## Escenarios cubiertos

- Inicio de sesión válido e inválido
- Visualización de productos
- Ordenar productos por precio
- Añadir y eliminar productos del carrito
- Proceso de checkout completo
- Verificación de links sociales y menú lateral

## Criterios Técnicos (BVT)

- Los escenarios BVT validan los flujos más críticos de la aplicación.
- Tiempos de ejecución totales menores a 30 segundos.
- Sin dependencias externas ni estados persistentes.

## Autores

- Alejandra Palza
- Maria José Murillo
- Alexander Vacaflores

## 📝 Notas

Este proyecto utiliza el patrón Page Object para mayor mantenibilidad y escalabilidad. Todos los escenarios están descritos con claridad, y el código está estructurado para facilitar su comprensión y ejecución.
