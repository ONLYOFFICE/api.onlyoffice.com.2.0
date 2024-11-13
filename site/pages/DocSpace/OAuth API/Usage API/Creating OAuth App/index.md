---
order: -6
---

To create a new OAuth application on your portal:

1. Go to the DocSpace settings.

2. Navigate to the **Developer Tools** section.

3. Open the **OAuth 2.0** tab.

4. Click **Register a new application**.

   ![OAuth new app](/assets/images/docspace/oauth-new-app.png)

5. Specify the settings for your application:

## Basic info

### App name

The application name that will be displayed on all consent screens and in the app list.

Presence: required

### Website URL

The URL to the home page of the application website.

Presence: required

### App icon

The application icon that will be displayed on all consent screens and in the app list. Available icon extensions: JPG, PNG, or SVG. The required icon size is 32x32.
Presence: required

### Description

The application brief description.

Presence: optional

### Authentication method

The verification method when receiving a JWT token. To receive the token, you will need to send the SHA key. Check **Allow public client (PKCE)** to use PKCE.

PKCE ([RFC 7636](https://www.rfc-editor.org/rfc/rfc7636)) is an extension to the [Authorization Code flow](https://oauth.net/2/grant-types/authorization-code/) to prevent CSRF and authorization code injection attacks.

PKCE is not a form of client authentication, and PKCE is not a replacement for a client secret or other client authentication. PKCE is recommended even if a client is using a client secret or other form of [client authentication](https://oauth.net/2/client-authentication/) like [private_key_jwt](https://oauth.net/private-key-jwt/).

Because PKCE is not a replacement for client authentication, it does not allow treating a public client as a confidential client.

Presence: optional

### Redirects URLS 

The URLs where the user will be redirected after successfully passing the consent screen. Enter the address and press the **Add** button. You can specify several URLs by clicking ![Plus icon](/assets/images/docspace/plus.png). For example, for test and production versions.

Presence: required

### Allowed origins

The URLs of sources that will be able to make requests to the DocSpace API without CORS blocking. Enter the address and press the **Add** button. You can specify several URLs by clicking ![Plus icon](/assets/images/docspace/plus.png).

Presence: required

![Basic info](/assets/images/docspace/basic-info.png)

## Access scopes

Defines the capabilities of a third-party application in relation to Docspace API. Scopes are used to limit your app's access to all user-related data, and they'll let you specify exactly what kind of access you need. This parameter is required.

| Scope           | Read                                                              | Write                                                                         |
| --------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| Profile         | *accounts.self:read* - view basic information about your profile. | *accounts.self:write* - view and manage basic information about your profile. |
| Accounts        | *accounts:read* - view all accounts.                              | *accounts:write* - view and manage all accounts.                              |
| Files & Folders | *files:read* - view all files and folders.                        | *files:write* - view and manage all files and folders.                        |
| Rooms           | *rooms:read* - view all rooms.                                    | *rooms:write* - view and manage all rooms.                                    |
| Open ID         | *openid* - view your personal data.                               |                                                                               |

Check **Read** or **Write** options near each scope. When selecting the **Write** capability, the **Read** option is automatically enabled.

![Access scopes](/assets/images/docspace/access-scopes.png)

## Support & Legal info

### Privacy policy URL

The URL to the Privacy Policy that must comply with applicable laws and regulations and that make clear how the application collects, uses, shares, retains and otherwise processes personal information.

Presence: required

### Terms of Service URL

The terms and conditions that users must comply with when using this application.

Presence: required

![Support and legal info](/assets/images/docspace/support-and-legal-info.png)

When all settings are specified, click **Save**. A new application will appear in the application list.
