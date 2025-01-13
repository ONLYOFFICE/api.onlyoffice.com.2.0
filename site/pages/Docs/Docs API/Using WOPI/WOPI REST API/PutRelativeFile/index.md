`POST /wopi/files/(file_id)`

Creates a new file on the host based on the current file.

This operation works as follows:

1. The WOPI host checks if a file is currently locked or not.

2. If the file is currently **locked** and the **X-WOPI-Lock** value does not match the lock currently on the file, the host must return **409 Conflict** (*"lock mismatch"*) and include the **X-WOPI-Lock** response header containing the value of the current lock on the file. In the case where the file is unlocked, the host must set **X-WOPI-Lock** to the empty string.

3. If the file is **unlocked**, the host takes the file name from the **X-WOPI-SuggestedTarget** header and modifies it in order to make the request succeed:

   - If the header contains only a file extension (starts with a period), then the resulting file name will consist of this extension and the initial file name without extension.
   - If the header contains a full file name, then it will be a name for the resulting file.

4. Finally, the host creates a new file that has a legal name and does not overwrite any existing files, while preserving the file extension.

## Parameters

| Name     | Type   | Description                                                                 |
| -------- | ------ | --------------------------------------------------------------------------- |
| file\_id | string | The [file ID](../../Key%20concepts/index.md#file-id) that must be URL safe. |

## Query parameters

| Name          | Type   | Description                                                                                                                          |
| ------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------ |
| access\_token | string | An [access token](../../Key%20concepts/index.md#access-token) that the host will use to determine whether the request is authorized. |

## Request headers

| Name                   | Type    | Presence | Description                                                                                                                           |
| ---------------------- | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| X-WOPI-Override        | string  | required | The requested operation from the WOPI server (*PUT\_RELATIVE*).                                                                       |
| X-WOPI-SuggestedTarget | string  | required | A file extension or a full file name, including the file extension in the format of the UTF-7 encoded string.                         |
| X-WOPI-Size            | integer | optional | The size of the file in bytes.                                                                                                        |
| X-WOPI-FileConversion  | boolean | optional | Indicates that the request is being made in the context of [binary document conversion](../../Editing%20binary%20documents/index.md). |

## Request body

The request body must contain the full file contents in the binary format.

## Response headers

| Name                     | Type   | Presence | Description                                                                                                                                                                                                               |
| ------------------------ | ------ | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| X-WOPI-Lock              | string | optional | The lock ID identifying the current lock on the file. This header must always be included when responding to the request with **409 Conflict**. It should not be included when responding to the request with **200 OK**. |
| X-WOPI-LockFailureReason | string | optional | The cause of the lock failure. This header may be included when responding to the request with **409 Conflict**. It must only be used for logging purposes.                                                               |

## Response body

| Name        | Type   | Presence | Description                                                                                                                       |
| ----------- | ------ | -------- | --------------------------------------------------------------------------------------------------------------------------------- |
| Name        | string | required | The file name, including extension, without a path.                                                                               |
| Url         | string | required | URI of the form *http\://server/<...>/wopi/files/(file\_id)?access\_token=(access token)*, of the newly created file on the host. |
| HostViewUrl | string | optional | URI to a host page that loads the [view](../../WOPI%20discovery/index.md#wopi-actions) WOPI action for the newly created file.    |
| HostEditUrl | string | optional | URI to a host page that loads [edit](../../WOPI%20discovery/index.md#wopi-actions) action for the newly created file.             |

## Save Copy As

Starting from version 8.1, the *Save Copy As* functionality is added to the WOPI protocol through the *PutRelativeFile* operation. In the ONLYOFFICE Docs API, this action is implemented as the [onRequestSaveAs](../../../Usage%20API/Config/Events/index.md#onrequestsaveas) event.

When the *PutRelativeFile* operation is executed to save a copy of the current file, the *X-WOPI-FileConversion* header is not sent in the request.

To restrict the *Save Copy As* functionality, set the [UserCanNotWriteRelative](../CheckFileInfo/index.md#usercannotwriterelative) property in *CheckFileInfo* to *true*.
