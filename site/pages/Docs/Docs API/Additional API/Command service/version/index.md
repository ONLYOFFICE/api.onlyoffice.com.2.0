Requests the current version number of ONLYOFFICE Docs.

## Request example

``` json
{
  "c": "version"
}
```

## Parameters

| Name | Type   | Presence | Description               |
| ---- | ------ | -------- | ------------------------- |
| c    | string | required | Defines the command type. |

## Response example

``` json
{
  "error": 0,
  "version": "4.3.1.4"
}
```

## Parameters

| Parameter | Type    | Presence | Description                          |
| --------- | ------- | -------- | ------------------------------------ |
| error     | integer | required | Defines an error code.               |
| version   | string  | required | Defines the document server version. |
