# Meezy_starter

Meezy_starter is a Flutter starter project designed to provide a foundation for building
maintainable applications for my projects. Some of the sections are inspired by Sizzle_starter and incorporates a scope-based approach, 
leveraging the power of Bloc and Auto Route for state management and routing. 

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

2. **Run the script:** Use the following command to rename your project. You can specify the desired project name, organization, and description using the available flags.

   ```bash
   dart run tool/dart/rename_project.dart --name="your_project_name" --organization="your_organization" --description="your_project_description"
