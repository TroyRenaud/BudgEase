# Google OAuth Verification Process Guide

## Step 1: Prepare Required Documentation

Before starting the verification process, ensure you have:

1. **Privacy Policy URL**: `https://budgease.renaud.co.za/privacy-policy.html`
2. **Terms of Service URL**: `https://budgease.renaud.co.za/terms-of-service.html`
3. **App Logo**: High-quality logo for your application
4. **App Description**: Clear description of what your app does
5. **Support Email**: troyrenaud@gmail.com

## Step 2: Complete OAuth Consent Screen Setup

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Select your "BudgEase" project (budgease-460b5)
3. Navigate to **APIs & Services** → **OAuth consent screen**
4. Ensure all required fields are completed:
   - **App name**: BudgEase
   - **User support email**: troyrenaud@gmail.com
   - **Developer contact information**: troyrenaud@gmail.com
   - **Application home page**: `https://budgease.renaud.co.za/`
   - **Application privacy policy link**: `https://budgease.renaud.co.za/privacy-policy.html`
   - **Application terms of service link**: (add if available)

## Step 3: Add Required Scopes

Make sure these scopes are added to your OAuth consent screen:
- `.../auth/userinfo.email`
- `.../auth/userinfo.profile` 
- `openid`

## Step 4: Submit for Verification

1. In the OAuth consent screen, click **"Submit for verification"**
2. Fill out the verification form with:
   - **App type**: Web application
   - **Explanation of app functionality**: Describe what BudgEase does
   - **Explanation of data access**: Explain why you need access to user data
   - **Video demonstration**: (Optional but recommended) Record a short video showing your app

## Step 5: Provide Additional Information

Google may request:
- **Detailed explanation** of how each scope is used
- **Screenshots** of your application
- **Video demonstration** of the OAuth flow
- **Confirmation** that your app complies with Google's policies

## Step 6: Wait for Review

- Verification typically takes **3-7 business days**
- Google may contact you for additional information
- Monitor your email (troyrenaud@gmail.com) for updates

## Step 7: Post-Approval Steps

Once approved:
1. Your app will be marked as "Verified"
2. The user limit will be removed
3. The app will be publicly accessible to all users
4. No more "unverified app" warnings will appear

## Important Notes:

1. **Testing During Verification**: You can continue testing with up to 100 test users while waiting for verification
2. **Policy Compliance**: Ensure your app complies with Google's API Services User Data Policy
3. **Security**: Implement proper security measures for user data
4. **Updates**: Any changes to scopes or app functionality may require re-verification

## Required Policy Compliance:

- **Transparency**: Clearly explain data usage to users
- **Security**: Protect user data with appropriate security measures
- **Limited Use**: Only use data for the purposes users consented to
- **Data Deletion**: Provide a way for users to delete their data

## Estimated Timeline:

- **Preparation**: 1-2 days (gathering documentation)
- **Submission**: 30 minutes (filling out the form)
- **Review**: 3-7 business days
- **Total**: Approximately 1-2 weeks

## Support Resources:

- [Google OAuth Verification Help Center](https://support.google.com/cloud/answer/9110914)
- [Google API Services User Data Policy](https://developers.google.com/terms/api-services-user-data-policy)
- [OAuth Application Verification](https://developers.google.com/identity/protocols/oauth2/web-server#verification)

Remember to check your email regularly during the verification process as Google may request additional information.
