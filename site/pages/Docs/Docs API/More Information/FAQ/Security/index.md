---
order: -11
---

## How to limit access to my Document Server?

To prevent an unauthorized access to your documents and the substitution of important parameters in ONLYOFFICE Docs requests, it uses a JSON Web Token (JWT) compatible tokens to ensure security. The tokens are signed by the server key, so the client is able to verify that the token is legitimate.

The **token** is added in the configuration when initializing ONLYOFFICE Docs and during the exchange of commands between **document storage service** and **document editing service**, **document command service** and **document conversion service**.

ONLYOFFICE Docs validates the token. If it is valid, the data from the *payload* is used instead of the corresponding data from the main parameters. If the token is invalid, the command is not executed and no parameters are used or changed.

The token can be sent both in the request [header](../../../Additional%20API/Signature/Request/Token%20in%20header/index.md) or [body](../../../Additional%20API/Signature/Request/Token%20in%20body/index.md).

## What's the difference between sending the token in header and in body?

Starting with version 5.2 of ONLYOFFICE Docs it is possible to send token both in the request header and body. The main difference between these two methods is in the length limitation: a HTTP header has length limitation and some servers (such as some NGINX versions) do not accept the requests with the header longer than 4 kilobytes, while other servers restrict the header length to 8–48 kilobytes. In case the header length exceeds these values, the server will return the *413 Entity Too Large* error.

To avoid this limitation, sending the token in the request body should be the preferred method of doing this. Starting from version 7.1, the incoming requests use the token in body if it exists. Otherwise, the header token is taken. The outgoing requests use both the token in body and token in header. They can be different. For example, the information about version history can be removed from the header token because of the size limit of the token in header.

See the [Request with token in header](../../../Additional%20API/Signature/Request/Token%20in%20header/index.md) or [Request with token in body](../../../Additional%20API/Signature/Request/Token%20in%20body/index.md) sections for more details on this.
