The events section allows to change all the functions pertaining to the events.

* [onAppReady](#onappready) - the application is loaded into the browser.
* [onCollaborativeChanges](#oncollaborativechanges) - the document is co-edited by the other user in the *strict* co-editing mode.
* [onDocumentReady](#ondocumentready) - the document is loaded into the document editor.
* [onDocumentStateChange](#ondocumentstatechange) - the document is modified.
* [onDownloadAs](#ondownloadas) - the absolute URL to the edited file when the *downloadAs* method is being called.
* [onError](#onerror) - an error or some other specific event occurs.
* [onInfo](#oninfo) - the application opened the file.
* [onMakeActionLink](#onmakeactionlink) - the user is trying to get link for opening the document which contains a bookmark, scrolling to the bookmark position.
* [onMetaChange](#onmetachange) - the meta information of the document is changed via the *meta* command.
* [onOutdatedVersion](#onoutdatedversion) - the document is opened for editing with the old *document.key* value, which was used to edit the previous document version and was successfully saved.
* [onPluginsReady](#onpluginsready) - all plugins are loaded and can be used.
* [onReady](#onready) - the application is loaded into the browser.
* [onRequestClose](#onrequestclose) - the work with the editor must be ended and the editor must be closed.
* [onRequestCompareFile](#onrequestcomparefile) - the user is trying to select document for comparing by clicking the *Document from Storage* button.
* [onRequestCreateNew](#onrequestcreatenew) - the user is trying to create document by clicking the *Create New* button.
* [onRequestEditRights](#onrequesteditrights) - the user is trying to switch the document from the viewing into the editing mode by clicking the *Edit current file* button.
* [onRequestHistory](#onrequesthistory) - the user is trying to show the document version history by clicking the *Version History* button.
* [onRequestHistoryClose](#onrequesthistoryclose) - the user is trying to go back to the document from viewing the document version history by clicking the *Close History* button.
* [onRequestHistoryData](#onrequesthistorydata) - the user is trying to click the specific document version in the document version history.
* [onRequestInsertImage](#onrequestinsertimage) - the user is trying to insert an image by clicking the *Image from Storage* button.
* [onRequestMailMergeRecipients](#onrequestmailmergerecipients) - the user is trying to select recipients data by clicking the *Mail merge* button.
* [onRequestOpen](#onrequestopen) - the user is trying to open an external link.
* [onRequestReferenceData](#onrequestreferencedata) - the user is trying to refresh data inserted from the external file by clicking the *Update values* button in the *External* links dialog box of the *Data* tab.
* [onRequestReferenceSource](#onrequestreferencesource) - the user is trying to change an external link by clicking the *Change source* button.
* [onRequestRename](#onrequestrename) - the user is trying to rename the file by clicking the *Rename...* button.
* [onRequestRestore](#onrequestrestore) - the user is trying to restore the file version by clicking the *Restore* button in the version history.
* [onRequestSaveAs](#onrequestsaveas) - the user is trying to save file by clicking *Save Copy as...* button.
* [onRequestSelectDocument](#onrequestselectdocument) - the user is trying to select a document for comparing or combining.
* [onRequestSelectSpreadsheet](#onrequestselectspreadsheet) - the user is trying to select recipients data by clicking the *Mail merge* button.
* [onRequestSendNotify](#onrequestsendnotify) - the user is mentioned in a comment.
* [onRequestSharingSettings](#onrequestsharingsettings) - the user is trying to manage document access rights by clicking *Change access rights* button.
* [onRequestStartFilling](#onrequeststartfilling) - the user is trying to start filling out the ready forms by clicking the *Start filling* button in the pdf editing mode.
* [onRequestUsers](#onrequestusers) - the user can select other users to mention in the comments, grant the access rights to edit the specific sheet ranges, or set the user avatars.
* [onSubmit](#onsubmit) - the force saving request of the *3* [forcesavetype](../../Callback%20handler/index.md#forcesavetype) is successfully performed.
* [onWarning](#onwarning) - a warning occurs.


## onAppReady

The function called when the application is loaded into the browser.

### Example

``` javascript
var onAppReady = function () {
    console.log("ONLYOFFICE Document Editor is ready");
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onAppReady": onAppReady,
    },
});
```

## onCollaborativeChanges

The function called when the document is co-edited by the other user in the *strict* co-editing mode.

### Example

``` javascript
var onCollaborativeChanges = function () {
    console.log("The document changed by collaborative user");
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onCollaborativeChanges": onCollaborativeChanges,
    },
});
```

## onDocumentReady

The function called when the document is loaded into the document editor.

### Example

``` javascript
var onDocumentReady = function () {
    console.log("Document is loaded");
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onDocumentReady": onDocumentReady,
    },
});
```

## onDocumentStateChange

The function called when the document is modified. It is called with the parameter: *{"data": true}* when the current user is editing the document and with the parameter: *{"data" : false}* when the current user's changes are sent to the **document editing service**.

### Example

``` javascript
var onDocumentStateChange = function (event) {
    if (event.data) {
        console.log("The document changed");
    } else {
        console.log("Changes are collected on document editing service");
    }
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onDocumentStateChange": onDocumentStateChange,
    },
});
```

## onDownloadAs

The function called with the absolute URL to the edited file when the [downloadAs](../../Methods/index.md#downloadas) method is being called. The absolute URL to the document to be downloaded and its type are sent in the *data* parameter.

### Example

``` javascript
var onDownloadAs = function (event) {
    var fileType = event.data.fileType;
    var url = event.data.url;
    console.log("ONLYOFFICE Document Editor create file: " + url);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onDownloadAs": onDownloadAs,
    },
});
```

## onError

The function called when an error or some other specific event occurs. The error message is sent in the *data* parameter. A list of error codes can be found [here](https://github.com/ONLYOFFICE/sdkjs/blob/master/common/errorCodes.js).

### Example

``` javascript
var onError = function (event) {
    console.log("ONLYOFFICE Document Editor reports an error: code " + event.data.errorCode + ", description " + event.data.errorDescription);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onError": onError,
    },
});
```

## onInfo

The function called when the application opened the file. The mode is sent in the *data.mode* parameter. Can be **view** or **edit**.

### Example

``` javascript
var onInfo = function (event) {
    console.log("ONLYOFFICE Document Editor is opened in mode " + event.data.mode);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onInfo": onInfo,
    },
});
```

## onMakeActionLink

The function called when the user is trying to get link for opening the document which contains a bookmark, scrolling to the bookmark position.

To set the bookmark link, you must call the [setActionLink](../../Methods/index.md#setactionlink) method. The bookmark data is received in the *data* parameter and must be then used in the configuration as the value for the [editorConfig.actionLink](../Editor/index.md#actionlink) parameter. If the method is not declared the *Get Link* button will not be displayed.

![onMakeActionLink](/assets/images/editor/onMakeActionLink.png)

### Example

``` javascript
var onMakeActionLink = function (event){
    var ACTION_DATA = event.data;
    var link = GENERATE_LINK(ACTION_DATA);
    docEditor.setActionLink(link);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onMakeActionLink": onMakeActionLink,
    },
});
```

## onMetaChange

The function called when the meta information of the document is changed via the [meta](../../../Additional%20API/Command%20service/meta/index.md) command.

The name of the document is sent in the *data.title* parameter. The *Favorite* icon highlighting state is sent in the *data.favorite* parameter.

When the user clicks the *Favorite* icon, the [setFavorite](../../Methods/index.md#setfavorite) method is called to update the [information](../Document/Info/index.md#favorite) about the *Favorite* icon highlighting state. If the method is not declared, the *Favorite* icon will not be changed.

### Example

``` javascript
var onMetaChange = function (event) {
    var title = event.data.title;
    var favorite = event.data.favorite;
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onMetaChange": onMetaChange,
    },
});
```

## onOutdatedVersion

The function called after the [error](../../../More%20Information/Troubleshooting/index.md#key) is shown, when the document is opened for editing with the old [document.key](../Document/index.md#key) value, which was used to edit the previous document version and was successfully saved. When this event is called the editor must be reinitialized with a new *document.key*.

### Example

``` javascript
var onOutdatedVersion = function () {
    location.reload(true);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onOutdatedVersion": onOutdatedVersion,
    },
});
```

## onPluginsReady

Tthe function called when all plugins are loaded and can be used.

### Example

``` javascript
var onPluginsReady = function () {};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onPluginsReady": onPluginsReady,
    },
});
```

## onReady

The function called when the application is loaded into the browser. Deprecated since version 5.0, please use [onAppReady](#onappready) instead

## onRequestClose

The function called when the user is trying to end the work with the editor and close it by clicking the cross button. If the method is not declared, the [editorConfig.customization.close](../Editor/Customization/index.md#close) parameter will not be available, and the cross button will not be displayed.

### Example

``` javascript
var onRequestClose = function () {
    if (window.opener) {
        window.close();
        return;
    }
    docEditor.destroyEditor();
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestClose": onRequestClose,
    },
});
```

## onRequestCompareFile

The function called when the user is trying to select document for comparing by clicking the *Document from Storage* button. Deprecated since version 7.5, please use [onRequestSelectDocument](#onrequestselectdocument) instead.

> This event is available only for ONLYOFFICE Enterprise Edition and ONLYOFFICE Developer Edition.

## onRequestCreateNew

The function called when the user is trying to create document by clicking the *Create New* button. This method is used instead of the [createUrl](../Editor/index.md#createurl) field. If the method is not declared and the *createUrl* is not specified the *Create New* button will not be displayed.

### Example

``` javascript
var onRequestCreateNew = function () {};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestCreateNew": onRequestCreateNew,
    },
});
```

## onRequestEditRights

The function called when the user is trying to switch the document from the viewing into the editing mode by clicking the *Edit current file* button. This event also fires when the user clicks the *Edit PDF* button in the forms that are open in the *view* or *fillForms* mode. When the function is called, the editor must be initialized again, in editing mode. If the method is not declared the *Edit current file* and *Edit PDF* buttons will not be displayed.

> **onRequestEditRights** parameter is obligatory when the [editorConfig](../Editor/index.md#mode) *mode* parameter is set to **view** and the *permission* to *edit* the document ([document permissions](../Document/Permissions/index.md#edit)) is set to **true** so that the user could switch to the editing mode.

![onRequestEditRights](/assets/images/editor/onRequestEditRights.png)
![Edit PDF button](/assets/images/editor/edit-pdf.png)

### Example

``` javascript
var onRequestEditRights = function () {
    console.log("ONLYOFFICE Document Editor requests editing rights");
    document.location.reload();
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestEditRights": onRequestEditRights,
    },
});
```

## onRequestHistory

The function called when the user is trying to show the document version history by clicking the *Version History* button.

To show the document version history you must call the [refreshHistory](../../Methods/index.md#refreshhistory) method. If the method and the [onRequestHistoryData](#onrequesthistorydata) method is not declared the *Version History* button will not be displayed.

<img alt="onRequestHistory" src="/assets/images/editor/onRequestHistory.png" width="282px">

### Example

``` javascript
var onRequestHistory = function () {
    docEditor.refreshHistory({
        "currentVersion": 2,
        "history": [
            {
                "created": "2010-07-06 10:13 AM",
                "key": "af86C7e71Ca8",
                "user": {
                    "id": "F89d8069ba2b",
                    "name": "Kate Cage"
                },
                "version": 1
            },
            {
                "changes": changes,
                "created": "2010-07-07 3:46 PM",
                "key": "Khirz6zTPdfd7",
                "serverVersion": serverVersion,
                "user": {
                    "id": "78e1e841",
                    "name": "John Smith"
                },
                "version": 2
            },
        ]
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestHistory": onRequestHistory,
    },
});
```

Where the **changes** is the *changes* from [the history object](../../Callback%20handler/index.md#history) returned after saving the document.

Where the **serverVersion** is the *serverVersion* from [the history object](../../Callback%20handler/index.md#history) returned after saving the document.

## onRequestHistoryClose

The function called when the user is trying to go back to the document from viewing the document version history by clicking the *Close History* button. When the function is called, the editor must be initialized again, in editing mode. If the method is not declared the *Close History* button will not be displayed.

![onRequestHistoryClose](/assets/images/editor/onRequestHistoryClose.png)

### Example

``` javascript
var onRequestHistoryClose = function () {
    document.location.reload();
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestHistoryClose": onRequestHistoryClose,
    },
});
```

## onRequestHistoryData

The function called when the user is trying to click the specific document version in the document version history.

The document version number is sent in the *data* parameter.

To show the changes corresponding to the specific document version you must call the [setHistoryData](../../Methods/index.md#sethistorydata) method. When calling this method, the token must be added to validate the parameters. If the method and the [onRequestHistory](#onrequesthistory) method is not declared the *Version History* button will not be displayed.

![onRequestHistoryData](/assets/images/editor/onRequestHistoryData.png)

### Example

``` javascript
var onRequestHistoryData = function (event) {
    var version = event.data;
    docEditor.setHistoryData({
        "changesUrl": "https://example.com/url-to-changes.zip",
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "previous": {
            "fileType": "docx",
            "key": "af86C7e71Ca8",
            "url": "https://example.com/url-to-the-previous-version-of-the-document.docx"
        },
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGFuZ2VzVXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tY2hhbmdlcy56aXAiLCJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicHJldmlvdXMiOnsiZmlsZVR5cGUiOiJkb2N4Iiwia2V5IjoiYWY4NkM3ZTcxQ2E4IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tdGhlLXByZXZpb3VzLXZlcnNpb24tb2YtdGhlLWRvY3VtZW50LmRvY3gifSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4In0.pfPJs9XvCmAnPiUnZYRm0rZGPYHzqfEP7AFRjKg1af4",
        "url": "https://example.com/url-to-example-document.docx",
        "version": version
    })
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestHistoryData": onRequestHistoryData,
    },
});
```

Where the **changesUrl** is the *changesUrl* from [the JSON object](../../Callback%20handler/index.md#changesurl) returned after saving the document.

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

## onRequestInsertImage

The function called when the user is trying to insert an image by clicking the *Image from Storage* button.

The type of image insertion is specified in parameter *data.c*.

To insert an image into the file you must call the [insertImage](../../Methods/index.md#insertimage) method with the specified command. When calling this method, the token must be added to validate the parameters. If the method is not declared the *Image from Storage* button will not be displayed.

![onRequestInsertImage](/assets/images/editor/onRequestInsertImage.png)

### Example

``` javascript
var onRequestInsertImage = function (event) {
    docEditor.insertImage({
        "c": event.data.c,
        "images": [
            {
                "fileType": "png",
                "url": "https://example.com/url-to-example-image1.png"
            },
            {
                "fileType": "png",
                "url": "https://example.com/url-to-example-image2.png"
            },
        ],
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpbWFnZXMiOlt7ImZpbGVUeXBlIjoicG5nIiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1pbWFnZTEucG5nIn0seyJmaWxlVHlwZSI6InBuZyIsInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtaW1hZ2UyLnBuZyJ9XX0.ly1O8-6u4Y7WJlgp9O-bJMeffHe0GtaXzyvY2UUFJTg"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestInsertImage": onRequestInsertImage,
    },
});
```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

## onRequestMailMergeRecipients

The function called when the user is trying to select recipients data by clicking the *Mail merge* button. Deprecated since version 7.5, please use [onRequestSelectSpreadsheet](#onrequestselectspreadsheet) instead.

## onRequestOpen

The function called when the user is trying to open an external link by clicking the *Open source* button. If the method is not declared, this button will not be displayed.

To open the editor with the external file referenced by the *path* or *referenceData* parameters in a new tab, you must pass a link to this tab by calling the [window.open](https://developer.mozilla.org/en-US/docs/Web/API/Window/open) method with the *path* and *windowName* parameters.

An object with the unique file data, the file path, and a new browser tab name are sent in the *data* parameter.

<img alt="Open source" src="/assets/images/editor/open-source.png" width="498px">

### Example

``` javascript
var onRequestOpen = function (event) {
    var path  = event.data.path;
    var referenceData = event.data.referenceData;
    var windowName  = event.data.windowName;
    window.open({
        "path": "https://example.com/external-url.docx",
        "windowName": event.data.windowName
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestOpen": onRequestOpen,
    },
});
```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

## onRequestReferenceData

The function called when the user is trying to refresh data inserted from the external file by clicking the *Update values* button in the *External links* dialog box of the *Data* tab.

An object with the unique file data from the source file, the file path or name, and the file URL are sent in the *data* parameter.

To refresh data by a link to a file which is specified with the event parameters, you must call the [setReferenceData](../../Methods/index.md#setreferencedata) method. When calling this method, the token must be added to validate the parameters. If the event is not declared, the *Paste link* and *Update values* buttons will not be displayed.

> To send the data to the *setReferenceData* method, it is recommended to search for the file by the *referenceData* parameter first. If there is no such a field or a file cannot be found, then the *path* or *link* parameters are used.

<img alt="Paste link" src="/assets/images/editor/paste-link.png" width="400px">

<img alt="Update values" src="/assets/images/editor/update-values.png" width="400px">

### Example

``` javascript
var onRequestReferenceData = function () {
    var link = event.data.link;
    var referenceData =  event.data.referenceData;
    var path = event.data.path;

    docEditor.setReferenceData({
        "fileType": "xlsx",
        "path": "sample.xlsx",
        "referenceData": {
            "fileKey": "BCFA2CED",
            "instanceId": "https://example.com",
            "key": "Khirz6zTPdfd7"
        },
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w",
        "url": "https://example.com/url-to-example-document.xlsx"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestReferenceData": onRequestReferenceData,
    },
});
```

## onRequestReferenceSource

The function called when the user is trying to change a source of the external data by clicking the *Change source* button.

An object with the unique file data and the file path or name are sent in the *data* parameter.

When the button is clicked, you must call the [setReferenceSource](../../Methods/index.md#setreferencesource) method to change a source of the external data. When calling this method, the token must be added to validate the parameters. If the event is not declared, the *Change source* button will not be displayed.

> To send the data to the *setReferenceSource* method, it is recommended to search for the file by the *referenceData* parameter first. If there is no such a field or a file cannot be found, then the *path* parameter is used.

<img alt="Change source" src="/assets/images/editor/change-source.png" width="498px">

### Example

``` javascript
var onRequestReferenceSource = function () {
    var referenceData =  event.data.referenceData;
    var path = event.data.path;

    docEditor.setReferenceSource({
        "fileType": "xlsx",
        "path": "sample.xlsx",
        "referenceData": {
            "fileKey": "BCFA2CED",
            "instanceId": "https://example.com",
            "key": "Khirz6zTPdfd7"
        },
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w",
        "url": "https://example.com/url-to-example-document.xlsx"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestReferenceSource": onRequestReferenceSource,
    },
});
```

## onRequestRename

The function called when the user is trying to rename the file by clicking the *Rename...* button.

> Until version 6.0 the *Rename...* button is only available if the [document.permissions.rename](../Document/Permissions/index.md#rename) is set to **true**.

<img alt="onRequestRename" src="/assets/images/editor/onRequestRename.png" width="282px">

### Example

``` javascript
var onRequestRename = function (event) {
    var title = event.data;
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestRename": onRequestRename,
    },
});
```

## onRequestRestore

The function called when the user is trying to restore the file version by clicking the *Restore* button in the version history.

The document version number is sent in the *data.version* parameter if it is called for the document version from the history. Additionally, the document link is sent in the *data.url* parameter if it is called for the document changes from the [history object](../../Callback%20handler/index.md#history). The type of the document which is specified with this link is sent in the *data.fileType* parameter.

When the function is called, you must call the [refreshHistory](../../Methods/index.md#refreshhistory) method to initialize version history again. If the method is not declared the *Restore* button will not be displayed.

> The *Restore* button is displayed for the previous document versions only and hidden for the current one. Until version 5.5 the *Restore* button is only available if the [document.permissions.changeHistory](../Document/Permissions/index.md#changehistory) is set to **true**.

![onRequestRestore](/assets/images/editor/onRequestRestore.png)

### Example

``` javascript
var onRequestRestore = function (event) {
    var fileType = event.data.fileType;
    var url = event.data.url;
    var version = event.data.version;

    docEditor.refreshHistory({
        "currentVersion": 2,
        "history": [
            {
                "created": "2010-07-06 10:13 AM",
                "key": "af86C7e71Ca8",
                "user": {
                    "id": "F89d8069ba2b",
                    "name": "Kate Cage"
                },
                "version": 1
            },
            {
                "changes": changes,
                "created": "2010-07-07 3:46 PM",
                "key": "Khirz6zTPdfd7",
                "serverVersion": serverVersion,
                "user": {
                    "id": "78e1e841",
                    "name": "John Smith"
                },
                "version": 2
            },
        ]
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestRestore": onRequestRestore,
    },
});
```

Where the **changes** is the *changes* from [the history object](../../Callback%20handler/index.md#history) returned after saving the document.

Where the **serverVersion** is the *serverVersion* from [the history object](../../Callback%20handler/index.md#history) returned after saving the document.

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

## onRequestSaveAs

The function called when the user is trying to save file by clicking *Save Copy as...* button. The title of the document, its type and the absolute URL to the document to be downloaded are sent in the *data* parameter. If the method is not declared the *Save Copy as...* button will not be displayed.

![onRequestSaveAs](/assets/images/editor/onRequestSaveAs.png)

### Example

``` javascript
var onRequestSaveAs = function (event) {
    var fileType = event.data.fileType;
    var title = event.data.title;
    var url = event.data.url;
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestSaveAs": onRequestSaveAs,
    },
});
```

## onRequestSelectDocument

The function called when the user is trying to select a document for comparing or combining.

The type of document selection is specified in the *data.c* parameter.

To select a document for comparing or combining, you must call the [setRequestedDocument](../../Methods/index.md#setrequesteddocument) method.

> This event is available only for ONLYOFFICE Enterprise Edition and ONLYOFFICE Developer Edition.

![onRequestSelectDocument](/assets/images/editor/onRequestSelectDocument.png)

### Example

``` javascript
var onRequestSelectDocument = function () {
    docEditor.setRequestedDocument({
        "c": event.data.c,
        "fileType": "docx",
        "url": "https://example.com/url-to-example-document.docx",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestSelectDocument": onRequestSelectDocument,
    },
});
```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

## onRequestSelectSpreadsheet

The function called when the user is trying to select recipients data by clicking the *Mail merge* button.

The type of spreadsheet selection is specified in the *data.c* parameter.

To select recipient data, you must call the [setRequestedSpreadsheet](../../Methods/index.md#setrequestedspreadsheet) method. When calling this method, the token must be added to validate the parameters. If the method is not declared, the *Mail merge* button will become faded and unclickable.

![onRequestSelectSpreadsheet](/assets/images/editor/onRequestMailMergeRecipients.png)

### Example

``` javascript
var onRequestSelectSpreadsheet = function () {
    docEditor.setRequestedSpreadsheet({
        "c": event.data.c,
        "fileType": "xlsx",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXJlY2lwaWVudHMueGxzeCJ9.P3TjOyX1Tv3xAVRAc8qtNb-uFLD6FH_WErag_rbI6nQ",
        "url": "https://example.com/url-to-example-recipients.xlsx"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestSelectSpreadsheet": onRequestSelectSpreadsheet,
    },
});
```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

## onRequestSendNotify

The function called when the user is mentioned in a comment.

The message and the list of emails is sent in the *data* parameter. The comment data is received in the *data.actionLink* parameter and must be then used in the configuration as the value for the [editorConfig.actionLink](../Editor/index.md#actionlink) parameter.

The list of users to be mentioned should be completed by [setUsers](../../Methods/index.md#setusers) method.

> In version 5.4, **onRequestSendNotify** event can only be used if [onRequestUsers](#onrequestusers) event is set. Starting from version 5.5, there is no such dependency between **onRequestSendNotify** and **onRequestUsers** - both can be set independently.

### Example

``` javascript
var onRequestSendNotify = function (event) {
    var ACTION_DATA = event.data.actionLink;
    var comment = event.data.message;
    var emails = event.data.emails;
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestSendNotify": onRequestSendNotify,
    },
});
```

## onRequestSharingSettings

The function called when the user is trying to manage document access rights by clicking *Change access rights* button.

When the access rights is changed, you must call the [setSharingSettings](../../Methods/index.md#setsharingsettings) method to update the [information](../Document/Info/index.md#sharingsettings) about the settings which allow to share the document with other users. If the method is not declared the *Change access rights* button will not be displayed.

![onRequestSharingSettings](/assets/images/editor/onRequestSharingSettings.png)

### Example

``` javascript
var onRequestSharingSettings = function () {
    docEditor.setSharingSettings({
        "sharingSettings": [
            {
                "permissions": "Full Access",
                "user": "John Smith"
            },
            {
                "isLink": true,
                "permissions": "Read Only",
                "user": "External link"
            }
        ]
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestSharingSettings": onRequestSharingSettings,
    },
});
```

## onRequestStartFilling

The function called when the user is trying to start filling out the ready forms by clicking the *Start filling* button in the pdf editing mode. If the event is not declared, this button will not be displayed.

When the user clicks the *Start filling* button, the [startFilling](../../Methods/index.md#startfilling) method is called to lock the pdf editing (only pdf viewing becomes available).

### Example

``` javascript
var onRequestStartFilling = function () {
    docEditor.startFilling();
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestStartFilling": onRequestStartFilling,
    },
});
```

## onRequestUsers

The function called when the user can select other users to mention in the comments, grant the access rights to edit the specific sheet ranges, or set the user avatars.

Starting from version 7.4, the operation type can be specified in the *data.c* parameter. It can take two values - *mention* or *protect*. Prior to version 7.4, only the mention operation was available with this event.

Starting from version 8.0, the *info* operation type is added to set the avatars for the users with the ids specified in the *data.id* parameter.

To set a list of users, you must call the [setUsers](../../Methods/index.md#setusers) method which can take different lists of users depending on the specified operation type. The *onRequestUsers* event is called once for each *c* type when the corresponding operation is performed. If the *setUsers* is called with an empty list, then the *onRequestUsers* event will fire again.

<img alt="onRequestUsers" src="/assets/images/editor/onRequestUsers.png" width="309px">

<img alt="Protect range" src="/assets/images/editor/protect-range.png" width="292px">

### Example

``` javascript
var onRequestUsers = function (event) {
    var c = event.data.c;
    var id = event.data.id;

    docEditor.setUsers({
        "c": event.data.c,
        "users": [
            {
                "email": "john@example.com",
                "id": "78e1e841",
                "image": "https://example.com/url-to-user-avatar1.png",
                "name": "John Smith"
            },
            {
                "email": "kate@example.com",
                "id": "F89d8069ba2b",
                "image": "https://example.com/url-to-user-avatar2.png",
                "name": "Kate Cage"
            },
        ]
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestUsers": onRequestUsers,
    },
});
```

## onSubmit

The function called when the force saving request of the *3* [forcesavetype](../../Callback%20handler/index.md#forcesavetype) is successfully performed, i.e. when the **Complete & Submit** button is clicked and the form is submitted.

### Example

``` javascript
var onSubmit = function (event) {
    console.log("The form was submitted.");
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onSubmit": onSubmit,
    },
});
```

## onWarning

The function called when a warning occurs. The warning message is sent in the *data* parameter. A list of error codes can be found [here](https://github.com/ONLYOFFICE/sdkjs/blob/master/common/errorCodes.js).

### Example

``` javascript
var onWarning = function (event) {
    console.log("ONLYOFFICE Document Editor reports a warning: code " + event.data.warningCode + ", description " + event.data.warningDescription);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onWarning": onWarning,
    },
});
```
