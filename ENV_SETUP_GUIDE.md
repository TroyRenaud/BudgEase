# Environment Variables Setup Guide for BudgEase

This guide explains how to set up environment variables for secure configuration management.

## Overview

BudgEase now uses environment variables for sensitive configuration instead of hardcoded values in files. This approach:

1. **Security**: Keeps API keys and secrets out of version control
2. **Flexibility**: Easy to switch between development and production environments
3. **Collaboration**: Team members can use their own Firebase projects

## Setup Steps

### 1. Install Dependencies

Run the following command to install the required package:

```bash
cd budget
flutter pub get
```

### 2. Create Your .env File

Copy the template file and create your actual `.env` file:

```bash
cd budget
cp .env.template .env
```

### 3. Configure Your Environment Variables

Open the `.env` file and replace the placeholder values with your actual configuration:

```env
# Firebase Configuration
FIREBASE_API_KEY=your_actual_firebase_api_key
FIREBASE_AUTH_DOMAIN=your_project_id.firebaseapp.com
FIREBASE_PROJECT_ID=your_actual_project_id
FIREBASE_STORAGE_BUCKET=your_project_id.appspot.com
FIREBASE_MESSAGING_SENDER_ID=your_actual_messaging_sender_id
FIREBASE_APP_ID=your_actual_app_id
FIREBASE_MEASUREMENT_ID=your_measurement_id

# Google OAuth Configuration
GOOGLE_OAUTH_CLIENT_ID=your_actual_google_oauth_client_id

# Environment
APP_ENV=development
```

### 4. Get Your Firebase Configuration Values

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Go to Project Settings ⚙️ → General
4. Under "Your apps", find your app and click on it
5. Copy the configuration values

### 5. Get Your Google OAuth Client ID

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Select your project
3. Go to APIs & Services → Credentials
4. Find your OAuth 2.0 Client ID for web applications
5. Copy the Client ID

### 6. Security Considerations

- **Never commit** your `.env` file to version control
- The `.gitignore` file is already configured to exclude `.env`
- Keep your `.env` file secure and don't share it publicly

### 7. Development vs Production

You can create multiple environment files:

- `.env.development` - For local development
- `.env.production` - For production deployment
- `.env.staging` - For staging environment

To use a specific environment file, modify the `EnvConfig.load()` call in `lib/main.dart`:

```dart
// For development
await dotenv.load(fileName: '.env.development');

// For production  
await dotenv.load(fileName: '.env.production');
```

### 8. Build and Run

After configuring your environment variables, build and run the app:

```bash
flutter run
```

## Troubleshooting

### Common Issues

1. **Missing .env file**: Make sure you created `.env` from `.env.template`
2. **Invalid values**: Double-check your Firebase and Google Cloud configuration
3. **File not loading**: Ensure the `.env` file is in the `budget/` directory

### Validation

The app includes validation that will throw an error in release mode if required environment variables are missing.

## File Structure

```
budget/
├── .env.template          # Template file (safe to commit)
├── .env                   # Your actual configuration (DO NOT COMMIT)
├── lib/
│   └── config/
│       └── env_config.dart # Environment configuration class
└── lib/main.dart          # Updated to load environment variables
```

## Support

If you encounter issues with the environment variable setup, please check:
- Firebase project configuration
- Google OAuth client setup
- File permissions for the `.env` file
