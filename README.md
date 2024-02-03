# Crypto Investment App
La Crypto Investment App es una aplicación desarrollada en Ruby on Rails que te permite realizar cálculos de inversiones en criptomonedas. Con esta aplicación, puedes importar datos de inversiones desde un archivo CSV hasta en formato JSON. Además, puedes realizar cálculos basados en tasas de interés mensuales y obtener proyecciones de tus inversiones en diferentes criptomonedas.

## Requisitos
Asegúrate de tener instalados los siguientes requisitos en tu entorno de desarrollo:

- Ruby 2.7.4
- Rails 6.1.4

### Rutas Principales
- Crypto Lives Index: /crypto/lives/index 
    - Permite visualizar en tiempo real los precios de las criptomonedas, como Cardano, Bitcoin y Ether. (Nota: La actualización en tiempo real requiere recargar la página)

- Crypto CSV Imports:

    - Importación de CSV: /crypto/csv_imports/new
        - Permite subir un archivo CSV que contiene datos de inversiones en criptomonedas para realizar cálculos.

- Crypto CSV Exports:

    - Mostrar Resultados de la Inversión: /crypto/csv_exports/show_results
        - Muestra los resultados de los cálculos realizados a partir de la importación de datos CSV.

    - Crear Exportación: /crypto/csv_exports/create
        - Permite exportar los resultados de los cálculos en diferentes formatos, como CSV y JSON.

### Funcionalidades Destacadas
- Cálculos de Inversión: Realiza cálculos de proyección de inversiones basados en tasas de interés mensuales.

- Importación de Datos: Sube fácilmente archivos CSV con información sobre tus inversiones en criptomonedas.

- Visualización en Tiempo Real: Observa los precios en tiempo real de las principales criptomonedas. (Actualizado al recargar la página)

### Desafío DisruptiveStudio
Este proyecto forma parte de un desafío propuesto por DisruptiveStudio. El desafío no requería el almacenamiento de datos en la base de datos, por lo que no se han incluido modelos para ello.

### Mejoras Pendientes
- Manejo de Errores API: Actualmente, la aplicación no gestiona adecuadamente los errores de la API. Se espera agregar un manejo más robusto en futuras versiones.

- Estilo y Diseño: Incorporación de estilos utilizando Bootstrap o CSS para mejorar la presentación visual de la aplicación.

### Instalación
    1. Clona el repositorio: git clone <https://github.com/Serlle/cryptocurrency_investment_app.git>

    2. Instala las dependencias: bundle install

    3. Ejecuta las migraciones de la base de datos: rails db:migrate

    4. Inicia el servidor: rails server

    5. ¡Listo! La aplicación debería estar disponible en http://localhost:3000

### Contribuciones
Las contribuciones son bienvenidas. Si encuentras errores o mejoras potenciales, ¡abre un issue o envía una pull request!

Desarrollado por: [Serlle Rosales] - [https://github.com/Serlle]