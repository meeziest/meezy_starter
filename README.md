# Meezy_starter

Meezy_starter is a Flutter starter project designed to provide a robust foundation for building scalable 
and maintainable mobile applications. It is inspired by Sizzle_starter and incorporates a scope-based approach, 
leveraging the power of Bloc and Auto Route for state management and routing.

## Project Structure

The project is organized into the following main directories:

```
lib
├── core
│ ├── auth
│ ├── bloc_base
│ ├── client
│ ├── config
│ ├── helpers
│ ├── logger
│ ├── proxy
│ ├── tracker
│ └── ui_kit
├── features
│ ├── app
│ ├── auth
│ ├── main
│ ├── profile
│ └── app_runner.dart
├── gen
└── main.dart
test
```


### Core

- **auth**: Handles authentication logic.
- **bloc_base**: Contains base classes for Bloc architecture.
- **client**: Manages network requests and API interactions.
- **config**: Configuration files and constants.
- **helpers**: Utility functions and extensions.
- **logger**: Logging utilities.
- **proxy**: Intermediary layer for various services.
- **tracker**: Analytics and tracking.
- **ui_kit**: Common UI components and widgets.

### Features

- **app**: Main application logic.
- **auth**: Authentication-related features.
- **main**: Entry point and main screen logic.
- **profile**: User profile-related features.
- **app_runner.dart**: Initial setup and application runner.

### Gen

Generated files and code.

### Main.dart

The main entry point of the application.

## Getting Started

To get started with Meezy_starter, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/meeziest/meezy_starter.git

