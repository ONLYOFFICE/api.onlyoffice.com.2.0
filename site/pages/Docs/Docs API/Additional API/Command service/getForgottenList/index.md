Requests a list of the forgotten files.

## Request example

``` json
{
  "c": "getForgottenList"
}
```

## Parameters

| Parameter | Type   | Presence | Description               |
| --------- | ------ | -------- | ------------------------- |
| c         | string | required | Defines the command type. |

## Response example

``` json
{
  "error": 0,
  "keys": ["Khirz6zTPdfd7"]
}
```

## Parameters

| Parameter | Type    | Presence | Description                                                                                   |
| --------- | ------- | -------- | --------------------------------------------------------------------------------------------- |
| error     | integer | required | Defines an error code.                                                                        |
| keys      | string  | required | Defines a list of the document identifiers used to unambiguously identify the document files. |
