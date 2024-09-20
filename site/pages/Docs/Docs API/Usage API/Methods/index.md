---
order: -3
---

After initializing **document editor** you will get the object that can be used to call the methods.

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", config)
```

- [createConnector](#createconnector) - create the connector to interact with text documents, spreadsheets, presentations, and fillable forms from the outside.
- [denyEditingRights](#denyeditingrights) - deny editing.
- [destroyEditor](#destroyeditor) - destroy *docEditor* object.
- [downloadAs](#downloadas) - download the edited file.
- [insertImage](#insertimage) - insert an image into the file.
- [refreshHistory](#refreshhistory) - show the document version history.
- [requestClose](#requestclose) - request to close the editor.
- [setActionLink](#setactionlink) - set the link to the document which contains a bookmark.
- [setFavorite](#setfavorite) - change the *Favorite* icon state.
- [setHistoryData](#sethistorydata) - send the link to the document for viewing the version history.
- [setMailMergeRecipients](#setmailmergerecipients) - insert recipient data for mail merge into the file.
- [setReferenceData](#setreferencedata) - refresh data by a link to a file.
- [setReferenceSource](#setreferencesource) - change a source of the external data.
- [setRequestedDocument](#setrequesteddocument) - select a document for comparing or combining.
- [setRequestedSpreadsheet](#setrequestedspreadsheet) - insert recipient data for mail merge into the file.
- [setRevisedFile](#setrevisedfile) - select a document for comparing.
- [setSharingSettings](#setsharingsettings) - update the *information* about the settings which allow to share the document with other users.
- [setUsers](#setusers) - set a list of users to mention in the comments, grant the access rights to edit the specific sheet ranges, or set the user avatars.
- [showMessage](#showmessage) - display tooltip with the message.
- [startFilling](#startfilling) - start filling out the ready forms and lock the pdf editing.

## createConnector

Create the [connector](../Automation%20API/index.md) to interact with text documents, spreadsheets, presentations, and fillable forms from the outside.

> This parameter is available for editing only for ONLYOFFICE Developer Edition.

  ``` ts
  docEditor.createConnector()
  ```

## denyEditingRights

Deny editing. This method can be called when you want to make the document editing unavailable.

  ``` ts
  docEditor.denyEditingRights(message)
  ```

| Parameter | Description                           | Type   | Presence |
| --------- | ------------------------------------- | ------ | -------- |
| message   | Defines the text messages for dialog. | string | optional |

## destroyEditor

Destroy *docEditor* object. This method can be called when you want to reinit document editor with another configurations. Used since version 4.3.

  ``` ts
  docEditor.destroyEditor()
  ```

## downloadAs

Download the edited file. This method can be called only when the existence of the [onDownloadAs](../Config/Events/index.md#ondownloadas) events. **Document editing service** asynchronously creates a document and triggers the **onDownloadAs** event with a link in parameter.

  ``` ts
  docEditor.downloadAs(format)
  ```

| Parameter | Description                                                                                                                                                                                                                                                                                                                                                                                | Type   | Presence |
| --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------ | -------- |
| format    | Defines the format in which a file will be downloaded. All the possible formats you can find in the [conversion tables](../../Additional%20API/Conversion%20API/index.md#text-matrix). But you cannot download a file in the image formats such as *bmp*, *gif*, *jpg*, *png*. If this parameter is undefined, the file will be downloaded in the OOXML format according to the file type. | string | optional |

> Please note that conversion from the *djvu*, *pdf*, *xps* formats are not available. The original format will be downloaded.

## insertImage

Insert an image into the file. Starting from version 7.0, this method allows a user to insert several images. The *images* array is used to do it. This method must be called after the [onRequestInsertImage](../Config/Events/index.md#onrequestinsertimage) events.

  ``` ts
  docEditor.insertImage({
    c: "add",
    images: [
      {
        fileType: "png",
        url: "https://example.com/url-to-example-image1.png",
      },
      {
        fileType: "png",
        url: "https://example.com/url-to-example-image2.png",
      },
    ],
    token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjIjoiYWRkIiwiaW1hZ2VzIjpbeyJmaWxlVHlwZSI6InBuZyIsInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtaW1hZ2UxLnBuZyJ9LHsiZmlsZVR5cGUiOiJwbmciLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWltYWdlMi5wbmcifV19.JfSa__qPeY3MjUgdkJDjdfJWBgvCmEdLfFzjd3WgeUA",
  })
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

