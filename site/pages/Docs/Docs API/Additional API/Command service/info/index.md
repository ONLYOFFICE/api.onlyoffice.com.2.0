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

| Parameter | Type   | Presence | Description                                                                                                       |
| --------- | ------ | -------- | ----------------------------------------------------------------------------------------------------------------- |
| c         | string | required | Defines the command type.                                                                                         |
| key       | string | required | Defines the document identifier used to unambiguously identify the document file.                                 |
| userdata  | string | optional | Defines some custom identifier which will help distinguish the specific request in case there were more than one. |

## Response example

``` json
{
  "error": 0,
  "key": "Khirz6zTPdfd7",
  "users": ["6d5a81d0", "78e1e841"]
}
```

## Parameters

| Parameter | Type             | Presence | Description                                                                                                                                                                                                                                                                                                                                                                           |
| --------- | ---------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| error     | integer          | required | Defines an error code.                                                                                                                                                                                                                                                                                                                                                                |
| key       | string           | required | Defines the document identifier used to unambiguously identify the document file.                                                                                                                                                                                                                                                                                                     |
| users     | array of strings | required | Defines the list of the identifiers of the users who opened the document for editing. When the document has been changed, the *users* will return the identifier of the user who was the last to edit the document (for [status 2](../../../Usage%20API/Callback%20handler/index.md#status-2-3) and [status 6](../../../Usage%20API/Callback%20handler/index.md#status-6-7) replies). |
