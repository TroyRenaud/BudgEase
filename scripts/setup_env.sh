#!/bin/bash

# BudgEase Environment Setup Script
# This script helps set up environment variables for the BudgEase app

echo "BudgEase Environment Setup"
echo "=========================="

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo "Error: Please run this script from the budget/ directory"
    exit 1
fi

# Check if .env file already exists
if [ -f ".env" ]; then
    echo "Warning: .env file already exists."
    read -p "Do you want to overwrite it? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Setup cancelled."
        exit 0
    fi
fi

# Copy from actual template if available, otherwise use regular template
if [ -f ".env.template.actual" ]; then
    cp .env.template.actual .env
    echo "Created .env file from actual configuration template"
    echo "Note: This contains your current Firebase configuration values."
    echo "For security, consider creating a new Firebase project with your own keys."
elif [ -f ".env.template" ]; then
    cp .env.template .env
    echo "Created .env file from template"
else
    echo "Error: No template files found (.env.template or .env.template.actual)"
    exit 1
fi

echo ""
echo "Please review the .env file with your configuration values:"
echo "1. Firebase API keys from Firebase Console"
echo "2. Google OAuth Client ID from Google Cloud Console"
echo "3. Other configuration values as needed"
echo ""
echo "File location: $(pwd)/.env"
echo ""
echo "Remember: NEVER commit the .env file to version control!"
echo "The .gitignore file is already configured to exclude it."

# Make the script executable on next run
chmod +x "$0"

echo ""
echo "Setup complete. Your .env file is ready with current configuration."
