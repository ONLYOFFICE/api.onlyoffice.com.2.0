When performing the HTTP requests from or to ONLYOFFICE Docs, the token is added to the parameters to validate the data. The token can be sent:

- [in body](Token%20in%20body/index.md);
- [in header](Token%20in%20header/index.md).

Starting from version 5.2, it is possible to use the token in body parameters with ONLYOFFICE Docs. To enable it, set the [services.CoAuthoring.token.inbox.inBody](https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#services-CoAuthoring-token-inbox-inBody) and [services.CoAuthoring.token.outbox.inBody](https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#services-CoAuthoring-token-outbox-inBody) in configuration file to `true`.

Starting from version 7.1, the incoming requests use the token in body if it exists. Otherwise, the header token is taken. To specify what is used next to validate the data, [services.CoAuthoring.server.tokenRequiredParams](https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#services-CoAuthoring-server-tokenRequiredParams) must be added to the `local.json` configuration file. If it is `true`, only the token data is used. Otherwise, the opened request part is merged with the token data.

The outgoing requests use both the token in body and token in header. They can be different. For example, the information about version history can be removed from the header token because of the size limit of the token in header.

> [Token in body](Token%20in%20body/index.md) is used for POST requests only. For the GET requests, [token in header](Token%20in%20header/index.md) is used.
