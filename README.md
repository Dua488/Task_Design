# Task_Design

# Event Scheduler App

A Flutter application to create and manage events with options for virtual links, recurring schedules, and dynamic date-time selection.

## Features
- Add virtual links for online events.
- Select dates using a calendar.
- Dropdowns for setting start and end times.
- Support for one-time or recurring schedules.
- Add new schedules dynamically.

---

## Prerequisites

1. Install [Flutter](https://flutter.dev/docs/get-started/install) on your system.
2. Ensure you have the following tools installed:
   - Dart SDK
   - Android Studio or Visual Studio Code (with Flutter and Dart extensions)
   - An emulator or physical device for testing.
3. Verify Flutter installation by running:

   ```bash
   flutter doctor
   ```

---

## Setup Instructions

1. Clone this repository:
   ```bash
   git clone <repository-url>
   ```

2. Navigate to the project directory:
   ```bash
   cd event_scheduler_app
   ```

3. Fetch the required dependencies:
   ```bash
   flutter pub get
   ```

4. Run the application:
   ```bash
   flutter run
   ```

---

## Dependencies

This project uses the following third-party packages:

- **flutter**: For building the UI.
- **intl**: For date and time formatting.
- **provider**: For state management.

  
Set up necessary dependencies in pubspec.yaml:
```bash
   dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.3  
  intl: ^0.18.0 
   ```


Ensure all dependencies are installed by running `flutter pub get`.

---

## Directory Structure

```plaintext
lib/
├── main.dart            # Main entry point of the application
└── screens/
    └── create_event.dart # Contains the CreateEventScreen implementation
```

---


