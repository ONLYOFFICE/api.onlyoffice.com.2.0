`POST /wopi/files/(file_id)`

Renames a file.

This operation works as follows:

1. The WOPI host checks if a file is currently locked or not.
2. If the file is currently **locked** and the **X-WOPI-Lock** value does not match the lock currently on the file, the host must return **409 Conflict** (*"lock mismatch"*) and include the **X-WOPI-Lock** response header containing the value of the current lock on the file.
3. If the file is **unlocked**, the host should respond with **200 OK** and proceed with the rename.
4. If the host cannot rename the file because the name requested is invalid or conflicts with the existing file, the host should try to generate a different name based on the requested name that meets the file name requirements.
5. If the host cannot generate a different name, it should return **400 Bad Request**. The response must include the **X-WOPI-InvalidFileNameError** header that describes why the file name was invalid.

## Parameters

| Name     | Type   | Description                        |
| -------- | ------ | ---------------------------------- |
| file\_id | string | The file ID that must be URL safe. |

## Query parameters

| Name          | Type   | Description                                                                            |
| ------------- | ------ | -------------------------------------------------------------------------------------- |
| access\_token | string | An access token that the host will use to determine whether the request is authorized. |

## Request headers

| Name                 | Type   | Presence | Description                                                          |
| -------------------- | ------ | -------- | -------------------------------------------------------------------- |
| X-WOPI-Override      | string | required | The requested operation from the WOPI server (*RENAME\_FILE*).       |
| X-WOPI-Lock          | string | optional | The lock ID that the host must use to identify the lock on the file. |
| X-WOPI-RequestedName | string | optional | A file name, not including the file extension (in the UTF-7 format). |

## Response headers

| Name                        | Type   | Presence | Description                                                                                                                                                                                                               |
| --------------------------- | ------ | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| X-WOPI-InvalidFileNameError | string | optional | The reason the rename operation could not be completed. This header should only be included when the response code is **400 Bad Request**. This value must only be used for logging purposes.                             |
| X-WOPI-Lock                 | string | optional | The lock ID identifying the current lock on the file. This header must always be included when responding to the request with **409 Conflict**. It should not be included when responding to the request with **200 OK**. |
| X-WOPI-LockFailureReason    | string | optional | The cause of the lock failure. This header may be included when responding to the request with **409 Conflict**. It must only be used for logging purposes.                                                               |

## Response body

| Name | Type   | Presence | Description                                             |
| ---- | ------ | -------- | ------------------------------------------------------- |
| Name | string | required | The renamed file name without a path or file extension. |
