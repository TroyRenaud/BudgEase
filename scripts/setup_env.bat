@echo off
REM BudgEase Environment Setup Script for Windows
REM This script helps set up environment variables for the BudgEase app

echo BudgEase Environment Setup
echo ==========================

REM Check if we're in the right directory
if not exist pubspec.yaml (
    echo Error: Please run this script from the budget/ directory
    pause
    exit /b 1
)

REM Check if .env file already exists
if exist .env (
    echo Warning: .env file already exists.
    set /p overwrite="Do you want to overwrite it? (y/N): "
    if /i not "%overwrite%"=="y" (
        echo Setup cancelled.
        pause
        exit /b 0
    )
)

REM Copy from actual template if available, otherwise use regular template
if exist .env.template.actual (
    copy .env.template.actual .env >nul
    echo Created .env file from actual configuration template
    echo Note: This contains your current Firebase configuration values.
    echo For security, consider creating a new Firebase project with your own keys.
) else if exist .env.template (
    copy .env.template .env >nul
    echo Created .env file from template
) else (
    echo Error: No template files found (.env.template or .env.template.actual)
    pause
    exit /b 1
)

echo.
echo Please edit the .env file with your actual configuration values:
echo 1. Firebase API keys from Firebase Console
echo 2. Google OAuth Client ID from Google Cloud Console
echo 3. Other configuration values as needed
echo.
echo File location: %CD%\.env
echo.
echo Remember: NEVER commit the .env file to version control!
echo The .gitignore file is already configured to exclude it.

echo.
echo Setup complete. Please edit the .env file with your actual values.
pause
