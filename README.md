# Posts Flutter App

A clean architecture Flutter application for managing posts with authentication, pagination, and CRUD operations.

## Overview

This project is built using Flutter and follows a modular clean architecture style.
It includes:

- Authentication flow with login and registration
- Protected routes using `go_router`
- Post listing with pagination and pull-to-refresh
- Create, edit, and delete post functionality
- Secure token storage via `flutter_secure_storage`
- State management with `flutter_bloc`
- Dependency injection with `injectable` and `get_it`
- Network integration with `dio`

## Architecture

The app is organized into a `lib` folder with these main areas:

- `core/` — shared configuration, DI, routing, theming, storage, network and app shell
- `features/auth/` — authentication feature with presentation, domain, and data layers
- `features/posts/` — post management feature with presentation, domain, and data layers

### Key Patterns

- Clean architecture / feature-based structure
- BLoC state management
- Generated models and DI setup via `freezed`, `json_serializable`, and `injectable`
- GoRouter for declarative navigation and route guards

## Features

- Login screen with form validation
- Registration screen for account creation
- Protected post list page for authenticated users
- Add new posts with title and description
- Edit existing posts inline
- Delete posts with confirmation dialog
- Infinite scrolling and refresh support
- Logout and auth token handling

## Tech Stack

- Flutter
- Dart
- flutter_bloc
- go_router
- dio
- injectable / get_it
- freezed / json_serializable
- flutter_secure_storage
- internet_connection_checker_plus

## Getting Started

### Prerequisites

- Flutter SDK installed
- Xcode for iOS or Android SDK for Android
- A connected device, simulator, or emulator

### Install

From the project root:

```bash
flutter pub get
```

If the generated code is missing or needs regeneration:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Run

```bash
flutter run
```

### Run on specific platform

```bash
flutter run -d chrome
flutter run -d android
flutter run -d ios
```

## Notes

- The app uses runtime dependency injection configured in `lib/core/di/injection.dart`.
- Authentication state is stored securely and drives route redirects in `lib/core/router/app_router.dart`.
- UI styling is centralized in `lib/core/theme/app_theme.dart`.

## Project Structure

```text
lib/
  core/
    app.dart
    router/
    di/
    theme/
    network/
    storage/
  features/
    auth/
    posts/
```

## License

This repository does not include a license file. Add one if you plan to share or publish the code.