| Parameter       | Description                                                                                                                                                                                                                                                                     | Type             | Presence |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------- | -------- |
| c               | Defines a type of image insertion from the event. Can be: *add*, *change*, *fill*, *watermark*, *slide*. The default value is "*add*".                                                                                                                                          | string           | required |
| fileType        | Defines a type of the image to be inserted into the file. Can be: *bmp*, *gif*, *jpe*, *jpeg*, *jpg*, *png*. Deprecated since version 7.0, please use the *images.fileType* parameter instead.                                                                                  | string           | required |
| images          | Defines an array of images to be inserted.                                                                                                                                                                                                                                      | array of objects | required |
| images.fileType | Defines a type of the image to be inserted into the file. Can be: *bmp*, *gif*, *jpe*, *jpeg*, *jpg*, *png*.                                                                                                                                                                    | string           | required |
| images.url      | Defines an absolute URL where the source image is stored. Be sure to add a [token](../../Get%20Started/How%20It%20Works/Security/index.md) when using local links.                                                                                                              | string           | required |
| token           | Defines the encrypted signature added to the parameter in the form of a [token](../../Additional%20API/Signature/Browser/index.md#insertimage).                                                                                                                                 | string           | optional |
| url             | Defines an absolute URL where the source image is stored. Be sure to add a [token](../../Get%20Started/How%20It%20Works/Security/index.md) when using local links. Otherwise, an error will occur. Deprecated since version 7.0, please use the *images.url* parameter instead. | string           | required |

  > Prior to version 7.0, this method allowed to insert only one image and had the following parameters:
  >
  > ``` ts
  > docEditor.insertImage({
  >   c: "add",
  >   fileType: "png",
  >   url: "https://example.com/url-to-example-image.png",
  > })
  >```
  >
  > Please note that this structure is deprecated and will not be supported by the next editors versions. Please use a new one.

## refreshHistory

Show the document version history. This method must be called after the [onRequestHistory](../Config/Events/index.md#onrequesthistory) events.

  ``` ts
  docEditor.refreshHistory({
    currentVersion: 2,
    history: [
      {
        created: "2010-07-06 10:13 AM",
        key: "af86C7e71Ca8",
        user: {
          id: "F89d8069ba2b",
          name: "Kate Cage",
        },
        version: 1,
      },
      {
        created: "2010-07-07 3:46 PM",
        key: "Khirz6zTPdfd7",
        user: {
          id: "78e1e841",
          name: "John Smith",
        },
        version: 2,
      },
    ],
  })
  ```

If after editing and saving the document the *history* with the object changes and server version is returned, send the object changes in the *changes* parameter and the server version in the *serverVersion* parameter.

  ``` ts
  docEditor.refreshHistory({
    currentVersion: 2,
    history: [
      {
        created: "2010-07-06 10:13 AM",
        key: "af86C7e71Ca8",
        user: {
          id: "F89d8069ba2b",
          name: "Kate Cage",
        },
        version: 1,
      },
      {
        changes,
        created: "2010-07-07 3:46 PM",
        key: "Khirz6zTPdfd7",
        serverVersion,
        user: {
          id: "78e1e841",
          name: "John Smith",
        },
        version: 2,
      },
    ],
  })
  ```

Where **changes** is the *changes* from [the history object](../Callback%20handler/index.md#history) returned after saving the document.

Where **serverVersion** is the *serverVersion* from [the history object](../Callback%20handler/index.md#history) returned after saving the document.

Show an error message explaining why the version history cannot be displayed:

  ``` ts
  docEditor.refreshHistory({
    error: "Exception",
  })
  ```

| Parameter             | Description                                                                                                                                       | Type    | Presence |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | -------- |
| currentVersion        | Defines the current document version number.                                                                                                      | integer | required |
| error                 | Defines the error message text.                                                                                                                   | string  | optional |
| history               | Defines the array with the document versions.                                                                                                     | array   | required |
| history.changes       | Defines the *changes* from [the history object](../Callback%20handler/index.md#history) returned after saving the document.                       | object  | optional |
| history.created       | Defines the document version creation date.                                                                                                       | string  | required |
| history.key           | Defines the unique document identifier used by the service to recognize the document.                                                             | string  | required |
| history.serverVersion | Defines the current server version number. If the *changes* parameter is sent, then the *serverVersion* parameter is required to be sent as well. | integer | optional |
| history.user          | Defines the user who is the author of the document version.                                                                                       | object  | optional |
| history.user.id       | Defines the identifier of the user who is the author of the document version.                                                                     | string  | optional |
| history.user.name     | Defines the name of the user who is the author of the document version.                                                                           | string  | optional |
| history.version       | Defines the document version number.                                                                                                              | integer | required |

## requestClose

Request to close the editor. It is recommended to call this method before the [destroyEditor](#destroyeditor) method to check if there is some unsaved data in the editor or not. If the unsaved data exists, then the dialog box will be displayed to ask the user whether they want to continue editing or close the editor losing all the unsaved data. If the *Close* option will be chosen, then the [onRequestClose](../Config/Events/index.md#onrequestclose) event will be called.

  ``` ts
  docEditor.requestClose()
  ```

## setActionLink

Set the link to the document which contains a bookmark. This method must be called after the [onMakeActionLink](../Config/Events/index.md#onmakeactionlink) event. The software integrator must process the *ACTION\_DATA* received from the **document editing service** to set the link. The link is created by the software integrators who use ONLYOFFICE Docs in their **document manager**.

  ``` ts
  docEditor.setActionLink(link)
  ```

| Parameter | Description                                                                       | Type   | Presence |
| --------- | --------------------------------------------------------------------------------- | ------ | -------- |
| link      | Defines the link which allows scrolling to the bookmark position in the document. | string | required |

## setFavorite

Change the *Favorite* icon state. This method must be called after the [onMetaChange](../Config/Events/index.md#onmetachange) event.

  ``` ts
  docEditor.setFavorite(favorite)
  ```

| Parameter | Description                                                                  | Type    | Presence |
| --------- | ---------------------------------------------------------------------------- | ------- | -------- |
| favorite  | Defines if the *Favorite* icon is highlighted (**true**) or not (**false**). | boolean | true     |

## setHistoryData

Send the link to the document for viewing the version history. This method must be called after the [onRequestHistoryData](../Config/Events/index.md#onrequesthistorydata) events.

  ``` ts
  docEditor.setHistoryData({
    fileType: "docx",
    key: "Khirz6zTPdfd7",
    token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.iRcdHve235L5K1e29SmUBkuHcxb63WHRko51WMJlmS0",
    url: "https://example.com/url-to-example-document.docx",
    version: 2,
  })
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

If after editing and saving the document the *changesurl* link to the file with changes data is returned, download the file by this link and send the file URL in the *changesUrl* parameter. The absolute URL address of the document previous version must be sent in the *previous.url* parameter.

  ``` ts
  docEditor.setHistoryData({
    changesUrl: "https://example.com/url-to-changes.zip",
    fileType: "docx",
    key: "Khirz6zTPdfd7",
    previous: {
      fileType: "docx",
      key: "af86C7e71Ca8",
      url: "https://example.com/url-to-the-previous-version-of-the-document.docx",
    },
    token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGFuZ2VzVXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tY2hhbmdlcy56aXAiLCJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicHJldmlvdXMiOnsiZmlsZVR5cGUiOiJkb2N4Iiwia2V5IjoiYWY4NkM3ZTcxQ2E4IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tdGhlLXByZXZpb3VzLXZlcnNpb24tb2YtdGhlLWRvY3VtZW50LmRvY3gifSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.ril3Ol3rvYne3g0dG8TdKCiwJ7-7kkYGc6-XWMvp8FU",
    url: "https://example.com/url-to-example-document.docx",
    version: 2,
  })
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Send an error message explaining why the document version cannot be displayed:

  ``` ts
  docEditor.setHistoryData({
    error: "Exception",
    version: 2,
  })
  ```

| Parameter         | Description                                                                                                                                                                                                                                                                                                                 | Type    | Presence |
| ----------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | -------- |
| changesUrl        | Defines the url address of the file with the document changes data, which can be downloaded by the *changesurl* link from [the JSON object](../Callback%20handler/index.md#changesurl) returned after saving the document. The request for file is signed with a token which is checked by the ONLYOFFICE Docs.             | string  | optional |
| error             | Defines the error message text.                                                                                                                                                                                                                                                                                             | string  | optional |
| fileType          | Defines an extension of the document specified with the *url* parameter.                                                                                                                                                                                                                                                    | string  | optional |
| key               | Defines the document identifier used to unambiguously identify the document file.                                                                                                                                                                                                                                           | string  | required |
| previous          | Defines the object of the previous version of the document if *changesUrl* address was returned after saving the document.                                                                                                                                                                                                  | object  | optional |
| previous.fileType | Defines an extension of the document specified with the *previous.url* parameter.                                                                                                                                                                                                                                           | string  | optional |
| previous.key      | Defines the document identifier of the previous version of the document.                                                                                                                                                                                                                                                    | string  | required |
| previous.url      | Defines the url address of the previous version of the document.                                                                                                                                                                                                                                                            | string  | required |
| token             | Defines the encrypted signature added to the parameter in the form of a [token](../../Additional%20API/Signature/Browser/index.md#sethistorydata).                                                                                                                                                                          | string  | optional |
| url               | Defines the url address of the current document version. Can be downloaded by the *url* link from [the JSON object](../Callback%20handler/index.md#url) returned after saving the document. Be sure to add a [token](../../Get%20Started/How%20It%20Works/index.md) when using local links. Otherwise, an error will occur. | string  | required |
| version           | Defines the document version number.                                                                                                                                                                                                                                                                                        | integer | required |

## setMailMergeRecipients

Insert recipient data for mail merge into the file. This method must be called after the [onRequestMailMergeRecipients](../Config/Events/index.md#onrequestmailmergerecipients) event. Deprecated since version 7.5, please use [setRequestedSpreadsheet](#setrequestedspreadsheet) instead.

  ``` ts
  docEditor.setMailMergeRecipients({
    fileType: "xlsx",
    token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXJlY2lwaWVudHMueGxzeCJ9.P3TjOyX1Tv3xAVRAc8qtNb-uFLD6FH_WErag_rbI6nQ",
    url: "https://example.com/url-to-example-recipients.xlsx",
  })
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

| Parameter | Description                                                                                                                                                                                        | Type   | Presence |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| fileType  | Defines the type of spreadsheet for mail merge in the file. Can be: *csv*, *fods*, *ods*, *ots*, *xls*, *xlsm*, *xlsx*, *xlt*, *xltm*, *xltx*.                                                     | string | required |
| token     | Defines the encrypted signature added to the parameter in the form of a [token](../../Additional%20API/Signature/Browser/index.md#setmailmergerecipients).                                         | string | optional |
| url       | Defines the absolute URL where the source data is stored. Be sure to add a [token](../../Get%20Started/How%20It%20Works/Security/index.md) when using local links. Otherwise, an error will occur. | string | required |

## setReferenceData

Refresh data by a link to a file which is specified with the *referenceData*, *path*, or *link* parameters. This method must be called after the [onRequestReferenceData](../Config/Events/index.md#onrequestreferencedata) event.

  > This parameter is available for editing only for ONLYOFFICE Developer Edition.

  > Please note that this method is executed only when the user has permissions to the file from which the data is taken.

  ``` ts
  docEditor.setReferenceData({
    fileType: "xlsx",
    path: "sample.xlsx",
    referenceData: {
      fileKey: "BCFA2CED",
      instanceId: "https://example.com",
      key: "Khirz6zTPdfd7",
    },
    token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w",
    url: "https://example.com/url-to-example-document.xlsx",
  })
  ```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Show an error message explaining if any error occurred:

  ``` ts
  docEditor.setReferenceData({
    error: "Exception",
  })
  ```

| Parameter     | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Type   | Presence |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| error         | Defines the error message text.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | string | optional |
| fileType      | Defines an extension of the document specified with the *url* parameter.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | string | optional |
| path          | Defines the file name or relative path for the formula editor. It is used to identify a file when the [onRequestReferenceData](../Config/Events/index.md#onrequestreferencedata) event is executed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | string | required |
| referenceData | Defines an object that is generated by the integrator to uniquely identify a file in its system. This data must be the same as in the [document.referenceData](../Config/Document/index.md#referencedata) config parameter:<br><br>**fileKey** - the unique document identifier used by the service to get a link to the file. It must not be changed when the document is edited and saved (i.e. it is not equal to the [document.key](../Config/Document/index.md#key) parameter),<br>**type**: string,<br>**example**: "BCFA2CED";<br><br>**instanceId** - the unique system identifier. If the data was copied from a file on one system, and inserted into a file on another, then pasting by link will not be available and there will be no corresponding button in the context menu,<br>**type**: string,<br>**example**: `https://example.com`;<br><br>**key** - defines the unique document identifier used by the service to take the data from the co-editing session. In case the known key is sent, the document will be taken from the cache. Every time the document is edited and saved, the key must be generated anew. The document url can be used as the **key** but without the special characters and the length is limited to 128 symbol,<br>**type**: string,<br>**example**: "Khirz6zTPdfd7". | object | optional |
| token         | Defines the encrypted signature added to the parameter in the form of a [token](../../Additional%20API/Signature/Browser/index.md#setreferencedata).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | string | optional |
| url           | Defines the URL address to download the current file.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | string | required |

## setReferenceSource

Change a source of the external data. This method can be called after the [onRequestReferenceSource](../Config/Events/index.md#onrequestreferencesource) event.

  > Please note that this method is executed only when the user has permissions to the file from which the data is taken.

  ``` ts
  docEditor.setReferenceSource({
    fileType: "xlsx",
    path: "sample.xlsx",
    referenceData: {
      fileKey: "BCFA2CED",
      instanceId: "https://example.com",
      key: "Khirz6zTPdfd7",
    },
    token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w",
    url: "https://example.com/url-to-example-document.xlsx",
  })
  ```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

Show an error message explaining if any error occurred:

  ``` ts
  docEditor.setReferenceSource({
    error: "Exception",
  })
  ```

| Parameter     | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Type   | Presence |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------ | -------- |
| error         | Defines the error message text.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | string | optional |
| fileType      | Defines an extension of the document specified with the *url* parameter.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | string | optional |
| path          | Defines the file name or relative path for the formula editor. It is used to identify a file when the [onRequestReferenceSource](../Config/Events/index.md#onrequestreferencesource) event is executed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | string | required |
| referenceData | Defines an object that is generated by the integrator to uniquely identify a file in its system. This data must be the same as in the [document.referenceData](../Config/Document/index.md#referencedata) config parameter:<br><br>**fileKey** - the unique document identifier used by the service to get a link to the file. It must not be changed when the document is edited and saved (i.e. it is not equal to the [document.key](../Config/Document/index.md#key) parameter),<br>**type**: string,<br>**example**: "BCFA2CED";<br><br>**instanceId** - the unique system identifier. If the data was copied from a file on one system, and inserted into a file on another, then pasting by link will not be available and there will be no corresponding button in the context menu,<br>**type**: string,<br>**example**: `https://example.com`;<br><br>**key** - defines the unique document identifier used by the service to take the data from the co-editing session. In case the known key is sent, the document will be taken from the cache. Every time the document is edited and saved, the key must be generated anew. The document url can be used as the **key** but without the special characters and the length is limited to 128 symbols,<br>**type**: string,<br>**example**: "Khirz6zTPdfd7". | object | optional |
| token         | Defines the encrypted signature added to the parameter in the form of a [token](../../Additional%20API/Signature/Browser/index.md#setreferencesource).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | string | optional |
| url           | Defines the URL address to download the current file.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | string | required |

## setRequestedDocument

Select a document for comparing or combining. This method must be called after the [onRequestSelectDocument](../Config/Events/index.md#onrequestselectdocument) event.

> This parameter is available only for ONLYOFFICE Enterprise Edition and ONLYOFFICE Developer Edition.

  ``` ts
  docEditor.setRequestedDocument({
    c: "compare",
    fileType: "docx",
    url: "https://example.com/url-to-example-document.docx",
    token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8",
  })
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

| Parameter | Description                                                                                                                                                                                            | Type   | Presence |
| --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------ | -------- |
| c         | Defines a type of document selection from the event. Can be: *compare*, *combine*. The default value is "compare".                                                                                     | string | required |
| fileType  | Defines a type of the document to be selected. Can be: *doc*, *docm*, *docx*, *dot*, *dotm*, *dotx*, *epub*, *fodt*, *odt*, *ott*, *rtf*, *wps*.                                                       | string | required |
| token     | Defines the encrypted signature added to the parameter in the form of a [token](../../Additional%20API/Signature/Browser/index.md#setrequesteddocument).                                               | string | optional |
| url       | Defines the absolute URL where the source document is stored. Be sure to add a [token](../../Get%20Started/How%20It%20Works/Security/index.md) when using local links. Otherwise, an error will occur. | string | required |

## setRequestedSpreadsheet

Insert recipient data for mail merge into the file. This method must be called after the [onRequestSelectSpreadsheet](../Config/Events/index.md#onrequestselectspreadsheet) event.

  ``` ts
  docEditor.setRequestedSpreadsheet({
    c: "mailmerge",
    fileType: "xlsx",
    token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXJlY2lwaWVudHMueGxzeCJ9.P3TjOyX1Tv3xAVRAc8qtNb-uFLD6FH_WErag_rbI6nQ",
    url: "https://example.com/url-to-example-recipients.xlsx",
  })
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

| Parameter | Description                                                                                                                                                                                        | Type   | Presence |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ | -------- |
| c         | Defines a type of spreadsheet selection from the event. Can be *mailmerge*.                                                                                                                        | string | required |
| fileType  | Defines the type of spreadsheet for mail merge in the file. Can be: *csv*, *fods*, *ods*, *ots*, *xls*, *xlsm*, *xlsx*, *xlt*, *xltm*, *xltx*.                                                     | string | required |
| token     | Defines the encrypted signature added to the parameter in the form of a [token](../../Additional%20API/Signature/Browser/index.md#setrequestedspreadsheet).                                        | string | optional |
| url       | Defines the absolute URL where the source data is stored. Be sure to add a [token](../../Get%20Started/How%20It%20Works/Security/index.md) when using local links. Otherwise, an error will occur. | string | required |

## setRevisedFile

Select a document for comparing. This method must be called after the [onRequestCompareFile](../Config/Events/index.md#onrequestcomparefile) events. Deprecated since version 7.5, please use [setRequestedDocument](#setrequesteddocument) instead.

> This parameter is available only for ONLYOFFICE Enterprise Edition and ONLYOFFICE Developer Edition.

  ``` ts
  docEditor.setRevisedFile({
    fileType: "docx",
    token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8",
    url: "https://example.com/url-to-example-document.docx",
  })
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

| Parameter | Description                                                                                                                                                                                            | Type   | Presence |
| --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------ | -------- |
| fileType  | Defines the type of document for comparing. Can be: *doc*, *docm*, *docx*, *dot*, *dotm*, *dotx*, *epub*, *fodt*, *odt*, *ott*, *rtf*, *wps*.                                                          | string | required |
| token     | Defines the encrypted signature added to the parameter in the form of a [token](../../Additional%20API/Signature/Browser/index.md#setrevisedfile).                                                     | string | optional |
| url       | Defines the absolute URL where the source document is stored. Be sure to add a [token](../../Get%20Started/How%20It%20Works/Security/index.md) when using local links. Otherwise, an error will occur. | string | required |

## setSharingSettings

Update the [information](../Config/Document/Info/index.md#sharingsettings) about the settings which allow to share the document with other users. This method can be called after the [onRequestSharingSettings](../Config/Events/index.md#onrequestsharingsettings) events.

  ``` ts
  docEditor.setSharingSettings({
    sharingSettings: [
      {
        permissions: "Full Access",
        user: "John Smith",
      },
      {
        isLink: true,
        permissions: "Read Only",
        user: "External link",
      },
    ],
  })
  ```

| Parameter                   | Description                                                             | Type            | Presence |
| --------------------------- | ----------------------------------------------------------------------- | --------------- | -------- |
| sharingSettings             | Defines the settings which allow sharing the document with other users. | array of object | optional |
| sharingSettings.permissions | Defines the access rights for the user with the name above.             | string          | optional |
| sharingSettings.user        | Defines the name of the user with whom the document will be shared.     | string          | optional |

## setUsers

Set a list of users to mention in the comments, grant the access rights to edit the specific sheet ranges, or set the user avatars. This method must be called after the [onRequestUsers](../Config/Events/index.md#onrequestusers) events.

  ``` ts
  docEditor.setUsers({
    c: "protect",
    users: [
      {
        email: "john@example.com",
        id: "78e1e841",
        image: "https://example.com/url-to-user-avatar1.png",
        name: "John Smith",
      },
      {
        email: "kate@example.com",
        id: "F89d8069ba2b",
        image: "https://example.com/url-to-user-avatar2.png",
        name: "Kate Cage",
      },
    ],
  })
  ```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

| Parameter   | Description                                                                                                                                                                                                      | Type             | Presence |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------- | -------- |
| c           | Defines the operation type from the [onRequestUsers](../Config/Events/index.md#onrequestusers) event. It can take one of the following values - *mention*, *protect*, or *info*. The default value is *mention*. | string           | required |
| users       | Defines the list of the users.                                                                                                                                                                                   | array of strings | optional |
| users.email | Defines the email address of the user. This field is required when the *c* parameter is *mention*.                                                                                                               | string           | optional |
| users.id    | Defines the identification of the user. This field is required when the *c* parameter is *protect*.                                                                                                              | string           | optional |
| users.image | Defines the path to the user's avatar. This field is required when the *c* parameter is *info*.                                                                                                                  | string           | optional |
| users.name  | Defines the full name of the user.                                                                                                                                                                               | string           | optional |

> Please note that the request to the user's avatar is sent without authorization because the avatar URL is inserted into the HTML of the editor frame. Moreover, the CORS problem may occur. In this case, use the avatar in the base64 format. For example, *"data:image/png,base64,\*\*\*\*\*"*.

> Please note that if you are subscribed to the *onRequestUsers* event and send an avatar using the *setUsers* method, the [user.image](../Config/Editor/index.md#user) field in the initialization config is not required. We especially don't recommend to specify this parameter if the avatar is sent in the base64 format and the initialization config is signed with JWT. In this case, the token will be too long.

## showMessage

Display a tooltip with a message. This method can be called only after the [onAppReady](../Config/Events/index.md#onappready) events.

  ``` ts
  docEditor.showMessage(message)
  ```

| Parameter | Description               | Type   | Presence |
| --------- | ------------------------- | ------ | -------- |
| message   | Defines the message text. | string | required |

> Please note that displaying a tooltip with a message is not supported in the embedded platform [type](../Config/index.md#type).

## startFilling

Start filling out the ready forms and lock the pdf editing (only pdf viewing becomes available). This method can be called only after the [onRequestStartFilling](../Config/Events/index.md#onrequeststartfilling) event.

  ``` ts
  docEditor.startFilling()
  ```
