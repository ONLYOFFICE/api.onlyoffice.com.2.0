Deletes a forgotten file.

## Request example

``` json
{
  "c": "deleteForgotten",
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
  "key": "Khirz6zTPdfd7"
}
```

## Parameters

| Parameter | Type    | Presence | Description                                                                       |
| --------- | ------- | -------- | --------------------------------------------------------------------------------- |
| error     | integer | required | Defines an error code.                                                            |
| key       | string  | required | Defines the document identifier used to unambiguously identify the document file. |
