<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/") %>"></a>
    <span class="hdr">Events</span>
</h1>

<p class="dscr">The events section allows to change all the functions pertaining to the events.</p>

<ul>
    <li><a href="#onAppReady">onAppReady</a> - the application is loaded into the browser.</li>
    <li><a href="#onCollaborativeChanges">onCollaborativeChanges</a> - the document is co-edited by the other user in the <em>strict</em> co-editing mode.</li>
    <li><a href="#onDocumentReady">onDocumentReady</a> - the document is loaded into the document editor.</li>
    <li><a href="#onDocumentStateChange">onDocumentStateChange</a> - the document is modified.</li>
    <li><a href="#onDownloadAs">onDownloadAs</a> - the absolute URL to the edited file when the <em>downloadAs</em> method is being called.</li>
    <li><a href="#onError">onError</a> - an error or some other specific event occurs.</li>
    <li><a href="#onInfo">onInfo</a> - the application opened the file.</li>
    <li><a href="#onMetaChange">onMetaChange</a> - the meta information of the document is changed via the <em>meta</em> command.</li>
    <li><a href="#onMakeActionLink">onMakeActionLink</a> - the user is trying to get link for opening the document which contains a bookmark, scrolling to the bookmark position.</li>
    <li><a href="#onOutdatedVersion">onOutdatedVersion</a> - the document is opened for editing with the old <em>document.key</em> value, which was used to edit the previous document version and was successfully saved.</li>
    <li><a href="#onPluginsReady">onPluginsReady</a> - all plugins are loaded and can be used.</li>
    <li><a href="#onReady">onReady</a> - the application is loaded into the browser.</li>
    <li><a href="#onRequestClose">onRequestClose</a> - the work with the editor must be ended and the editor must be closed.</li>
    <li><a href="#onRequestCompareFile">onRequestCompareFile</a> - the user is trying to select document for comparing by clicking the <em>Document from Storage</em> button.</li>
    <li><a href="#onRequestCreateNew">onRequestCreateNew</a> - the user is trying to create document by clicking the <em>Create New</em> button.</li>
    <li><a href="#onRequestEditRights">onRequestEditRights</a> - the user is trying to switch the document from the viewing into the editing mode by clicking the <em>Edit Document</em> button.</li>
    <li><a href="#onRequestHistory">onRequestHistory</a> - the user is trying to show the document version history by clicking the <em>Version History</em> button.</li>
    <li><a href="#onRequestHistoryClose">onRequestHistoryClose</a> - the user is trying to go back to the document from viewing the document version history  by clicking the <em>Close History</em> button.</li>
    <li><a href="#onRequestHistoryData">onRequestHistoryData</a> - the user is trying to click the specific document version in the document version history.</li>
    <li><a href="#onRequestInsertImage">onRequestInsertImage</a> - the user is trying to insert an image by clicking the <em>Image from Storage</em> button.</li>
    <li><a href="#onRequestMailMergeRecipients">onRequestMailMergeRecipients</a> - the user is trying to select recipients data by clicking the <em>Mail merge</em> button.</li>
    <li><a href="#onRequestReferenceData">onRequestReferenceData</a> - the user is trying to refresh data inserted from the external file by clicking the <em>Update values</em> button in the <em>External</em> links dialog box of the <em>Data</em> tab.</li>
    <li><a href="#onRequestRename">onRequestRename</a> - the user is trying to rename the file by clicking the <em>Rename...</em> button.</li>
    <li><a href="#onRequestRestore">onRequestRestore</a> - the user is trying to restore the file version by clicking the <em>Restore</em> button in the version history.</li>
    <li><a href="#onRequestSaveAs">onRequestSaveAs</a> - the user is trying to save file by clicking <em>Save Copy as...</em> button.</li>
    <li><a href="#onRequestSendNotify">onRequestSendNotify</a> - the user is mentioned in a comment.</li>
    <li><a href="#onRequestSharingSettings">onRequestSharingSettings</a> - the user is trying to manage document access rights by clicking <em>Change access rights</em> button.</li>
    <li><a href="#onRequestUsers">onRequestUsers</a> - the user can select other users to mention in the comments or grant the access rights to edit the specific sheet ranges.</li>
    <li><a href="#onWarning">onWarning</a> - a warning occurs.</li>
