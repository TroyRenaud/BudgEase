# Firebase Setup Checklist

## ✅ Completed Steps
- [x] Created new Firebase project: "BudgEase" (budgease-460b5)
- [x] Initialized Firebase Hosting configuration
- [x] Updated .firebaserc with new project ID
- [x] Updated firebase.json configuration
- [x] ✅ **AUTOMATED** - FlutterFire CLI configured firebase_options.dart
- [x] ✅ **AUTOMATED** - Updated web/index.html with Firebase config

## 🔄 Steps to Complete

### 1. Set Up Google OAuth (Critical for Google Sign In)
- [ ] Go to Google Cloud Console → Credentials
- [ ] Add authorized redirect URIs:
  - [ ] `https://budgease-460b5.web.app/__/auth/handler`
  - [ ] `https://budgease-460b5.firebaseapp.com/__/auth/handler`
  - [ ] `http://localhost:5000/__/auth/handler`
  - [ ] `http://localhost:3000/__/auth/handler`
- [ ] Copy Web Client ID and update in `web/index.html`:
  ```html
  <meta name="google-signin-client_id" content="516705496948-vu3rlgecsre58glehfk08p44td3nb58p.apps.googleusercontent.com">
  ```

### 2. Enable Firebase Services
- [ ] Enable Google Authentication in Firebase Console
- [ ] Set up Firestore Database (if needed)

### 3. Deploy and Test
- [ ] Run: `flutter build web`
- [ ] Run: `firebase deploy`
- [ ] Test Google Sign In at: `https://budgease-460b5.web.app`

## Files to Update
- `web/index.html` - Only Google OAuth client ID needs updating

## Expected URLs
- Web App: https://budgease-460b5.web.app
- Auth Domain: budgease-460b5.firebaseapp.com
- Storage: budgease-460b5.firebasestorage.app

## Current Configuration
- **Project ID:** budgease-460b5
- **Web App ID:** 1:805148220172:web:0bd8a799dc09c091d54729
- **API Key:** AIzaSyBSGhXHylgDjqC64Tq8CvlvMp3VJaAmmnk
- Storage: budgease-460b5.firebasestorage.app

## Current Configuration
- **Project ID:** budgease-460b5
- **Web App ID:** 1:805148220172:web:0bd8a799dc09c091d54729
- **API Key:** AIzaSyBSGhXHylgDjqC64Tq8CvlvMp3VJaAmmnk
