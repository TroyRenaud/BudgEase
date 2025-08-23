<h1 align="center" style="font-size:28px; line-height:1"><b>BudgEase</b></h1>

<div align="center">
  <img alt="Icon" src="promotional/icons/icon.png" width="150px">
</div>

<p align="center">
  BudgEase is a cross-platform budget and expense tracking app built with Flutter, Drift (SQLite) and Firebase. It helps you manage accounts, track transactions, set budgets & goals, and get insight into your spending — on mobile and web.
</p>

---

## Table of contents
- What BudgEase does
- Detailed features
- Quick start (user)
- Quick start (developer)
- Web & Firebase notes
- App links / deep links
- Import / export & backups
- Translations
- Troubleshooting & tips
- Release, changelog & license
- Contact & support

---

## What BudgEase does
BudgEase provides a simple, privacy-conscious way to track personal finances:
- Add and categorize expenses and income
- Create budgets with custom time periods
- Track repeating subscriptions and upcoming payments
- Support for multiple accounts and currencies
- Local-first storage with optional cloud backup and sync

---

## Detailed features
- Budgeting
  - Create budgets (monthly, weekly, daily or custom ranges)
  - Assign spending limits per category within a budget
  - View historical budgets and compare across periods
- Transactions
  - One-off, repeating, subscription, upcoming, loans/credits
  - Custom categories & subcategories (with icons)
  - Auto-assign categories based on transaction titles (title memory)
  - Search, filter and bulk edit/delete transactions
- Accounts & Currencies
  - Multiple accounts (internally: "wallets")
  - Display original amount and converted amount per selected account
  - Automatic currency conversion using configured rates
- Goals & Automation
  - Saving and spending goals, contribution tracking
  - Notifications and reminders for goals, budgets and payments
- UX & Security
  - Material design with adaptive themes, light/dark and custom accent color
  - Biometric lock and Google Sign-In (optional)
- Data & Interoperability
  - Import CSV or Google Sheets
  - App links to prefill/add transactions via URL
  - Google Drive backups (user-owned Drive)

---

## Quick start (user)
1. Install the app on your platform (mobile or web).
2. Create an account or use local-only mode.
3. Add an account, create categories and add your first transaction.
4. Set budgets and goals from the Budgets/Goals screen.
5. Enable Google Drive backup if you want cloud backups.

---

## Quick start (developer)
Prerequisites:
- Flutter (stable channel), Dart SDK compatible with this repo
- Android/iOS SDKs for mobile builds
- Firebase CLI (if deploying web)

Common commands:
- Get packages: cd budget && flutter pub get
- Run on device/emulator: flutter run
- Build web: cd budget && flutter build web
- Build Android app bundle: flutter build appbundle --release
- Build iOS IPA: flutter build ipa (macOS required)

Important dev files:
- budget/pubspec.yaml — package dependencies and assets
- budget/lib — application source code
- budget/assets — bundled assets and translations

Notes:
- Database: Drift (drift_dev + build_runner used to generate DB code)
- Migrations: bump schemaVersionGlobal in tables.dart then use drift_dev to export/import schema and generate steps

---

## Web & Firebase notes
- This project can be deployed as a PWA using Firebase Hosting.
- Example Firebase project id used in docs: budgease-460b5.
- For Google Sign-In on web:
  - Register an OAuth web client in Google Cloud Console
  - Add authorized redirect URIs (see SETUP_NEW_FIREBASE_GUIDE.md and GOOGLE_OAUTH_SETUP_GUIDE.md)
  - Add the client ID into budget/web/index.html: <meta name="google-signin-client_id" content="YOUR_WEB_CLIENT_ID">
- To deploy web:
  - cd budget && flutter build web
  - firebase deploy

See SETUP_NEW_FIREBASE_GUIDE.md and GOOGLE_OAUTH_SETUP_GUIDE.md in this repo for step-by-step instructions.

---

## Import / Export & Backups
- CSV / Google Sheets import to bulk add transactions.
- Backups:
  - Local backups stored on device.
  - Optional backups to your Google Drive (app stores backups in user Drive; developer does not access your Drive).
- Export options: CSV or Drive backups for migrating or restoring data.

---

## Translations
- Translations maintained in repo assets and a Google Sheets file (documented in repo).
- To regenerate translations:
  - Run: budget\assets\translations\generate-translations.py
  - Restart the app

---

## Troubleshooting & tips
- If web Google Sign-In returns redirect_uri_mismatch, confirm OAuth client redirect URIs in Google Cloud Console match deployed domain and firebase auth handler URI.
- For Android app links to open your app instead of browser, ensure the associated domain and assetlinks are configured if using verified App Links.
- When modifying database schema:
  - Bump schemaVersionGlobal in tables.dart
  - Run dart run build_runner build
  - Use drift_dev schema export and migration steps as documented in repo

---

## Release, changelog & license
- Releases and historical changes: see original project releases and commits (link below).
- License: GNU GPL v3 (see LICENSE file in repo).
- Source & releases (original project repo): https://github.com/jameskokoska/Cashew/releases/

---

## Credits & bundled packages
- This repo bundles modified versions of some packages under budget/packages (see README inside budget).
- See LICENSE and package files for third-party attributions.

---

## Contact & support
- Support / developer contact: troyrenaud@gmail.com
- For contributions and issues, open an issue in the original repository or reach out.

---
