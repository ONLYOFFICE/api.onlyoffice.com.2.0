Description

Requests a list of the forgotten files.

Request example

```
{
    "c": "getForgottenList"
}
```

Parameters

| Parameter | Description               | Type   | Presence |
| --------- | ------------------------- | ------ | -------- |
| c         | Defines the command type. | string | required |

Response example

```
{
    "error": 0,
    "keys": ["Khirz6zTPdfd7"]
}
```

Parameters

| Parameter | Description                                                                                   | Type    | Presence |
| --------- | --------------------------------------------------------------------------------------------- | ------- | -------- |
| error     | Defines an error code.                                                                        | integer | required |
| keys      | Defines a list of the document identifiers used to unambiguously identify the document files. | string  | required |
