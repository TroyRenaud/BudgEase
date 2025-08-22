# Complete Google OAuth Setup Guide

## Step 1: Configure OAuth Consent Screen for Public Access

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Select your "BudgEase" project (budgease-460b5)
3. Go to **APIs & Services** → **OAuth consent screen**
4. **CRITICAL:** Choose **External** (NOT Internal) - Internal is only for Google Workspace organizations
5. Fill in the required information:
   - **App name:** BudgEase
   - **User support email:** troyrenaud@gmail.com
   - **Developer contact information:** troyrenaud@gmail.com
   - **Application home page:** `https://budgease.renaud.co.za/`
   - **Application privacy policy link:** `https://budgease.renaud.co.za/privacy-policy.html`
   - **Application terms of service link:** `https://budgease.renaud.co.za/terms-of-service.html`
6. Add these **Scopes**:
   - `.../auth/userinfo.email`
   - `.../auth/userinfo.profile`
   - `openid`
7. **For PUBLIC ACCESS:** You need to complete Google's verification process:
   - Go through all the setup steps
   - Submit your app for verification (this can take several days)
   - Google will review your app's privacy policy, terms of service, etc.
8. **Alternative for immediate testing:** Add test users - Click "Add users" and add: troyrenaud@gmail.com
9. Save and continue through all steps
10. **Wait for propagation:** Changes may take a few minutes to take effect

## Step 2: Create OAuth Client ID

1. Go to **APIs & Services** → **Credentials**
2. Click **+ CREATE CREDENTIALS** → **OAuth client ID**
3. Configure the OAuth client:
   - **Application type:** Web application
   - **Name:** BudgEase Web Client
4. Add these **Authorized JavaScript origins**:
   - `https://budgease-460b5.web.app`
   - `https://budgease-460b5.firebaseapp.com`
   - `http://localhost:5000`
   - `http://localhost:3000`
5. Add these **Authorized redirect URIs**:
   - `https://budgease-460b5.web.app/__/auth/handler`
   - `https://budgease-460b5.firebaseapp.com/__/auth/handler`
   - `http://localhost:5000/__/auth/handler`
   - `http://localhost:3000/__/auth/handler`
6. Click **CREATE**

## Step 3: Get Your Client ID

1. After creating the OAuth client, you'll see a popup with your **Client ID**
2. Copy the Client ID (it will look like: `516705496948-vu3rlgecsre58glehfk08p44td3nb58p.apps.googleusercontent.com`)

## Step 4: Update Your App Configuration

1. Open `BudgEase-main/budget/web/index.html`
2. Find this line:
   ```html
   <meta name="google-signin-client_id" content="YOUR_WEB_CLIENT_ID">
   ```
3. Replace `YOUR_WEB_CLIENT_ID` with your actual Client ID:
   ```html
   <meta name="google-signin-client_id" content="516705496948-vu3rlgecsre58glehfk08p44td3nb58p.apps.googleusercontent.com">
   ```

## Step 5: Enable Google Sign-In in Firebase

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your "BudgEase" project
3. Go to **Authentication** → **Sign-in method**
4. Enable **Google** as a sign-in provider
5. Add your support email
6. Save the configuration

## Step 6: Test Your Setup

1. Build and deploy your app:
   ```bash
   cd BudgEase-main/budget
   flutter build web
   firebase deploy
   ```

2. Open your app: `https://budgease-460b5.web.app`
3. Test Google Sign In - the redirect_uri_mismatch error should be resolved

## Troubleshooting

- **If you still get errors**: Double-check that all redirect URIs are exactly as shown above
- **Make sure**: The OAuth client is for "Web application" type, not other types
- **Verify**: Firebase Authentication has Google sign-in enabled

## Important Notes

- The redirect_uri_mismatch error occurs because Google doesn't recognize your app's domain as an authorized redirect URI
- This setup must be done in Google Cloud Console, not Firebase Console
- The process may take a few minutes to propagate after saving changes
