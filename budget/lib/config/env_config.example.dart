// Example env config file. Replace values locally and do NOT commit real secrets.

import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static Future<void> load() async {
    // Example loader — in your local environment use a real .env and flutter_dotenv
    // await dotenv.load(fileName: ".env");
  }

  // Firebase Configuration (PLACEHOLDERS)
  static String get firebaseApiKey => "YOUR_FIREBASE_API_KEY";
  static String get firebaseAuthDomain => "YOUR_FIREBASE_AUTH_DOMAIN";
  static String get firebaseProjectId => "YOUR_FIREBASE_PROJECT_ID";
  static String get firebaseStorageBucket => "YOUR_FIREBASE_STORAGE_BUCKET";
  static String get firebaseMessagingSenderId => "YOUR_MESSAGING_SENDER_ID";
  static String get firebaseAppId => "YOUR_FIREBASE_APP_ID";
  static String get firebaseMeasurementId => "YOUR_MEASUREMENT_ID";

  // Google OAuth Configuration
  static String get googleOAuthClientId =>
      "YOUR_GOOGLE_OAUTH_CLIENT_ID.apps.googleusercontent.com";

  // Android Configuration (placeholders)
  static String get androidApiKey => "YOUR_ANDROID_API_KEY";
  static String get androidAppId => "YOUR_ANDROID_APP_ID";
  static String get androidProjectNumber => "YOUR_ANDROID_PROJECT_NUMBER";

  // Web Configuration
  static String get webApiKey => "YOUR_WEB_API_KEY";
  static String get webAppId => "YOUR_WEB_APP_ID";

  // Environment
  static String get appEnv => "development";
  static bool get isProduction => false;
  static bool get isDevelopment => true;

  // Validation (basic)
  static bool get isFirebaseConfigured =>
      firebaseApiKey.isNotEmpty &&
      firebaseProjectId.isNotEmpty &&
      firebaseAppId.isNotEmpty;

  static bool get isGoogleOAuthConfigured => googleOAuthClientId.isNotEmpty;

  static void validate() {
    if (!isFirebaseConfigured) {
      throw Exception(
          'Firebase configuration is missing from env_config.example.dart');
    }
    if (!isGoogleOAuthConfigured) {
      throw Exception(
          'Google OAuth configuration is missing from env_config.example.dart');
    }
  }
}
