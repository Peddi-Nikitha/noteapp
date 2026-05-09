# DezzNote - Flutter Notes Application

A simple and elegant notes application built with Flutter and Firebase, featuring user authentication and secure CRUD operations.

## 📱 Features

- ✅ **User Authentication**
  - Email & Password Sign Up
  - Email & Password Sign In
  - Persistent user sessions (stays logged in after app restart)
  - Secure logout functionality

- ✅ **Notes Management (CRUD)**
  - Create new notes with title, content, and category
  - Read/View all user notes
  - Update existing notes
  - Delete notes with confirmation dialog
  - Notes are user-specific (users can only see their own notes)

- ✅ **Search Functionality** (Additional Requirement - Option B)
  - Search notes by title
  - Real-time client-side search
  - Clear search functionality

- ✅ **Additional Features**
  - Category-based note organization (Study, Work, Personal, Shopping, Misc)
  - Color-coded note cards based on category
  - Clean and intuitive UI following the provided design theme
  - Pull-to-refresh functionality
  - Error handling with user-friendly messages
  - Loading states for all async operations

## 🏗️ Architecture

### Project Structure
```
lib/
├── main.dart                          # App entry point
├── firebase_options.dart              # Firebase configuration
├── models/
│   └── note_model.dart               # Note data model
├── providers/
│   ├── auth_provider.dart            # Authentication state management
│   └── notes_provider.dart           # Notes state management
├── screens/
│   ├── splash_screen.dart            # Initial loading screen
│   ├── auth/
│   │   ├── login_screen.dart         # Login UI
│   │   └── signup_screen.dart        # Sign up UI
│   └── home/
│       ├── home_screen.dart          # Notes list view
│       └── add_edit_note_screen.dart # Create/Edit note UI
└── utils/
    └── theme.dart                     # App theme and colors
```

### State Management
- **Provider Pattern**: Used for state management across the app
- **AuthProvider**: Manages authentication state and user sessions
- **NotesProvider**: Manages notes data and CRUD operations

## 🔥 Firebase Configuration

### Database Schema

**Collection: `notes`**

Each note document contains:
```json
{
  "id": "auto-generated-document-id",
  "title": "string",
  "content": "string",
  "user_id": "string (Firebase Auth UID)",
  "created_at": "timestamp",
  "updated_at": "timestamp",
  "category": "string (Study/Work/Personal/Shopping/Misc)"
}
```

### Firestore Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /notes/{noteId} {
      // Users can only read their own notes
      allow read: if request.auth != null && 
                     resource.data.user_id == request.auth.uid;
      
      // Users can only create notes with their own user_id
      allow create: if request.auth != null && 
                       request.resource.data.user_id == request.auth.uid;
      
      // Users can only update their own notes
      allow update: if request.auth != null && 
                       resource.data.user_id == request.auth.uid;
      
      // Users can only delete their own notes
      allow delete: if request.auth != null && 
                       resource.data.user_id == request.auth.uid;
    }
  }
}
```

### Authentication Approach

1. **Firebase Authentication** with Email/Password provider
2. **Session Persistence**: Firebase Auth automatically handles session persistence
3. **Auth State Listener**: The app listens to auth state changes to maintain login status
4. **Secure Sign Out**: Properly clears user session and redirects to login

## 🚀 Setup Instructions

### Prerequisites
- Flutter SDK (3.10.4 or higher)
- Dart SDK (3.10.4 or higher)
- Android Studio / VS Code
- Firebase account
- Android device or emulator

### Step 1: Clone the Repository
```bash
git clone <repository-url>
cd notes_app
```

### Step 2: Install Dependencies
```bash
flutter pub get
```

### Step 3: Firebase Setup

#### Option A: Using FlutterFire CLI (Recommended)
1. Install FlutterFire CLI:
```bash
dart pub global activate flutterfire_cli
```

2. Configure Firebase:
```bash
flutterfire configure
```
This will:
- Create a Firebase project (or select existing one)
- Register your app with Firebase
- Generate `firebase_options.dart` with your configuration
- Set up Android and iOS apps automatically

#### Option B: Manual Setup
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or select existing one
3. Add an Android app:
   - Package name: `com.dezznote.dezz_note`
   - Download `google-services.json`
   - Place it in `android/app/`
4. Enable Authentication:
   - Go to Authentication > Sign-in method
   - Enable Email/Password
5. Create Firestore Database:
   - Go to Firestore Database
   - Create database in production mode
   - Add the security rules mentioned above
6. Update `lib/firebase_options.dart` with your Firebase configuration

### Step 4: Update Android Configuration

Ensure `android/app/build.gradle` has:
```gradle
android {
    defaultConfig {
        minSdkVersion 21  // Firebase requires minimum SDK 21
        targetSdkVersion 34
    }
}
```

### Step 5: Run the App
```bash
# Check connected devices
flutter devices

