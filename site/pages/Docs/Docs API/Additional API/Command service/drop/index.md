Disconnects the users with the identifiers specified in the *users* parameter from the **document editing service**. These users will be able to view the document, but will not be allowed to make changes to it.

## Request example

``` json
{
  "c": "drop",
  "key": "Khirz6zTPdfd7",
  "users": ["6d5a81d0"]
}
```

## Parameters

| Parameter | Type             | Presence | Description                                                                       |
| --------- | ---------------- | -------- | --------------------------------------------------------------------------------- |
| c         | string           | required | Defines the command type.                                                         |
| key       | string           | required | Defines the document identifier used to unambiguously identify the document file. |
| users     | array of strings | required | Defines the list of the user identifiers.                                         |

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
