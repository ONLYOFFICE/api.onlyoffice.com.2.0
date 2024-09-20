Requests a document status and the list of the identifiers of the users who opened the document for editing. The response will be sent to the [callback handler](../../../Usage%20API/Callback%20handler/index.md).

## Request example

``` json
{
  "c": "info",
  "key": "Khirz6zTPdfd7",
  "userdata": "sample userdata"
}
```

## Parameters

| Parameter | Description                                                                                                       | Type   | Presence |
| --------- | ----------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| c         | Defines the command type.                                                                                         | string | required |
| key       | Defines the document identifier used to unambiguously identify the document file.                                 | string | required |
| userdata  | Defines some custom identifier which will help distinguish the specific request in case there were more than one. | string | optional |

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
