<h1 align="center" style="font-size:28px; line-height:1"><b>BudgEase</b></h1>

<div align="center">
  <img alt="Icon" src="promotional/icons/icon.png" width="150px">
</div>

<p align="center">
  BudgEase is a budget and expense tracking app built with Flutter, Drift (SQLite) and Firebase. It helps you manage accounts, track transactions, set budgets & goals, and view spending insights across devices.
</p>

## What BudgEase Does
BudgEase provides a simple but powerful interface for tracking personal finances. Add expenses and income, set recurring transactions, create budgets with custom time periods, and back up your data to Google Drive. The app is designed to work on mobile and web (PWA) and supports multiple accounts and currencies.

## Key Features
- Budget creation with custom time periods (monthly, weekly, custom)
- Transaction types: one-off, repeating, subscription, upcoming, loans/credits
- Categories & subcategories with icons and custom labels
- Multiple accounts (wallets) and currency conversion
- Goals (savings & spend targets) and budget category limits
- Biometric lock and Google Sign-In (optional)
- Import CSV or Google Sheets; export backups to Google Drive
- Light/dark themes and customizable accent color
- Offline-first: data stored locally (Drift/SQLite) with optional cloud backups

## Quick Start (development)
- Install Flutter and required SDKs
- From repo root build web:
  - cd budget && flutter build web
- Deploy (example using Firebase Hosting):
  - firebase deploy

## Firebase & OAuth (summary)
- This project can be configured with your own Firebase project (example project id: budgease-460b5).
- For Google Sign-In, register a Web OAuth client in Google Cloud Console and add authorized redirect URIs:
  - https://budgease-460b5.web.app/__/auth/handler
  - https://budgease-460b5.firebaseapp.com/__/auth/handler
  - http://localhost:5000/__/auth/handler
- Update the web client id in budget/web/index.html:
  <meta name="google-signin-client_id" content="YOUR_WEB_CLIENT_ID">

(See GOOGLE_OAUTH_SETUP_GUIDE.md and SETUP_NEW_FIREBASE_GUIDE.md for full instructions.)

## App Links / Deep Links (web)
BudgEase supports app links for adding transactions via URL parameters. Example:
- Add a single expense: https://budgease.renaud.co.za/addTransaction?amount=-50&title=Groceries&category=Food
- Add multiple via encoded JSON: https://budgease.renaud.co.za/addTransaction?JSON=...

(Refer to in-repo docs for parameter details.)

## Backup & Sync
- Backups use Google Drive (user's own Drive) — developer does not access your Drive backups.
- Local data is stored using Drift (SQLite) and settings are stored locally.

## Translations
- Translations are maintained in the repository. To update:
  - Run: budget\assets\translations\generate-translations.py
  - Restart the app

## Release & Source
- Website: https://budgease.renaud.co.za/
- Privacy Policy: https://budgease.renaud.co.za/privacy-policy.html
- Terms of Service: https://budgease.renaud.co.za/terms-of-service.html
- Source & releases (original project repo): https://github.com/jameskokoska/Cashew/releases/

## Developer Notes (short)
- Wallets == Accounts internally; Objectives == Goals in UI mappings.
- Use getPlatform() and pushRoute(context, page) helpers in budget/lib for platform-aware behavior.
- Database migrations: edit tables.dart, bump schemaVersionGlobal, then run build_runner and drift_dev commands (see repo docs).

## License & Credits
- Licensed under GNU GPL v3 (see LICENSE file).
- See in-repo credits and package licenses for bundled/third-party components.

## Contact / Support
- Support: troyrenaud@gmail.com

For full documentation, developer guides, and detailed feature descriptions, explore the files in the repository. If you want further trimming or additional sections (screenshots, architecture, contributing), tell me which to add or remove.
