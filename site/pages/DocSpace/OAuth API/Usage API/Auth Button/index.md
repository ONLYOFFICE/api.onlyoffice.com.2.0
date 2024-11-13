---
order: -4
---

1. To preview an auth button in your application, click ![More icon](/assets/images/docspace/more-icon.png) to open the context menu and choose **Auth button**.

   ![Auth button](/assets/images/docspace/auth-button.png)

2. In the opened window, copy HTML, CSS, and JavaScript code blocks and use them to embed a button into your website.

    <img alt="Preview" src="/assets/images/docspace/preview.png" width="400px">

3. Copy the **Authorize link** and assign it to the authorization button. This link contains the following parameters:

## response_type

The type of the server response after authenticating the user and redirecting them to [redirect_uri](#redirect_uri). Currently, the *code* value is supported.

Example: code

## client_id

The ID of the client that will be used for authorization.

Example: a585c162-9587-4e5c-8796-d675ff2dbd6c

## redirect_uri

The URL where the user will be redirected after successful or unsuccessful authentication.

Example: `https://redirect-url.com`

## scope

All the possibilities of the current application to work with the DocSpace portal.

To get the required value, use the following code:

``` ts
const scopesString = client.scopes.join(" ")
const encodingScopes = encodeURI(scopesString || "")
```

Example: files:write%20accounts:write%20files:read%20rooms:read%20openid%20accounts.self:read%20accounts:read%20accounts.self:write%20rooms:write

## state

The random string to solve the CSRF vulnerability problem. This parameter with the *code* value will be added to [redirect_uri](#redirect_uri). This parameter is optional, but we recommend to specify it for security purposes.

Example: OENBaHXhZStQ9eDVIq1NlHu6luruKqJtCp6RhgOFXAeAp4YWoUHtOkGYCPtW7l8T-qtZaoUnmvtHZuJbb3d-wgYtHOKhd-nqisoeiO91u-Z9fsnhtiO318JmihPflIpV

## code_challenge_method

The method to encode the code verifier. Two parameters are supported: **plain** and **S256** (preferred). This parameter is used only when the authentication method is not specified (none) and the public client (PKCE) is allowed.

Example: S256

## code_challenge

The encoded code verifier. To get it, use the **crypto-js** npm package and the following code:

``` ts
// Total of 44 characters (1 Bytes = 2 char) (standard states that: 43 chars <= //verifier <= 128 chars)
const NUM_OF_BYTES = 36

const codeVerifier = crypto.lib.WordArray.random(NUM_OF_BYTES).toString()
const codeVerifierHash = sha256(randomVerifier).toString(crypto.enc.Base64)
```

This parameter is used only when the authentication method is not specified (none) and the public client (PKCE) is allowed.

Example: 4Q2s0UnFr-azOwsUyUFRy9I_frVjzumIUKoEGCwHAYs

> Please note that the code verifier will be generated anew each time the preview dialog is reopened.

You can click the example button to go through the entire [authorization flow](../Authorization%20Flow/index.md).

![Authorization flow](/assets/images/docspace/authorization-flow.png)
