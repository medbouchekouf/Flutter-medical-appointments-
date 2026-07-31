# MedBook - Medical Appointment App

A complete, fully functional medical appointment booking application built with Flutter.

## Features

- **Home Dashboard**: Quick health stats, upcoming appointment card, specialty shortcuts, top doctors
- **Doctor Search**: Real-time search by name/specialty, filter by specialty chips
- **Doctor Profiles**: Full profile with photo, rating, experience, about, available days
- **Appointment Booking**: Interactive date picker (14 days), time slot selection, notes
- **Appointments Tab**: Upcoming vs. History tabs, status badges, cancel functionality
- **User Profile**: Editable profile with health stats, appointment counters
- **Local State**: All data persists in-memory during session (singleton pattern)

## Quick Start

1. Make sure you have Flutter installed:
   ```bash
   flutter doctor
   ```

2. Navigate to the project:
   ```bash
   cd med_appointment_app
   ```

3. Get dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
med_appointment_app/
├── lib/
│   └── main.dart          # Complete app in a single file
├── pubspec.yaml           # Dependencies
├── analysis_options.yaml  # Lint rules
└── README.md             # This file
```

## Screenshots

The app includes 4 main screens:
- **Home**: Dashboard with health stats and doctor recommendations
- **Doctors**: Search and filter all available doctors
- **Appointments**: Manage upcoming and past appointments
- **Profile**: Edit your personal information and health details

## No Backend Required

This app uses mock data and in-memory state management. All functionality works offline. To connect to a real backend, replace the `AppState` singleton with your API calls.
