---
order: -3
---

You can generate a developer access token that allows you to make API calls without authorization. To obtain access tokens for other users, apply the standard OAuth flow.

For scoped apps, the token will have the same scope as the app.

To create the developer token:

1. Click ![More icon](/assets/images/docspace/more-icon.png) to open the context menu and choose **Generate token**.

   ![Generate token](/assets/images/docspace/generate-token.png)

2. In the opened modal window, click **Generate**.

   ![Token window](/assets/images/docspace/token-window.png)

3. Click **Copy & Cancel** to copy the generated token and use it later.

The created token has a limited lifetime and will be automatically deprecated when a new one is generated.

## Revoking the token

The token can be revoked:

1. Click ![More icon](/assets/images/docspace/more-icon.png) to open the context menu and choose **Revoke token**.
2. Enter your token in the text field.
3. Click **Revoke**.

![Revoke token](/assets/images/docspace/revoke-token.png)

The validation is performed by application ID and token lifetime.

Any integrations using this token will no longer be able to access the API.
