The [OAuth 2.0](https://datatracker.ietf.org/doc/html/rfc6749) authorization protocol enables a third-party application to obtain limited access to an HTTP service. You can add OAuth applications to the DocSpace portal and use them to access the API for authorization and further actions such as accessing accounts, rooms, files, etc.

**DocSpace OAuth API** allows developers to register a new OAuth application on the portal. 

This documentation describes:

- How to [create a new OAuth application](../../Usage%20API/Creating%20OAuth%20App/index.md)
- How to [edit the application](../../Usage%20API/Editing%20OAuth%20App/index.md)
- How to preview the [authorization button](../../Usage%20API/Auth%20Button/index.md) and embed it into your website
- How to [generate a developer token](../../Usage%20API/Developer%20Token/index.md)
- How the [authorization flow](../../Usage%20API/Authorization%20Flow/index.md) looks like
- How to [view active authorizations](../../Usage%20API/Viewing%20Active%20Authorizations/index.md)

## What OAuth apps can do

An OAuth application can:

- authorize users through the DocSpace portal without storing or processing passwords;
- access user account information (such as name) to verify their identity without having access to the password;
- use an access token to retrieve user information (before the token expires);
- perform only those actions on the data that are allowed by the authorized user.
