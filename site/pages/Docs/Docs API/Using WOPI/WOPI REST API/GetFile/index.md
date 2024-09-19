**GET /wopi/files/*(file\_id)*/contents**

Retrieves a file from a host for the `HTTP://server/<...>/wopi*/files/<id>/contents` operation.

### Parameters

| Name     | Description                        | Type   |
| -------- | ---------------------------------- | ------ |
| file\_id | The file ID that must be URL safe. | string |

### Query parameters

| Name          | Description                                                                            | Type   |
| ------------- | -------------------------------------------------------------------------------------- | ------ |
| access\_token | An access token that the host uses to determine whether the request is authorized. | string |

### Request headers

| Name                   | Description                                                                                                                                                                                                                                                        | Type    | Presence |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------- | -------- |
| X-WOPI-MaxExpectedSize | The upper bound of the expected size of the file being requested. The host should use the maximum value of a 4-byte integer if this value isn't set in the request. If the file requested is larger than this value, the host must respond with a **412 Precondition Failed**. | integer | optional |

### Response headers

| Name               | Description       | Type   | Presence |
| ------------------ | ----------------- | ------ | -------- |
| X-WOPI-ItemVersion | The file version. | string | optional |

### Response body

The response body must be the full binary contents of the file.
