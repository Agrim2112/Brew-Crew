# Brew Crew

Brew Crew is a mobile application built using Flutter and Firebase, allowing users to sign in, register, and manage their custom coffee preferences. Users can personalize their coffee by specifying the name, coffee strength, and sugar level. Additionally, users can view other people's coffee preferences to get inspiration or try something new.

## Features

- **User Authentication:** Register and sign in with an email and password.
- **Custom Coffee Preferences:** Add and edit your own coffee preferences including the coffee name, strength, and sugar level.
- **View Other Preferences:** Browse and view coffee preferences created by other users.

## Tech Stack

- **Flutter:** Frontend framework for building the mobile app.
- **Firebase Authentication:** User authentication and management.
- **Firebase Firestore:** Database to store and manage coffee preferences.
- **Firebase Analytics:** Track user interactions and app usage.

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) - Ensure Flutter is installed on your machine.
- [Firebase Account](https://firebase.google.com/) - Set up a Firebase project.

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/brew-crew.git
   cd brew-crew
   
2. **Install dependencies:**
    ```bash
    flutter pub get
    ```

3. **Set up Firebase:**
    - Go to the [Firebase Console](https://console.firebase.google.com/).
    - Create a new project and add an Android/iOS app to the project.
    - Download the `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) file.
    - Place the `google-services.json` file in the `android/app` directory and `GoogleService-Info.plist` in the `ios/Runner` directory.

4. **Run the app:**
    ```bash
    flutter run
    ```
