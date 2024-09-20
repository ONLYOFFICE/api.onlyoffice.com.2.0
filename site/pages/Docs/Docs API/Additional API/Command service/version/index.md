Requests the current version number of ONLYOFFICE Docs.

## Request example

``` json
{
  "c": "version"
}
```

## Parameters

| Name | Description               | Type   | Presence |
| ---- | ------------------------- | ------ | -------- |
| c    | Defines the command type. | string | required |

## Response example

``` json
{
  "error": 0,
  "version": "4.3.1.4"
}
```

## Parameters

| Parameter | Description                          | Type    | Presence |
| --------- | ------------------------------------ | ------- | -------- |
| error     | Defines an error code.               | integer | required |
| version   | Defines the document server version. | string  | required |
