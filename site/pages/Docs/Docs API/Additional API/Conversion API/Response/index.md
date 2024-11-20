---
order: -3
---

The request result is returned in XML format. To receive a response in JSON format you need to specify the *Accept* header with the **application/json** value in the HTTP request (available from version 4.3). When forming the link to the resulting file, the same server name is used which was made the conversion request to.

- [endConvert](#endconvert)
- [error](#error)
- [fileType](#filetype)
- [fileUrl](#fileurl)
- [percent](#percent)

## Response parameters and their description

### endConvert

Defines if the conversion is completed or not.

Type: boolean

Example: true

### error

Defines an error occurred during the conversion. Possible error codes can be found [here](../Error%20codes/index.md).

Type: integer

Example: -3

### fileType

Defines an extension of the converted file.

Type: string

Example: "docm"

### fileUrl

Defines the link to the converted document. This parameter will be received only when the *endConvert* parameter is set to **true**.

Type: string

Example: `https://documentserver/url-to-converted-document.pdf`

### percent

Defines the percentage of the file conversion. If the *endConvert* parameter is set to **true**, the *percent* is equal to **100**.

Type: integer

Example: 100 

## Examples of responses

### Sample of the response in XML format

When forming the link to the resulting file, the same server name is used which was made the conversion request to.

``` xml
<?xml version="1.0" encoding="utf-8"?>
<FileResult>
    <EndConvert>True</EndConvert>
    <FileType>docm</FileType>
    <FileUrl>https://documentserver/url-to-converted-document.pdf</FileUrl>
    <Percent>100</Percent>
</FileResult>
```

### Sample of the response in JSON format

When forming the link to the resulting file, the same server name is used which was made the conversion request to.

``` json
{
  "endConvert": true,
  "fileType": "docm",
  "fileUrl": "https://documentserver/url-to-converted-document.pdf",
  "percent": 100
}
```

### Sample of the intermediate response to the asynchronous request (with the parameter *async=true*) in XML format

```xml
<?xml version="1.0" encoding="utf-8"?>
<FileResult>
    <EndConvert>False</EndConvert>
    <FileType></FileType>
    <FileUrl></FileUrl>
    <Percent>95</Percent>
</FileResult>
```

### Sample of the intermediate response to the asynchronous request (with the parameter *async=true*) in JSON format

```json
{
  "endConvert": false,
  "percent": 95
}
```

### Sample of the response when an error occurred in XML format

```xml
<?xml version="1.0" encoding="utf-8"?>
<FileResult>
    <Error>-3</Error>
</FileResult>
```

### Sample of the response when an error occurred in JSON format

``` json
{
  "error": -3
}
```
