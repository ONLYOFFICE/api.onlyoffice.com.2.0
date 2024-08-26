Updates the meta information of the document for all collaborative editors.

## Request example

``` json
{
  "c": "meta",
  "key": "Khirz6zTPdfd7",
  "meta": {
    "title": "Example Document Title.docx"
  }
}
```

## Parameters

| Parameter | Description                                                                                                                                   | Type   | Presence |
| --------- | --------------------------------------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| c         | Defines the command type.                                                                                                                     | string | required |
| key       | Defines the document identifier used to unambiguously identify the document file.                                                             | string | required |
| meta      | Defines the new meta information of the document:<br/><br/>**title** - the new document name.</br>**type**: string</br>**presence**: required | object | required |

## Response example

``` json
{
  "error": 0,
  "key": "Khirz6zTPdfd7"
}
```

## Parameters

| Parameter | Description                                                                       | Type    | Presence |
| --------- | --------------------------------------------------------------------------------- | ------- | -------- |
| error     | Defines an error code.                                                            | integer | required |
| key       | Defines the document identifier used to unambiguously identify the document file. | string  | required |
