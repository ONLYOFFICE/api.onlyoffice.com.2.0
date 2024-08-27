`GET /wopi/files/(file_id)/contents`

Requests a message to retrieve a file for the `HTTP://server/<...>/wopi*/files/<id>/contents` operation.

The response body must contain the full file contents in the binary format.

## Parameters

| Name     | Type   | Description                        |
| -------- | ------ | ---------------------------------- |
| file\_id | string | The file ID that must be URL safe. |

## Query parameters

| Name          | Type   | Description                                                                            |
| ------------- | ------ | -------------------------------------------------------------------------------------- |
| access\_token | string | An access token that the host will use to determine whether the request is authorized. |

## Request headers

| Name                   | Type    | Presence | Description                                                                                                                                                                                                                                                        |
| ---------------------- | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| X-WOPI-MaxExpectedSize | integer | optional | The maximum expected size of the file being requested. The host should use the maximum value of a 4-byte integer if this value is not set in the request. If the file requested is larger than this value, the host must respond with **412 Precondition Failed**. |

## Response headers

| Name               | Type   | Presence | Description       |
| ------------------ | ------ | -------- | ----------------- |
| X-WOPI-ItemVersion | string | optional | The file version. |

## Response body

The response body must be the full binary contents of the file.
