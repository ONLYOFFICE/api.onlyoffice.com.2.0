Starting from version 5.2, it is possible to use the token in body parameters with ONLYOFFICE Docs. To enable it, set the [services.CoAuthoring.token.inbox.inBody](https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#services-CoAuthoring-token-inbox-inBody) and [services.CoAuthoring.token.outbox.inBody](https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#services-CoAuthoring-token-outbox-inBody) in configuration file to `true`.

## Parameters

| Parameter                                | Type    | Example | Description                                                        |
| ---------------------------------------- | ------- | ------- | ------------------------------------------------------------------ |
| services.CoAuthoring.token.inbox.inBody  | boolean | false   | Defines if a token is enabled in the incoming request body or not. |
| services.CoAuthoring.token.outbox.inBody | boolean | false   | Defines if a token is enabled in the outgoing request body or not. |

The `payload` for the JSON Web Token contains the request body parameters.

## Incoming request

### Request to receive the status of the edited document

Validation is performed for incoming requests with the commands from the **document storage service** to the [document command service](../../../Command%20service/index.md).

Sample parameters of request to receive the status of the edited document:

  ``` json
  {
    "c": "info",
    "key": "Khirz6zTPdfd7"
  }
  ```

These parameters must be encoded into the token so that the request looked like this:

Sample of request to receive the status of the edited document:

``` http
POST /command HTTP/1.1
Host: documentserver
Content-Type: application/json

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjIjoiaW5mbyIsImtleSI6IktoaXJ6NnpUUGRmZDcifQ.r_6sThjFABsHMNHhkVdHDSz4jwkbXRQNYdvawkBGJgg"
}
```

As you can see there is no need to include the above parameters into the request body, as all of them are already encoded into the token and sent within it.

### Request to convert the document

Validation is performed for incoming requests with the commands from the **document storage service** to the [document conversion service](../../../Conversion%20API/Request/index.md).

Sample parameters of request to convert the document:

  ``` json
  {
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "pdf",
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-document.docx"
  }
  ```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Sample of request to convert the document:

``` http
POST /converter HTTP/1.1
Host: documentserver
Content-Type: application/json

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxldHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3Iiwib3V0cHV0dHlwZSI6InBkZiIsInRpdGxlIjoiRXhhbXBsZSBEb2N1bWVudCBUaXRsZS5kb2N4IiwidXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.U-YAfuuy7clWjn-xOncfJ-sxVG5DlcYn0AOzJYkoR0M"
}
```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

### Request to document builder service

Validation is performed for incoming requests with the commands from the **document storage service** to the [document builder service](../../../../Get%20Started/How%20It%20Works/index.md).

Sample parameters of request to document builder service:

  ``` json
  {
    "async": true,
    "url": "https://example.com/url-to-example-script.docbuilder"
  }
  ```

Where the **example.com** is the name of the server where **document storage service** are installed. See the [How it works](../../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Sample of request to document builder service:

``` http
POST /docbuilder HTTP/1.1
Host: documentserver
Content-Type: application/json

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhc3luYyI6dHJ1ZSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1zY3JpcHQuZG9jYnVpbGRlciJ9.dzoTbRzSMa95Fpg34CjnF3ZUPdGA2CnBedFL_qOOxAs"
}
```

Where the **example.com** is the name of the server where **document storage service** are installed. See the [How it works](../../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

## Outgoing requests

### Request to "callbackUrl" address by document editing service when the last user closed the document for editing without changes

Validation is performed for outgoing requests to "[callbackUrl](../../../../Usage%20API/Config/Editor/index.md#callbackurl)" address by **document editing service**.

Sample parameters of request to "callbackUrl" address by document editing service when the last user closed the document for editing without changes:

  ``` json
  {
    "key": "Khirz6zTPdfd7",
    "status": 4
  }
  ```

Sample of request to "callbackUrl" address by document editing service when the last user closed the document for editing without changes:

``` http
POST /url-to-callback.ashx HTTP/1.1
Host: example.com
Content-Type: application/json

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJLaGlyejZ6VFBkZmQ3Iiwic3RhdHVzIjo0fQ.gCyNKPpg6ISAnhvFQmRiY6BRqG6WPcEGgnK79hREdkU"
}
```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

When performing the GET requests from ONLYOFFICE Docs an [authorization header](../Token%20in%20header/index.md) with the token is added.
