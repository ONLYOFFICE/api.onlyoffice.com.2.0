**POST /wopi/files/*(file\_id)*/contents**

Updates a file’s binary contents for the `HTTP://server/<...>/wopi*/files/<id>/contents` operation.

This operation works as follows:

1. The WOPI host checks if a file is currently locked or not.
2. If the file is currently **locked** and the **X-WOPI-Lock** value does not match the lock currently on the file, the host must return **409 Conflict** (*"lock mismatch"*) and include the **X-WOPI-Lock** response header containing the value of the current lock on the file. In the case where the file is unlocked, the host must set **X-WOPI-Lock** to the empty string.
3. If the file is **unlocked**, the host must check the current size of the file. If it is 0 bytes, the **PutFile** request should be considered valid and should proceed. If it is any value other than 0 bytes, or is missing altogether, the host should respond with **409 Conflict**.
4. In the case where the file is locked by a third-party client, hosts should still always include the current lock ID in the **X-WOPI-Lock** response header.

### Parameters

| Name     | Description                        | Type   |
| -------- | ---------------------------------- | ------ |
| file\_id | The file ID that must be URL safe. | string |

### Query parameters

| Name          | Description                                                                            | Type   |
| ------------- | -------------------------------------------------------------------------------------- | ------ |
| access\_token | An access token that the host will use to determine whether the request is authorized. | string |

### Request headers

| Name                         | Description                                                                                                                                                             | Type   | Presence |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| X-WOPI-Override              | The requested operation from the WOPI server (*PUT*).                                                                                                                   | string | required |
| X-WOPI-Lock                  | The lock ID that the host must use to identify the lock on the file.                                                                                                    | string | optional |
| X-WOPI-Editors               | All the users who contributed changes to the document in this **PutFile** request ([UserId](../CheckFileInfo/index.md#userid) values delimited by commas).    | string | optional |
| X-LOOL-WOPI-IsModifiedByUser | Indicates whether the user has modified the document before the save (**"true"**), or if they just pressed the **Save** button without any modification (**"false"**).  | string | optional |
| X-LOOL-WOPI-IsAutosave       | Indicates whether the **PutFile** is triggered by autosave (**"true"**) or by explicit user operation (**Save** button or menu entry) (**"false"**).                    | string | optional |
| X-LOOL-WOPI-IsExitSave       | Indicates whether an automatic save will be triggered when the document gets cleaned up from memory (e.g. when all users disconnect) (**"true"**) or not (**"false"**). | string | optional |

### Request body

The request body must be the full binary contents of the file.

### Response headers

| Name                     | Description                                                                                                                                                                                                               | Type   | Presence |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| X-WOPI-Lock              | The lock ID identifying the current lock on the file. This header must always be included when responding to the request with **409 Conflict**. It should not be included when responding to the request with **200 OK**. | string | optional |
| X-WOPI-LockFailureReason | The cause of the lock failure. This header may be included when responding to the request with **409 Conflict**. It must only be used for logging purposes.                                                               | string | optional |
| X-WOPI-ItemVersion       | The file version.                                                                                                                                                                                                         | string | optional |
