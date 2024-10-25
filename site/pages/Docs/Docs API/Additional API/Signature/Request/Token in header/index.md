When performing the HTTP requests from ONLYOFFICE Docs an authorization header with the *token* is added to validate the request. When performing the HTTP requests to ONLYOFFICE Docs an authorization header with the *token* must be added to validate the request.

The *payload* for the JSON Web Token contains the following fields:

- **payload** - the object containing the request body parameters in JSON format if not empty.

## Incoming request

### Request to receive the status of the edited document

Validation is performed for incoming requests with the commands from the **document storage service** to the [document command service](../../../Command%20service/index.md).

Sample payload of request to receive the status of the edited document:

  ``` json
  {
    "payload": {
      "c": "info",
      "key": "Khirz6zTPdfd7"
    }
  }
  ```

Sample of request to receive the status of the edited document:

``` http
POST /command HTTP/1.1
Host: documentserver
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImMiOiJpbmZvIiwia2V5IjoiS2hpcno2elRQZGZkNyJ9fQ.hGQ8kquQWpg4MQYiSYaIzik0wotP1coAop6QfLruenA

{
    "c": "info",
    "key": "Khirz6zTPdfd7"
}
```

### Request to convert the document

Validation is performed for incoming requests from the **document storage service** to the [document conversion service](../../../Conversion%20API/index.md).

Sample payload of request to convert the document:

  ``` json
  {
    "payload": {
      "filetype": "docx",
      "key": "Khirz6zTPdfd7",
      "outputtype": "pdf",
      "title": "Example Document Title.docx",
      "url": "https://example.com/url-to-example-document.docx"
    }
  }
  ```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Sample of request to convert the document:

``` http
POST /ConvertService.ashx HTTP/1.1
Host: documentserver
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImZpbGV0eXBlIjoiZG9jeCIsImtleSI6IktoaXJ6NnpUUGRmZDciLCJvdXRwdXR0eXBlIjoicGRmIiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50IFRpdGxlLmRvY3giLCJ1cmwiOiJodHRwOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQuZG9jeCJ9fQ.Ec50Gvafu4niR2I1LPgETn1jkvvs1wKm0YeeI1RbRQs

{
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "pdf",
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-document.docx"
}
```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

### Request to document builder service

Validation is performed for incoming requests from the **document storage service** to the [document builder service](../../../Document%20Builder%20API/index.md).

Sample payload of request to document builder service:

  ``` json
  {
    "payload": {
      "async": true,
      "url": "https://example.com/url-to-example-script.docbuilder"
    }
  }
  ```

Where the **example.com** is the name of the server where **document storage service** are installed. See the [How it works](../../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Sample of request to document builder service:

``` http
POST /docbuilder HTTP/1.1
Host: documentserver
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImFzeW5jIjp0cnVlLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXNjcmlwdC5kb2NidWlsZGVyIn19.JpHp_TB3XDacAhTTB4I0CE7SIESSE9aQUGDulbpYKTE

{
    "async": true,
    "url": "https://example.com/url-to-example-script.docbuilder"
}
```

Where the **example.com** is the name of the server where **document storage service** are installed. See the [How it works](../../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

## Outgoing requests

### Request to "callbackUrl" address by document editing service when the last user closed the document for editing without changes

Validation is performed for outgoing requests to "[callbackUrl](../../../../Usage%20API/Config/Editor/index.md#callbackurl)" address by **document editing service**.

Sample payload of request to "callbackUrl" address by document editing service when the last user closed the document for editing without changes:

  ``` json
  {
    "payload": {
      "key": "Khirz6zTPdfd7",
      "status": 4
    }
  }
  ```

Sample of request to "callbackUrl" address by document editing service when the last user closed the document for editing without changes:

``` http
POST /url-to-callback.ashx HTTP/1.1
Host: example.com
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImtleSI6IktoaXJ6NnpUUGRmZDciLCJzdGF0dXMiOjR9fQ.MfVoGT-aYuPJfjQAaxwBv7-CqBylDae2AF9K5TpLf-E

{
    "key": "Khirz6zTPdfd7",
    "status": 4
}
```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

### Request to document storage service for file download

Validation is performed for outgoing requests to **document storage service** for file download.

Sample payload of request to document storage service for file download:

  ``` json
  {
    "payload": {
      "url": "https://example.com/url-to-example-document.docx"
    }
  }
  ```

Sample of request to document storage service for file download:

``` http
GET /url-to-example-document.docx HTTP/1.1
Host: example.com
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7InVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQuZG9jeCJ9fQ.DnhdBVtn8sFo9Adfl6GuT_v53NVV5cQ0Vi9c8xRzrjs
```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

The token includes the payload (the full URL to the document, in the example above it is *{"url: "http\://example.com/url-to-example-document.docx"}*), which is also duplicated in the header as the **Host** (*example.com*) and the document address the GET request is sent to (*url-to-example-document.docx*).

### Request to document storage service for document changes data download

Validation is performed for outgoing requests to **document storage service** for document changes data download.

Sample payload of request to document storage service for document changes data download:

  ``` json
  {
    "payload": {
      "url": "https://example.com/url-to-document-changes.zip"
    }
  }
  ```

Sample of request to document storage service for document changes data download:

``` http
GET /url-to-changes.zip HTTP/1.1
Host: example.com
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7InVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWRvY3VtZW50LWNoYW5nZXMuemlwIn19.4CJ4F8x7VDMW72ss9VnIYGIwjRpBMYBBRXZ5aX2r2Y4
```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

The token includes the payload (the full URL to the document, in the example above it is `{"url: "http://example.com/url-to-document-changes.zip"}`), which is also duplicated in the header as the **Host** (*example.com*) and the document address the GET request is sent to (*url-to-document-changes.zip*).
