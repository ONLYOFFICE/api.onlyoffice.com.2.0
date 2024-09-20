`GET /wopi/files/(file_id)/contents`

Requests a message to retrieve a file for the `HTTP://server/<...>/wopi*/files/<id>/contents` operation.

The response body must contain the full file contents in the binary format.

## Parameters

| Name     | Description                        | Type   |
| -------- | ---------------------------------- | ------ |
| file\_id | The file ID that must be URL safe. | string |

## Query parameters

| Name          | Description                                                                            | Type   |
| ------------- | -------------------------------------------------------------------------------------- | ------ |
| access\_token | An access token that the host will use to determine whether the request is authorized. | string |

## Request headers

| Name                   | Description                                                                                                                                                                                                                                                        | Type    | Presence |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------- | -------- |
| X-WOPI-MaxExpectedSize | The maximum expected size of the file being requested. The host should use the maximum value of a 4-byte integer if this value is not set in the request. If the file requested is larger than this value, the host must respond with **412 Precondition Failed**. | integer | optional |

## Response headers

| Name               | Description       | Type   | Presence |
| ------------------ | ----------------- | ------ | -------- |
| X-WOPI-ItemVersion | The file version. | string | optional |

## Response body

The response body must be the full binary contents of the file.
