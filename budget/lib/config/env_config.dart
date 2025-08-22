import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static Future<void> load() async {
    // No longer loading from .env file since values are hardcoded
  }

  // Firebase Configuration
  static String get firebaseApiKey => "AIzaSyBSGhXHylgDjqC64Tq8CvlvMp3VJaAmmnk";
  static String get firebaseAuthDomain => "budgease-460b5.firebaseapp.com";
  static String get firebaseProjectId => "budgease-460b5";
  static String get firebaseStorageBucket => "budgease-460b5.firebasestorage.app";
  static String get firebaseMessagingSenderId => "805148220172";
  static String get firebaseAppId => "1:805148220172:web:0bd8a799dc09c091d54729";
  static String get firebaseMeasurementId => "G-JJ5WQ4YGY6";

  // Google OAuth Configuration
  static String get googleOAuthClientId => "516705496948-vu3rlgecsre58glehfk08p44td3nb58p.apps.googleusercontent.com";

  // Android Configuration
  static String get androidApiKey => "AIzaSyBSGhXHylgDjqC64Tq8CvlvMp3VJaAmmnk";
  static String get androidAppId => "1:805148220172:web:0bd8a799dc09c091d54729";
  static String get androidProjectNumber => "805148220172";

  // Web Configuration
  static String get webApiKey => "AIzaSyBSGhXHylgDjqC64Tq8CvlvMp3VJaAmmnk";
  static String get webAppId => "1:805148220172:web:0bd8a799dc09c091d54729";

  // Environment
  static String get appEnv => "development";
  static bool get isProduction => false;
  static bool get isDevelopment => true;

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
