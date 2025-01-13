When performing the client-side browser requests to ONLYOFFICE Docs, a token must be added to the parameters to validate the data.

## Opening file

When a file is [opened](../../../Get%20Started/How%20It%20Works/Opening%20file/index.md) for editing in ONLYOFFICE Docs, the [token](../../../Usage%20API/Config/index.md#token) must be added to the configuration to validate the parameters.

The `payload` for the JWT token in the JSON format must have the same structure as the [config](../../../Usage%20API/Advanced%20parameters/index.md).

> Please note that starting from version 7.1, the parameter list to be signed will be strictly regulated. Don't forget to add all the parameters listed below to your signature.

``` json
{
  "document": {
    "key": "Khirz6zTPdfd7",
    "permissions": {
      "comment": true,
      "commentGroups": {
        "edit": ["Group2", ""],
        "remove": [""],
        "view": ""
      },
      "copy": true,
      "deleteCommentAuthorOnly": false,
      "download": true,
      "edit": true,
      "editCommentAuthorOnly": false,
      "fillForms": true,
      "modifyContentControl": true,
      "modifyFilter": true,
      "print": true,
      "review": true,
      "reviewGroups": ["Group1", "Group2", ""]
    },
    "url": "https://example.com/url-to-example-document.docx"
  },
  "editorConfig": {
    "callbackUrl": "https://example.com/url-to-callback.ashx",
    "mode": "edit",
    "user": {
      "group": "Group1",
      "id": "78e1e841",
      "name": "Smith"
    }
  }
}
```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Sample token:

``` json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicGVybWlzc2lvbnMiOnsiY29tbWVudCI6dHJ1ZSwiY29tbWVudEdyb3VwcyI6eyJlZGl0IjpbIkdyb3VwMiIsIiJdLCJyZW1vdmUiOlsiIl0sInZpZXciOiIifSwiY29weSI6dHJ1ZSwiZGVsZXRlQ29tbWVudEF1dGhvck9ubHkiOmZhbHNlLCJkb3dubG9hZCI6dHJ1ZSwiZWRpdCI6dHJ1ZSwiZWRpdENvbW1lbnRBdXRob3JPbmx5IjpmYWxzZSwiZmlsbEZvcm1zIjp0cnVlLCJtb2RpZnlDb250ZW50Q29udHJvbCI6dHJ1ZSwibW9kaWZ5RmlsdGVyIjp0cnVlLCJwcmludCI6dHJ1ZSwicmV2aWV3Ijp0cnVlLCJyZXZpZXdHcm91cHMiOlsiR3JvdXAxIiwiR3JvdXAyIiwiIl19LCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZWRpdG9yQ29uZmlnIjp7ImNhbGxiYWNrVXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tY2FsbGJhY2suYXNoeCIsIm1vZGUiOiJlZGl0IiwidXNlciI6eyJncm91cCI6Ikdyb3VwMSIsImlkIjoiNzhlMWU4NDEiLCJuYW1lIjoiU21pdGgifX19.irYst9vmsLoQtC-95A-6W8DnbqGXCbmcxJajfbPh6tQ"
}
```

## Methods

### insertImage

When calling the [insertImage](../../../Usage%20API/Methods/index.md#insertimage) method to insert an image into the file, the token must be added to validate the parameters.

The `payload` for the JWT token in the JSON format must have the same structure as the method parameter. The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:

  ``` json
  {
    "c": "add",
    "images": [
      {
        "fileType": "png",
        "url": "https://example.com/url-to-example-image.png"
      }
    ]
  }
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Sample token:

``` json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjIjoiYWRkIiwiaW1hZ2VzIjpbeyJmaWxlVHlwZSI6InBuZyIsInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtaW1hZ2UucG5nIn1dfQ._tPxpJrPbom_f83qgX4_AB9v1cfK2LSQsfomfl7zJ58"
}
```

### setHistoryData

When calling the [setHistoryData](../../../Usage%20API/Methods/index.md#sethistorydata) method to view the document [history](../../../Get%20Started/How%20It%20Works/Document%20history/index.md) version in ONLYOFFICE Docs, the token must be added to validate the parameters.

The `payload` for the JWT token in the JSON format must have the same structure as the method parameter. The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:

  ``` json
  {
    "changesUrl": "https://example.com/url-to-changes.zip",
    "key": "Khirz6zTPdfd7",
    "previous": {
      "key": "af86C7e71Ca8",
      "url": "https://example.com/url-to-the-previous-version-of-the-document.docx"
    },
    "url": "https://example.com/url-to-example-document.docx",
    "version": 2
  }
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Sample token:

``` json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGFuZ2VzVXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tY2hhbmdlcy56aXAiLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicHJldmlvdXMiOnsia2V5IjoiYWY4NkM3ZTcxQ2E4IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tdGhlLXByZXZpb3VzLXZlcnNpb24tb2YtdGhlLWRvY3VtZW50LmRvY3gifSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.7gaOe1_4OvgRLYD0oGk_bMrVdPaLmgZVNIgQCUQdgoE"
}
```

### setMailMergeRecipients

When calling the [setMailMergeRecipients](../../../Usage%20API/Methods/index.md#setmailmergerecipients) method to insert recipient data for mail merge into the file, the token must be added to validate the parameters.

The `payload` for the JWT token in the JSON format must have the same structure as the method parameter. The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:

  ``` json
  {
    "fileType": "xlsx",
    "url": "https://example.com/url-to-example-recipients.xlsx"
  }
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Sample token:

``` json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXJlY2lwaWVudHMueGxzeCJ9.P3TjOyX1Tv3xAVRAc8qtNb-uFLD6FH_WErag_rbI6nQ"
}
```

### setReferenceData

When calling the [setReferenceData](../../../Usage%20API/Methods/index.md#setreferencedata) method to insert data into the spreadsheet by an external link, the token must be added to validate the parameters.

The `payload` for the JWT token in the JSON format must have the same structure as the method parameter. The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:

  ``` json
  {
    "fileType": "xlsx",
    "key": "Khirz6zTPdfd7",
    "path": "sample.xlsx",
    "referenceData": {
      "fileKey": "BCFA2CED",
      "instanceId": "https://example.com"
    },
    "url": "https://example.com/url-to-example-document.xlsx"
  }
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Sample token:

``` json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicGF0aCI6InNhbXBsZS54bHN4IiwicmVmZXJlbmNlRGF0YSI6eyJmaWxlS2V5IjoiQkNGQTJDRUQiLCJpbnN0YW5jZUlkIjoiaHR0cHM6Ly9leGFtcGxlLmNvbSJ9LCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50Lnhsc3gifQ.US2wsI__77B0ApzMOIUGIU49cUAORvdzGZ4V49BO4Dc"
}
```

### setReferenceSource

When calling the [setReferenceSource](../../../Usage%20API/Methods/index.md#setreferencesource) method to change a source of the external data, the token must be added to validate the parameters.

The `payload` for the JWT token in the JSON format must have the same structure as the method parameter. The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:

  ``` json
  {
    "fileType": "xlsx",
    "key": "Khirz6zTPdfd7",
    "path": "sample.xlsx",
    "referenceData": {
      "fileKey": "BCFA2CED",
      "instanceId": "https://example.com"
    },
    "url": "https://example.com/url-to-example-document.xlsx"
  }
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Sample token:

``` json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicGF0aCI6InNhbXBsZS54bHN4IiwicmVmZXJlbmNlRGF0YSI6eyJmaWxlS2V5IjoiQkNGQTJDRUQiLCJpbnN0YW5jZUlkIjoiaHR0cHM6Ly9leGFtcGxlLmNvbSJ9LCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50Lnhsc3gifQ.US2wsI__77B0ApzMOIUGIU49cUAORvdzGZ4V49BO4Dc"
}
```

### setRequestedDocument

When calling the [setRequestedDocument](../../../Usage%20API/Methods/index.md#setrequesteddocument) method to select a document for comparing or combining, the token must be added to validate the parameters.

The `payload` for the JWT token in the JSON format must have the same structure as the method parameter. The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:

  ``` json
  {
    "c": "compare",
    "fileType": "docx",
    "url": "https://example.com/url-to-example-document.docx"
  }
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Sample token:

``` json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8"
}
```

### setRequestedSpreadsheet

When calling the [setRequestedSpreadsheet](../../../Usage%20API/Methods/index.md#setrequestedspreadsheet) method to insert recipient data for mail merge into the file, the token must be added to validate the parameters.

The `payload` for the JWT token in the JSON format must have the same structure as the method parameter. The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:

  ``` json
  {
    "c": "mailmerge",
    "fileType": "xlsx",
    "url": "https://example.com/url-to-example-recipients.xlsx"
  }
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Sample token:

``` json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXJlY2lwaWVudHMueGxzeCJ9.P3TjOyX1Tv3xAVRAc8qtNb-uFLD6FH_WErag_rbI6nQ"
}
```

### setRevisedFile

When calling the [setRevisedFile](../../../Usage%20API/Methods/index.md#setrevisedfile) method to select a document for comparing, the token must be added to validate the parameters.

The `payload` for the JWT token in the JSON format must have the same structure as the method parameter. The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:

  ``` json
  {
    "fileType": "docx",
    "url": "https://example.com/url-to-example-document.docx"
  }
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Sample token:

``` json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8"
}
```
