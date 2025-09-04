<<<<<<< HEAD
# Cat_Breeds
=======
# PRUEBA TÉCNICA PARA DESARROLLADORES DE APLICACIONES PARA DISPOSITIVOS MÓVILES FLUTTER

## Descripción

Esta aplicación móvil ha sido desarrollada como parte de la prueba técnica para desarrolladores de aplicaciones en dispositivos móviles. La app consume la API de The Cat API para mostrar información sobre diferentes razas de gatos, posteriormente se implemento como base de datos local a Hive con el fin de guardar la informacion sobre las diferentes razas de gatos de manera local.

## Tecnologías Utilizadas

- **Framework:** Flutter
- **Lenguaje de Programación:** Dart
- **IDE Utilizado:** Visual Studio Code
- **API Consumida:** [The Cat API](https://developers.thecatapi.com)
- **Gestor de Estado:** Cubit Bloc
- **Base de datos local:** Hive [Paquete de Hive](https://pub.dev/packages/hive)


## Características de la Aplicación

- Consumo de la API [The Cat API](https://api.thecatapi.com/v1/breeds) utilizando la clave de acceso proporcionada.
- Visualización de la lista de razas de gatos con información relevante.
- Almacenamiento local de la informacion de las razas de gatos 
- Interfaz de usuario intuitiva.
- Manejo de errores y excepciones al consumir la API.


## Requisitos Previos

- Tener Flutter instalado ([Instrucciones de Instalación](https://flutter.dev/docs/get-started/install))
- Tener un emulador o dispositivo físico disponible para pruebas.

## Estructura del Proyecto

```
├─ lib
│  ├─ bootstrap.dart
│  ├─ core
│  │  ├─ animations
│  │  │  └─ navigation_animation.dart
│  │  ├─ errors
│  │  │  ├─ exeptions.dart
│  │  │  └─ failures.dart
│  │  ├─ helpers
│  │  │  └─ debounce.dart
│  │  ├─ router
│  │  │  └─ app_router.dart
│  │  ├─ services
│  │  │  └─ enviromet_service.dart
│  │  ├─ theme
│  │  │  └─ app_theme.dart
│  │  └─ use_cases
│  │     └─ use_cases_interface.dart
│  ├─ dependency_injection.dart
│  ├─ features
│  │  ├─ cat_breeds
│  │  │  ├─ breed_inyection.dart
│  │  │  ├─ data
│  │  │  │  ├─ data_source
│  │  │  │  │  └─ remote
│  │  │  │  │     ├─ remote_data_source_implementation.dart
│  │  │  │  │     └─ remote_data_source_interface.dart
│  │  │  │  │  └─ Local
│  │  │  │  │     ├─ local_data_source_impl.dart
│  │  │  │  │     └─ loca_data_source_interface.dart
│  │  │  │  ├─ models
│  │  │  │  │  ├─ breed_image_model.dart
│  │  │  │  │  └─ breed_model.dart
│  │  │  │  └─ repository
│  │  │  │     └─ repository_implementation.dart
│  │  │  ├─ domain
│  │  │  │  ├─ entities
│  │  │  │  │  ├─ breed_entity.dart
│  │  │  │  │  └─ breed_image_entity.dart
│  │  │  │  ├─ repository
│  │  │  │  │  └─ repository_interface.dart
│  │  │  │  └─ use_cases
│  │  │  │     ├─ delete_breed_favorite_use_case.dart
│  │  │  │     └─ get_breed_by_name_use_case.dart
|  |  |  |     └─ get_breed_favorite_list_use_case.dart
|  |  |  |     └─ get_breed_save_use_case.dart
|  |  |  |     └─ get_breeds_use_case.dart
│  │  │  └─ presentation
│  │  │     ├─ blocs
│  │  │     │  └─ breed_management
│  │  │     │     ├─ breed_cubit.dart
│  │  │     │     └─ breed_state.dart
│  │  │     ├─ screens
|  |  |     |  ├─ detail_screen
|  |  |     |  |  ├─ component
|  |  |     |  |  |   ├─ app_bar_component.dart
|  |  |     |  |  |   └─ body_component.dart
|  |  |     |  |  ├─ widgets
|  |  |     |  |  |  └─ cat_detail_widget.dart
|  |  |     |  |  └─ detail_screen.dart
|  |  |     |  ├─ favorite_screen
|  |  |     |  |  ├─ component
|  |  |     |  |  |  ├─ app_bar_component.dart
|  |  |     |  |  |  └─ body_component.dart
|  |  |     |  |  ├─ widgets
|  |  |     |  |  |  └─ custom_favorite_emty_widget.dart
|  |  |     |  |  └─ favorite_sacreen.dart
|  |  |     |  └─ home_screen
|  |  |     |     ├─ component
|  |  |     |     |  ├─ app_bar_component.dart
|  |  |     |     |  ├─ body_component.dart
|  |  |     |     |  └─ card_component.dar
|  |  |     |     ├─ widgets
|  |  |     |     |  ├─ custom_card_widget.dart
|  |  |     |     |  └─ custom_search_app_bar_widget.dart
|  |  |     |     └─ home_screen.dart
│  │  │     ├─ widgets
|  |  |     |  ├─ custom_app_bar_widget.dart
|  |  |     |  ├─ custom_gif_widget.dart
|  |  |     |  ├─ custom_image_network_widget.dart
|  |  |     |  └─ custom_text_field_widget.dart
|  |  |     └─ breed_inyection.dart
│  │  └─ shared
│  └─ main.dart
```
>>>>>>> f1ef915 (Cat_Breeds finalizado)
