Forcibly saves the document being edited without closing it. The document editing might be continued after this command, so this will not be the final saved document version.

## Request example

``` json
{
  "c": "forcesave",
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
  "key": "Khirz6zTPdfd7"
}
```

## Parameters

| Parameter | Type    | Presence | Description                                                                       |
| --------- | ------- | -------- | --------------------------------------------------------------------------------- |
| error     | integer | required | Defines an error code.                                                            |
| key       | string  | required | Defines the document identifier used to unambiguously identify the document file. |
