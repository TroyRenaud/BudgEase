import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static Future<void> load() async {
    await dotenv.load(fileName: '.env');
  }

  // Firebase Configuration
  static String get firebaseApiKey => dotenv.get('FIREBASE_API_KEY', fallback: '');
  static String get firebaseAuthDomain => dotenv.get('FIREBASE_AUTH_DOMAIN', fallback: '');
  static String get firebaseProjectId => dotenv.get('FIREBASE_PROJECT_ID', fallback: '');
  static String get firebaseStorageBucket => dotenv.get('FIREBASE_STORAGE_BUCKET', fallback: '');
  static String get firebaseMessagingSenderId => dotenv.get('FIREBASE_MESSAGING_SENDER_ID', fallback: '');
  static String get firebaseAppId => dotenv.get('FIREBASE_APP_ID', fallback: '');
  static String get firebaseMeasurementId => dotenv.get('FIREBASE_MEASUREMENT_ID', fallback: '');

  // Google OAuth Configuration
  static String get googleOAuthClientId => dotenv.get('GOOGLE_OAUTH_CLIENT_ID', fallback: '');

  // Android Configuration
  static String get androidApiKey => dotenv.get('ANDROID_API_KEY', fallback: '');
  static String get androidAppId => dotenv.get('ANDROID_APP_ID', fallback: '');
  static String get androidProjectNumber => dotenv.get('ANDROID_PROJECT_NUMBER', fallback: '');

  // Web Configuration
  static String get webApiKey => dotenv.get('WEB_API_KEY', fallback: '');
  static String get webAppId => dotenv.get('WEB_APP_ID', fallback: '');

  // Environment
  static String get appEnv => dotenv.get('APP_ENV', fallback: 'development');
  static bool get isProduction => appEnv == 'production';
  static bool get isDevelopment => appEnv == 'development';

  // Validation
  static bool get isFirebaseConfigured =>
      firebaseApiKey.isNotEmpty &&
      firebaseProjectId.isNotEmpty &&
      firebaseAppId.isNotEmpty;

  static bool get isGoogleOAuthConfigured => googleOAuthClientId.isNotEmpty;

  static void validate() {
    if (!isFirebaseConfigured) {
      throw Exception('Firebase configuration is missing from .env file');
    }
    if (!isGoogleOAuthConfigured) {
      throw Exception('Google OAuth configuration is missing from .env file');
    }
  }
}