# Run on connected device
flutter run

# Or run in release mode
flutter run --release
```

## 📦 Building APK

### Debug APK
```bash
flutter build apk --debug
```
Output: `build/app/outputs/flutter-apk/app-debug.apk`

### Release APK
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

### Split APKs by ABI (Smaller file size)
```bash
flutter build apk --split-per-abi
```
This creates separate APKs for different architectures:
- `app-armeabi-v7a-release.apk`
- `app-arm64-v8a-release.apk`
- `app-x86_64-release.apk`

## 🧪 Testing the App

### Test Accounts
You can create test accounts directly in the app using the Sign Up screen.

### Testing Checklist
- [ ] Sign up with new email/password
- [ ] Sign in with existing credentials
- [ ] Session persists after closing and reopening app
- [ ] Create a new note
- [ ] Edit an existing note
- [ ] Delete a note
- [ ] Search notes by title
- [ ] Different categories show different colors
- [ ] Pull to refresh updates notes list
- [ ] Sign out clears session
- [ ] Users cannot see other users' notes

## 🎨 Design Theme

The app follows a purple-themed design with:
- **Primary Color**: `#5B3A70` (Deep Purple)
- **Secondary Color**: `#8B6FA8` (Light Purple)
- **Background**: `#F5F5F7` (Light Gray)
- **Category Colors**:
  - Study: Light Blue (`#B8D4E8`)
  - Work: Light Pink (`#F4C4D0`)
  - Personal: Light Green (`#C8E6C9`)
  - Shopping: Light Yellow (`#FFF9C4`)
  - Misc: Light Purple (`#D1C4E9`)

## 📚 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Firebase
  firebase_core: ^3.8.1
  firebase_auth: ^5.3.4
  cloud_firestore: ^5.5.2
  
  # State Management
  provider: ^6.1.2
  
  # UI
  google_fonts: ^6.2.1
  intl: ^0.19.0
```

## 🔒 Security Features

1. **Firestore Security Rules**: Ensures users can only access their own notes
2. **Firebase Authentication**: Secure email/password authentication
3. **Input Validation**: All forms have proper validation
4. **Error Handling**: Graceful error handling with user-friendly messages

## 🐛 Known Issues & Limitations

- Offline mode is not implemented (requires internet connection)
- No image attachments in notes
- No note sharing functionality
- Search is case-insensitive but only searches titles, not content

## 🔮 Future Enhancements

- Offline support with local caching
- Rich text editing
- Image attachments
- Note sharing
- Reminders and notifications
- Dark mode
- Biometric authentication

## 📝 Assumptions & Trade-offs

### Assumptions
1. Users have a stable internet connection
2. Email addresses are unique and valid
3. Users understand basic note-taking concepts
4. Firebase free tier is sufficient for testing

### Trade-offs
1. **Provider vs Bloc**: Chose Provider for simplicity and faster development
2. **Client-side search**: Implemented client-side search instead of Firestore queries for better performance with small datasets
3. **No offline support**: Prioritized core features over offline functionality
4. **Simple categories**: Fixed categories instead of user-defined tags for simplicity

## 👨‍💻 Development Notes

- **Flutter Version**: 3.10.4+
- **Minimum Android SDK**: 21 (Android 5.0)
- **Target Android SDK**: 34 (Android 14)
- **Development Time**: Designed for 3-day completion
- **Code Style**: Follows Flutter/Dart best practices and conventions

## 📄 License

This project is created as a technical assignment and is free to use for evaluation purposes.

## 📧 Support

For any issues or questions, please create an issue in the repository or contact the developer.

---

**Built with ❤️ using Flutter and Firebase**
# noteapp
