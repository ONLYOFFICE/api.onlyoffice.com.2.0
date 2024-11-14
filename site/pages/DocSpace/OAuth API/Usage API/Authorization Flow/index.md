---
order: -2
---

When the user goes to the authorization link, four scenarios are possible.

## Scenario 1. User authorization

If the user is not yet authorized on the portal, an authorization form opens. The user must enter their email and password and click the **Sign in** button. If the authorization is successful, they will be redirected to the pages described in scenarios 2 and 3.

<img alt="Authorization flow" src="/assets/images/docspace/authorization-flow.png" width="400px">

## Scenario 2. Portal selection

If the user has more than one portal with the entered personal data, they will be redirected to the page for choosing the necessary one.

<img alt="Choose portal" src="/assets/images/docspace/choose-portal.png" width="400px">

## Scenario 3. Consent page

If the user is already authorized on the portal, they will be redirected to a consent page where all the application abilities will be listed and the URLs to the privacy policy and terms of service will be displayed. Also there will be the possibility to change the user profile.

Click **Allow** or **Deny** to finish the authorization flow.

<img alt="Consent page" src="/assets/images/docspace/consent-page.png" width="400px">

## Scenario 4. Error page

If the authorization link contains non-existent [client_id](../Auth%20Button/index.md#client_id) and [redirect_uri](../Auth%20Button/index.md#redirect_uri), the user will be redirected to the DocSpace error page.

<img alt="Error page" src="/assets/images/docspace/error-page.png" width="400px">

## How it works

1. When the user clicks the **Allow** button on the consent page, they will be redirected to [redirect_uri](#redirect_uri) where the code field will be added to the search.

   > If the user clicks the **Deny** button on the consent page, they will be redirected to [redirect_uri](#redirect_uri) with an error, without the possibility to get JWT.

2. The application exchanges the user code for the access token and refresh token, save them to its storage, and use these tokens to get the access to the DocSpace API.

3. The application sends the POST request:

``` http
{{docspace_address}}/oauth2/token
```

The parameters that must be specified in the request body depends on the client type.

### For client_secret_post

#### client_id

The ID of the client that will be used for authorization.

Example: a585c162-9587-4e5c-8796-d675ff2dbd6c

#### client_secret

The secret of the client that will be used for authorization.

Example: 2e336694-e4b4-45c0-bff6-48bb5704235b

#### grant_type

The OAuth grant type.

Example: authorization_code

#### code

A temporary authorization code that is sent to the client to be exchanged for a token.

Example: OENBaHXhZStQ9eDVIq1NlHu6luruKqJtCp6RhgOFXAeAp4YWoUHtOkGYCPtW7l8T-qtZaoUnmvtHZuJbb3d-wgYtHOKhd-nqisoeiO91u-Z9fsnhtiO318JmihPflIpV

#### redirect_uri

The URL where the user will be redirected after successful or unsuccessful authentication.

Example: `https://redirect-url.com`

### For client with PKCE

For the client with PKCE, the parameters are the same as for **client_secret_post**, but the [client_secret](#client_secret) must be replaced with the **code_verifier**.

#### code_verifier

The code verifier, a cryptographically random string between 43 and 128 characters long.

Example: e60fa46a25136f901ad3c21ea96bdfecd2b14106ad8ca278c2462a4d1b0ff1da2d03aa27
