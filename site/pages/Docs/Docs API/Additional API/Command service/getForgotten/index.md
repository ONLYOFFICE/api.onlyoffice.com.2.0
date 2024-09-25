Requests a forgotten file.

## Request example

``` json
{
  "c": "getForgotten",
  "key": "Khirz6zTPdfd7"
}
```

## Parameters

| Parameter | Type   | Presence | Description                                                                       |
| --------- | ------ | -------- | --------------------------------------------------------------------------------- |
| c         | string | required | Defines the command type.                                                         |
| key       | string | required | Defines the document identifier used to unambiguously identify the document file. |

## Response example

``` json
{
  "error": 0,
  "key": "Khirz6zTPdfd7",
  "url": "https://documentserver/url-to-forgotten-document.docx"
}
```

## Parameters

| Parameter | Type    | Presence | Description                                                                       |
| --------- | ------- | -------- | --------------------------------------------------------------------------------- |
| error     | integer | required | Defines an error code.                                                            |
| key       | string  | required | Defines the document identifier used to unambiguously identify the document file. |
| url       | string  | required | Defines the URL to a forgotten file.                                              |
