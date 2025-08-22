# Complete Guide: Setting Up Your Own Firebase Project for BudgEase

## ✅ Firebase Configuration Complete!
The FlutterFire CLI has successfully configured your Firebase project with the following details:

**Project ID:** budgease-460b5  
**Web App ID:** 1:805148220172:web:0bd8a799dc09c091d54729  
**API Key:** AIzaSyBSGhXHylgDjqC64Tq8CvlvMp3VJaAmmnk

## Step 1: Set Up Google OAuth (Critical for Google Sign In)

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Select your project "BudgEase" (budgease-460b5)
3. Go to **APIs & Services** → **Credentials**
4. Find your **OAuth 2.0 Client ID** for web applications
5. Click on the client ID and add these **Authorized redirect URIs**:
   - `https://budgease-460b5.web.app/__/auth/handler`
   - `https://budgease-460b5.firebaseapp.com/__/auth/handler`
   - `http://localhost:5000/__/auth/handler` (for local development)
   - `http://localhost:3000/__/auth/handler` (alternative local port)

6. Copy the **Client ID** and update it in `web/index.html`:
```html
<meta name="google-signin-client_id" content="YOUR_ACTUAL_WEB_CLIENT_ID">
```

## Step 2: Enable Required Services in Firebase Console

1. **Authentication**: 
   - Go to **Authentication** → **Sign-in method**
   - Enable **Google** as a sign-in provider

2. **Firestore Database** (if needed):
   - Go to **Firestore Database** → **Create database**
   - Choose production mode or test mode

## Step 3: Deploy Your App

```bash
cd Cashew-main/budget
flutter build web
firebase deploy
```

## Step 4: Test Google Sign In

1. Open your deployed app: `https://budgease-460b5.web.app`
2. Test the Google Sign In functionality
3. If you get redirect_uri_mismatch errors, double-check Step 1

## Troubleshooting

- **Redirect URI mismatch**: Ensure all authorized redirect URIs are correctly added in Google Cloud Console
- **Authentication errors**: Make sure Google sign-in is enabled in Firebase Authentication

## Important Notes

- Your Firebase project ID: `budgease-460b5`
- Your web app will be deployed to: `https://budgease-460b5.web.app`
- Only the Google OAuth Client ID needs to be updated in `web/index.html`