</ul>

<h2>Events and their description:</h2>
<ul>
    <li>
        <p><b id="onAppReady" class="copy-link">onAppReady</b> - the function called when the application is loaded into the browser.</p>
        <div class="header-gray">Example</div>
        <pre>
var onAppReady = function () {
    console.log("ONLYOFFICE Document Editor is ready");
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onAppReady": onAppReady,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onCollaborativeChanges" class="copy-link">onCollaborativeChanges</b> - the function called when the document is co-edited by the other user in the <em>strict</em> co-editing mode.</p>
        <div class="header-gray">Example</div>
        <pre>
var onCollaborativeChanges = function () {
    console.log("The document changed by collaborative user");
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onCollaborativeChanges": onCollaborativeChanges,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onDocumentReady" class="copy-link">onDocumentReady</b> - the function called when the document is loaded into the document editor.</p>
        <div class="header-gray">Example</div>
        <pre>
var onDocumentReady = function () {
    console.log("Document is loaded");
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onDocumentReady": onDocumentReady,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onDocumentStateChange" class="copy-link">onDocumentStateChange</b> - the function called when the document is modified.
            It is called with the parameter: <em>{"data": true}</em> when the current user is editing the document and with the parameter: <em>{"data" : false}</em> when the current user's changes are sent to the <b>document editing service</b>.
        </p>
        <div class="header-gray">Example</div>
        <pre>
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
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onDownloadAs" class="copy-link">onDownloadAs</b> - the function called with the absolute URL to the edited file when the <a href="<%= Url.Action("methods") %>#downloadAs">downloadAs</a> method is being called.
            The absolute URL to the document to be downloaded and its type are sent in the <em>data</em> parameter.
        </p>
        <div class="header-gray">Example</div>
        <pre>
var onDownloadAs = function (event) {
    var fileType = event.data.fileType;
    var url = event.data.url;
    console.log("ONLYOFFICE Document Editor create file: " + url);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onDownloadAs": onDownloadAs,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onError" class="copy-link">onError</b> - the function called when an error or some other specific event occurs.
            The error message is sent in the <em>data</em> parameter. A list of error codes can be found <a href="https://github.com/ONLYOFFICE/sdkjs/blob/master/common/errorCodes.js" target="_blank">here</a>.
        </p>
        <div class="header-gray">Example</div>
        <pre>
var onError = function (event) {
    console.log("ONLYOFFICE Document Editor reports an error: code " + event.data.errorCode + ", description " + event.data.errorDescription);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onError": onError,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onInfo" class="copy-link">onInfo</b> - the function called when the application opened the file.
            The mode is sent in the <em>data.mode</em> parameter.
            Can be <b>view</b> or <b>edit</b>.
        </p>
        <div class="header-gray">Example</div>
        <pre>
var onInfo = function (event) {
    console.log("ONLYOFFICE Document Editor is opened in mode " + event.data.mode);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onInfo": onInfo,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onMetaChange" class="copy-link">onMetaChange</b> - the function called when the meta information of the document is changed via the <a href="<%= Url.Action("command/meta") %>">meta</a> command.</p>
        <p>The name of the document is sent in the <em>data.title</em> parameter. The <em>Favorite</em> icon highlighting state is sent in the <em>data.favorite</em> parameter.</p>
        <p>When the user clicks the <em>Favorite</em> icon, the <a href="<%= Url.Action("methods") %>#setFavorite">setFavorite</a> method is called to update the <a href="<%= Url.Action("config/document/info") %>#favorite">information</a> about the <em>Favorite</em> icon highlighting state.
            If the method is not declared, the <em>Favorite</em> icon will not be changed.</p>
        <div class="header-gray">Example</div>
        <pre>
var onMetaChange = function (event) {
    var title = event.data.title;
    var favorite = event.data.favorite;
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onMetaChange": onMetaChange,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onMakeActionLink" class="copy-link">onMakeActionLink</b> - the function called when the user is trying to get link for opening the document which contains a bookmark, scrolling to the bookmark position.</p>
        <p>To set the bookmark link, you must call the <a href="<%= Url.Action("methods") %>#setActionLink">setActionLink</a> method.
            The bookmark data is received in the <em>data</em> parameter and must be then used in the configuration as the value for the <a href="<%= Url.Action("config/editor") %>#actionLink">editorConfig.actionLink</a> parameter.
            If the method is not declared the <em>Get Link</em> button will not be displayed.</p>
        <img class="screenshot" alt="onMakeActionLink" src="<%= Url.Content("~/content/img/editor/onMakeActionLink.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onMakeActionLink = function (event){
    var ACTION_DATA = event.data;
    ...
    var link = GENERATE_LINK(ACTION_DATA);
    docEditor.setActionLink(link);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onMakeActionLink": onMakeActionLink,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onOutdatedVersion" class="copy-link">onOutdatedVersion</b> - the function called after the <a href="<%= Url.Action("troubleshooting") %>#key">error</a> is shown, when the document is opened for editing with the old <a href="<%= Url.Action("config/document") %>#key">document.key</a> value, which was used to edit the previous document version and was successfully saved.
            When this event is called the editor must be reinitialized with a new <em>document.key</em>.
        </p>
        <div class="header-gray">Example</div>
        <pre>
var onOutdatedVersion = function () {
    location.reload(true);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onOutdatedVersion": onOutdatedVersion,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onPluginsReady" class="copy-link">onPluginsReady</b> - the function called when all plugins are loaded and can be used.
        </p>
        <div class="header-gray">Example</div>
        <pre>
var onPluginsReady = function () {
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onPluginsReady": onPluginsReady,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onReady" class="copy-link">onReady</b> - the function called when the application is loaded into the browser.
            Deprecated since version 5.0, please use <a href="#onAppReady">onAppReady</a> instead
        </p>
    </li>

    <li>
        <p><b id="onRequestClose" class="copy-link">onRequestClose</b> - the function called when the work with the editor must be ended and the editor must be closed.</p>
        <div class="header-gray">Example</div>
        <pre>
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
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onRequestCompareFile" class="copy-link">onRequestCompareFile<span class="required">*</span></b> - the function called when the user is trying to select document for comparing by clicking the <em>Document from Storage</em> button.</p>
        <p>To select a document for comparing, you must call the <a href="<%= Url.Action("methods") %>#setRevisedFile">setRevisedFile</a> method.
            When calling this method, the token must be added to validate the parameters.
            If the method is not declared the <em>Document from Storage</em> button will not be displayed.
            <span class="required-descr"><span class="required">*</span><em> - available only for ONLYOFFICE Enterprise Edition and ONLYOFFICE Developer Edition</em></span></p>
        <img class="screenshot" alt="onRequestCompareFile" src="<%= Url.Content("~/content/img/editor/onRequestCompareFile.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestCompareFile = function () {
    docEditor.setRevisedFile({
        "fileType": "docx",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8",
        "url": "https://example.com/url-to-example-document.docx"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestCompareFile": onRequestCompareFile,
        ...
    },
    ...
});
</pre>
        Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </li>

    <li>
        <p>
            <b id="onRequestCreateNew" class="copy-link">onRequestCreateNew</b> - the function called when the user is trying to create document by clicking the <em>Create New</em> button.
            This method is used instead of the <a href="<%= Url.Action("config/editor") %>#createUrl">createUrl</a> field.
            If the method is not declared and the <em>createUrl</em> is not specified the <em>Create New</em> button will not be displayed.
        </p>
        <div class="header-gray">Example</div>
        <pre>
var onRequestCreateNew = function () {
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestCreateNew": onRequestCreateNew,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onRequestEditRights" class="copy-link">onRequestEditRights</b> - the function called when the user is trying to switch the document from the viewing into the editing mode by clicking the <em>Edit Document</em> button.
            When the function is called, the editor must be initialized again, in editing mode.
            If the method is not declared the <em>Edit</em> button will not be displayed.
        </p>
        <div class="note">
            <b>onRequestEditRights</b> parameter is obligatory when the <a href="<%= Url.Action("config/editor") %>#mode">editorConfig</a> <em>mode</em> parameter is set to <b>view</b> and the <em>permission</em> to <em>edit</em> the document (<a href="<%= Url.Action("config/document/permissions") %>#edit">document permissions</a>) is set to <b>true</b> so that the user could switch to the editing mode.
        </div>
        <img class="screenshot" alt="onRequestEditRights" src="<%= Url.Content("~/content/img/editor/onRequestEditRights.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestEditRights = function () {
    console.log("ONLYOFFICE Document Editor requests editing rights");
    document.location.reload();
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestEditRights": onRequestEditRights,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onRequestHistory" class="copy-link">onRequestHistory</b> - the function called when the user is trying to show the document version history by clicking the <em>Version History</em> button.</p>
        <p>To show the document version history you must call the <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> method.
            If the method and the <a href="#onRequestHistoryData">onRequestHistoryData</a> method is not declared the <em>Version History</em> button will not be displayed.</p>
        <img class="screenshot" alt="onRequestHistory" src="<%= Url.Content("~/content/img/editor/onRequestHistory.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestHistory = function () {
    docEditor.refreshHistory({
        "currentVersion": 2,
        "history": [
            {
                "changes": changes,
                "created": "2010-07-06 10:13 AM",
                "key": "af86C7e71Ca8",
                "serverVersion": serverVersion,
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
                "user": {
                    "id": "78e1e841",
                    "name": "John Smith"
                },
                "version": 2
            },
            ...
        ]
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestHistory": onRequestHistory,
        ...
    },
    ...
});
</pre>
        <p>Where the <b>changes</b> is the <em>changes</em> from <a href="<%= Url.Action("callback") %>#history">the history object</a> returned after saving the document.</p>
        <p>Where the <b>serverVersion</b> is the <em>serverVersion</em> from <a href="<%= Url.Action("callback") %>#history">the history object</a> returned after saving the document.</p>
    </li>

    <li>
        <p>
            <b id="onRequestHistoryClose" class="copy-link">onRequestHistoryClose</b> - the function called when the user is trying to go back to the document from viewing the document version history by clicking the <em>Close History</em> button.
            When the function is called, the editor must be initialized again, in editing mode.
            If the method is not declared the <em>Close History</em> button will not be displayed.
        </p>
        <img class="screenshot" alt="onRequestHistoryClose" src="<%= Url.Content("~/content/img/editor/onRequestHistoryClose.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestHistoryClose = function () {
    document.location.reload();
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestHistoryClose": onRequestHistoryClose,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onRequestHistoryData" class="copy-link">onRequestHistoryData</b> - the function called when the user is trying to click the specific document version in the document version history.</p>
        <p>The document version number is sent in the <em>data</em> parameter.</p>
        <p>To show the changes corresponding to the specific document version you must call the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method.
            When calling this method, the token must be added to validate the parameters.
            If the method and the <a href="#onRequestHistory">onRequestHistory</a> method is not declared the <em>Version History</em> button will not be displayed.</p>
        <img class="screenshot" alt="onRequestHistoryData" src="<%= Url.Content("~/content/img/editor/onRequestHistoryData.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
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
        ...
    },
    ...
});
</pre>
        <p>Where the <b>changesUrl</b> is the <em>changesUrl</em> from <a href="<%= Url.Action("callback") %>#changesurl">the JSON object</a> returned after saving the document.</p>
        <p>
            Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
        </p>
    </li>

    <li>
        <p><b id="onRequestInsertImage" class="copy-link">onRequestInsertImage</b> - the function called when the user is trying to insert an image by clicking the <em>Image from Storage</em> button.</p>
        <p>The type of image insertion is specified in parameter <em>data.c</em>.</p>
        <p>To insert an image into the file you must call the <a href="<%= Url.Action("methods") %>#insertImage">insertImage</a> method with the specified command.
            When calling this method, the token must be added to validate the parameters.
            If the method is not declared the <em>Image from Storage</em> button will not be displayed.</p>
        <img class="screenshot" alt="onRequestInsertImage" src="<%= Url.Content("~/content/img/editor/onRequestInsertImage.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
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
            ...
        ],
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpbWFnZXMiOlt7ImZpbGVUeXBlIjoicG5nIiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1pbWFnZTEucG5nIn0seyJmaWxlVHlwZSI6InBuZyIsInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtaW1hZ2UyLnBuZyJ9XX0.ly1O8-6u4Y7WJlgp9O-bJMeffHe0GtaXzyvY2UUFJTg"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestInsertImage": onRequestInsertImage,
        ...
    },
    ...
});
</pre>
        Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </li>

    <li>
        <p><b id="onRequestMailMergeRecipients" class="copy-link">onRequestMailMergeRecipients</b> - the function called when the user is trying to select recipients data by clicking the <em>Mail merge</em> button.</p>
        <p>To select recipient data, you must call the <a href="<%= Url.Action("methods") %>#setMailMergeRecipients">setMailMergeRecipients</a> method.
            When calling this method, the token must be added to validate the parameters.
            If the method is not declared, the <em>Mail merge</em> button will become faded and unclickable.</p>
        <img class="screenshot" alt="onRequestMailMergeRecipients" src="<%= Url.Content("~/content/img/editor/onRequestMailMergeRecipients.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestMailMergeRecipients = function () {
    docEditor.setMailMergeRecipients({
        "fileType": "xlsx",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXJlY2lwaWVudHMueGxzeCJ9.P3TjOyX1Tv3xAVRAc8qtNb-uFLD6FH_WErag_rbI6nQ",
        "url": "https://example.com/url-to-example-recipients.xlsx"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestMailMergeRecipients": onRequestMailMergeRecipients,
        ...
    },
    ...
});
</pre>
        Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </li>

    <li>
        <p><b id="onRequestReferenceData" class="copy-link">onRequestReferenceData</b> - the function called when the user is trying to refresh data inserted from the external file
            by clicking the <em>Update values</em> button in the <em>External links</em> dialog box of the <em>Data</em> tab.</p>
        <p>An object with the unique file data and the file path or name are sent in the <em>data</em> parameter.</p>
        <p>To refresh data by a link to a file which is specified with the event parameters, you must call the <a href="<%= Url.Action("methods") %>#setReferenceData">setReferenceData</a> method.
            When calling this method, the token must be added to validate the parameters.
            If the event is not declared, the <em>Paste link</em> and <em>Update values</em> buttons will not be displayed.</p>
        <note>To send the data to the <em>setReferenceData</em> method, it is recommended to search for the file by the <em>referenceData</em> parameter first.
        If there is no such a field or a file cannot be found, then the <em>path</em> parameter is used.</note>
        <div class="img-block-2">
            <div>
                <img alt="Paste link" src="<%= Url.Content("~/content/img/editor/paste-link.png") %>" />
            </div>
            <div>
                <img alt="Update values" src="<%= Url.Content("~/content/img/editor/update-values.png") %>" />
            </div>
        </div>
        <div class="header-gray">Example</div>
        <pre>
var onRequestReferenceData = function () {
    var referenceData =  event.data.referenceData;
    var path = event.data.path;
    ...

    docEditor.setReferenceData({
        "fileType": "xlsx",
        "path": "sample.xlsx",
        "referenceData": {
            "fileKey": "BCFA2CED",
            "instanceId": "https://example.com"
        },
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w",
        "url": "https://example.com/url-to-example-document.xlsx"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestReferenceData": onRequestReferenceData,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onRequestRename" class="copy-link">onRequestRename</b> - the function called when the user is trying to rename the file by clicking the <em>Rename...</em> button.
        </p>
        <div class="note">Until version 6.0 the <em>Rename...</em> button is only available if the <a href="<%= Url.Action("config/document/permissions") %>#rename">document.permissions.rename</a> is set to <b>true</b>.</div>
        <img class="screenshot" alt="onRequestRename" src="<%= Url.Content("~/content/img/editor/onRequestRename.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestRename = function (event) {
    var title = event.data;
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestRename": onRequestRename,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onRequestRestore" class="copy-link">onRequestRestore</b> - the function called when the user is trying to restore the file version by clicking the <em>Restore</em> button in the version history.</p>
        <p>The document version number is sent in the <em>data.version</em> parameter if it is called for the document version from the history.
            Additionally, the document link is sent in the <em>data.url</em> parameter if it is called for the document changes from the <a href="<%= Url.Action("callback") %>#history">history object</a>.
            The type of the document which is specified with this link is sent in the <em>data.fileType</em> parameter.</p>
        <p>When the function is called, you must call the <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> method to initialize version history again.
            If the method is not declared the <em>Restore</em> button will not be displayed.</p>
        <div class="note">
            The <em>Restore</em> button is displayed for the previous document versions only and hidden for the current one.
            Until version 5.5 the <em>Restore</em> button is only available if the <a href="<%= Url.Action("config/document/permissions") %>#changeHistory">document.permissions.changeHistory</a> is set to <b>true</b>.
        </div>
        <img class="screenshot" alt="onRequestRestore" src="<%= Url.Content("~/content/img/editor/onRequestRestore.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestRestore = function (event) {
    var fileType = event.data.fileType;
    var url = event.data.url;
    var version = event.data.version;
    ...
    docEditor.refreshHistory({
        "currentVersion": 2,
        "history": [
            {
                "changes": changes,
                "created": "2010-07-06 10:13 AM",
                "key": "af86C7e71Ca8",
                "serverVersion": serverVersion,
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
                "user": {
                    "id": "78e1e841",
                    "name": "John Smith"
                },
                "version": 2
            },
            ...
        ]
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestRestore": onRequestRestore,
        ...
    },
    ...
});
</pre>
        <p>Where the <b>changes</b> is the <em>changes</em> from <a href="<%= Url.Action("callback") %>#history">the history object</a> returned after saving the document.</p>
        <p>Where the <b>serverVersion</b> is the <em>serverVersion</em> from <a href="<%= Url.Action("callback") %>#history">the history object</a> returned after saving the document.</p>
        <p>
            Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
        </p>
    </li>

    <li>
        <p>
            <b id="onRequestSaveAs" class="copy-link">onRequestSaveAs</b> - the function called when the user is trying to save file by clicking <em>Save Copy as...</em> button.
            The title of the document, its type and the absolute URL to the document to be downloaded are sent in the <em>data</em> parameter.
            If the method is not declared the <em>Save Copy as...</em> button will not be displayed.
        </p>
        <img class="screenshot" alt="onRequestSaveAs" src="<%= Url.Content("~/content/img/editor/onRequestSaveAs.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestSaveAs = function (event) {
    var fileType = event.data.fileType;
    var title = event.data.title;
    var url = event.data.url;
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestSaveAs": onRequestSaveAs,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onRequestSendNotify" class="copy-link">onRequestSendNotify</b> - the function called when the user is mentioned in a comment.</p>
        <p>The message and the list of emails is sent in the <em>data</em> parameter.
            The comment data is received in the <em>data.actionLink</em> parameter and must be then used in the configuration as the value for the <a href="<%= Url.Action("config/editor") %>#actionLink">editorConfig.actionLink</a> parameter.</p>
        <p>The list of users to be mentioned should be completed by <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> method.</p>
        <div class="note">
            In version 5.4, <b>onRequestSendNotify</b> event can only be used if <a href="#onRequestUsers">onRequestUsers</a> event is set.
            Starting from version 5.5, there is no such dependency between <b>onRequestSendNotify</b> and <b>onRequestUsers</b> - both can be set independently.
        </div>
        <div class="header-gray">Example</div>
        <pre>
var onRequestSendNotify = function (event) {
    var ACTION_DATA = event.data.actionLink;
    var comment = event.data.message;
    var emails = event.data.emails;
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestSendNotify": onRequestSendNotify,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onRequestSharingSettings" class="copy-link">onRequestSharingSettings</b> - the function called when the user is trying to manage document access rights by clicking <em>Change access rights</em> button.</p>
        <p>When the access rights is changed, you must call the <a href="<%= Url.Action("methods") %>#setSharingSettings">setSharingSettings</a> method to update the <a href="<%= Url.Action("config/document/info") %>#sharingSettings">information</a> about the settings which allow to share the document with other users.
            If the method is not declared the <em>Change access rights</em> button will not be displayed.</p>
        <img class="screenshot" alt="onRequestSharingSettings" src="<%= Url.Content("~/content/img/editor/onRequestSharingSettings.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
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
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestSharingSettings": onRequestSharingSettings,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p><b id="onRequestUsers" class="copy-link">onRequestUsers</b> - the function called when the user can select other users to mention in the comments or grant the access rights to edit the specific sheet ranges.</p>
        <p>Starting from version 7.4, the operation type can be specified in the <em>data.c</em> parameter. It can take two values - <em>mention</em> or <em>protect</em>.
        Prior to version 7.4, only the mention operation was available with this event.</p>
        <p>To set a list of users, you must call the <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> method which can take different lists of users depending on the specified operation type.
            The <em>onRequestUsers</em> event is called once for each <em>c</em> type when the corresponding operation is performed.
            If the <em>setUsers</em> is called with an empty list, then the <em>onRequestUsers</em> event will fire again.</p>
        <div class="img-block-2">
            <div>
                <img class="screenshot" alt="onRequestUsers" src="<%= Url.Content("~/content/img/editor/onRequestUsers.png") %>"/>
            </div>
            <div>
                <img alt="Protect range" src="<%= Url.Content("~/content/img/editor/protect-range.png") %>"/>
            </div>
        </div>
        <div class="header-gray">Example</div>
        <pre>
var onRequestUsers = function (event) {
    docEditor.setUsers({
        "c": event.data.c,
        "users": [
            {
                "email": "john@example.com",
                "id": "78e1e841",
                "name": "John Smith"
            },
            {
                "email": "kate@example.com",
                "id": "F89d8069ba2b",
                "name": "Kate Cage"
            },
            ...
        ]
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestUsers": onRequestUsers,
        ...
    },
    ...
});
</pre>
    </li>

    <li>
        <p>
            <b id="onWarning" class="copy-link">onWarning</b> - the function called when a warning occurs.
            The warning message is sent in the <em>data</em> parameter. A list of error codes can be found <a href="https://github.com/ONLYOFFICE/sdkjs/blob/master/common/errorCodes.js" target="_blank">here</a>.
        </p>
        <div class="header-gray">Example</div>
        <pre>
var onWarning = function (event) {
    console.log("ONLYOFFICE Document Editor reports a warning: code " + event.data.warningCode + ", description " + event.data.warningDescription);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onWarning": onWarning,
        ...
    },
    ...
});
</pre>
    </li>
</ul>
