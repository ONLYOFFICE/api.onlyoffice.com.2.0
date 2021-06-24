<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/") %>"></a>
    <span class="hdr">Events</span>
</h1>

<p class="dscr">The events section allows to change all the functions pertaining to the events.</p>

<nav class="content">
    <ul>
        <li><a href="#onAppReady">onAppReady</a> - the application is loaded into the browser.</li>
        <li><a href="#onCollaborativeChanges">onCollaborativeChanges</a> - the document is co-edited by the other user in the <em>strict</em> co-editing mode.</li>
        <li><a href="#onDocumentReady">onDocumentReady</a> - the document is loaded into the document editor.</li>
        <li><a href="#onDocumentStateChange">onDocumentStateChange</a> - the document is modified.</li>
        <li><a href="#onDownloadAs">onDownloadAs</a> - the absolute URL to the edited file when the <a href="<%= Url.Action("methods") %>#downloadAs">downloadAs</a> method is being called.</li>
        <li><a href="#onError">onError</a> - an error or some other specific event occurs.</li>
        <li><a href="#onInfo">onInfo</a> - the application opened the file.</li>
        <li><a href="#onMetaChange">onMetaChange</a> - the meta information of the document is changed via the <a href="<%= Url.Action("command") %>#meta">meta</a> command.</li>
        <li><a href="#onMakeActionLink">onMakeActionLink</a> - the user is trying to get link for opening the document which contains a bookmark, scrolling to the bookmark position.</li>
        <li><a href="#onOutdatedVersion">onOutdatedVersion</a> - the document is opened for editing with the old <a href="<%= Url.Action("config/document") %>#key">document.key</a> value, which was used to edit the previous document version and was successfully saved.</li>
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
        <li><a href="#onRequestRename">onRequestRename</a> - the user is trying to rename the file by clicking the <em>Rename...</em> button.</li>
        <li><a href="#onRequestRestore">onRequestRestore</a> - the user is trying to restore the file version by clicking the <em>Restore</em> button in the version history.</li>
        <li><a href="#onRequestSaveAs">onRequestSaveAs</a> - the user is trying to save file by clicking <em>Save Copy as...</em> button.</li>
        <li><a href="#onRequestSendNotify">onRequestSendNotify</a> - the user is mentioned in a comment.</li>
        <li><a href="#onRequestSharingSettings">onRequestSharingSettings</a> - the user is trying to manage document access rights by clicking <em>Change access rights</em> button.</li>
        <li><a href="#onRequestUsers">onRequestUsers</a> - the commenter can select other users for mention in the comments.</li>
        <li><a href="#onWarning">onWarning</a> - a warning occurs.</li>
    </ul>
</nav>

<h2>Events and their description:</h2>
<ul>
    <li>
        <p><b id="onAppReady" class="copy-link">onAppReady</b> - the function called when the application is loaded into the browser.</p>
        <div class="header-gray">Example</div>
        <pre>
var onAppReady = function() {
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
var onDocumentReady = function() {
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
            The absolute URL to the document to be downloaded is sent in the <em>data</em> parameter.
        </p>
        <div class="header-gray">Example</div>
        <pre>
var onDownloadAs = function (event) {
    console.log("ONLYOFFICE Document Editor create file: " + event.data);
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
            The error message is sent in the <em>data</em> parameter.
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
        <p>
            <b id="onMetaChange" class="copy-link">onMetaChange</b> - the function called when the meta information of the document is changed via the <a href="<%= Url.Action("command") %>#meta">meta</a> command.
            The name of the document is sent in the <em>data.title</em> parameter.
            The <em>Favorite</em> icon highlighting state is sent in the <em>data.favorite</em> parameter.
            When the user clicks the <em>Favorite</em> icon, the <a href="<%= Url.Action("methods") %>#setFavorite">setFavorite</a> method is called to update the <a href="<%= Url.Action("config/document/info") %>#favorite">information</a> about the <em>Favorite</em> icon highlighting state.
            If the method is not declared, the <em>Favorite</em> icon will not be changed.
        </p>
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
        <p>
            <b id="onMakeActionLink" class="copy-link">onMakeActionLink</b> - the function called when the user is trying to get link for opening the document which contains a bookmark, scrolling to the bookmark position.
            To set the bookmark link you must call the <a href="<%= Url.Action("methods") %>#setActionLink">setActionLink</a> method.
            The bookmark data is received in the <em>data</em> parameter and must be then used in the configuration as the value for the <a href="<%= Url.Action("config/editor") %>#actionLink">editorConfig.actionLink</a> parameter.
            If the method is not declared the <em>Get Link</em> button will not be displayed.
        </p>
        <img alt="onMakeActionLink" src="<%= Url.Content("~/content/img/editor/onMakeActionLink.png") %>"/>
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
        <p>
            <b id="onRequestCompareFile" class="copy-link">onRequestCompareFile<span class="required">*</span></b> - the function called when the user is trying to select document for comparing by clicking the <em>Document from Storage</em> button.
            To select a document for comparing you must call the <a href="<%= Url.Action("methods") %>#setRevisedFile">setRevisedFile</a> method.
            If the method is not declared the <em>Document from Storage</em> button will not be displayed.
            <span class="required-descr"><span class="required">*</span><em> - available only for ONLYOFFICE Enterprise Edition and ONLYOFFICE Developer Edition</em></span>
        </p>
        <img alt="onRequestCompareFile" src="<%= Url.Content("~/content/img/editor/onRequestCompareFile.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestCompareFile = function() {
    docEditor.setRevisedFile({
        "fileType": "docx",
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
var onRequestCreateNew = function() {
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
        <img alt="onRequestEditRights" src="<%= Url.Content("~/content/img/editor/onRequestEditRights.png") %>"/>
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
        <p>
            <b id="onRequestHistory" class="copy-link">onRequestHistory</b> - the function called when the user is trying to show the document version history by clicking the <em>Version History</em> button.
            To show the document version history you must call the <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> method.
            If the method and the <a href="#onRequestHistoryData">onRequestHistoryData</a> method is not declared the <em>Version History</em> button will not be displayed.
        </p>
        <img alt="onRequestHistory" src="<%= Url.Content("~/content/img/editor/onRequestHistory.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestHistory = function() {
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
            <b id="onRequestHistoryClose" class="copy-link">onRequestHistoryClose</b> - the function called when the user is trying to go back to the document from viewing the document version history  by clicking the <em>Close History</em> button.
            When the function is called, the editor must be initialized again, in editing mode.
            If the method is not declared the <em>Close History</em> button will not be displayed.
        </p>
        <img alt="onRequestHistoryClose" src="<%= Url.Content("~/content/img/editor/onRequestHistoryClose.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestHistoryClose = function() {
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
        <p>
            <b id="onRequestHistoryData" class="copy-link">onRequestHistoryData</b> - the function called when the user is trying to click the specific document version in the document version history.
            To show the changes corresponding to the specific document version you must call the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method.
            The document version number is sent in the <em>data</em> parameter.
            If the method and the <a href="#onRequestHistory">onRequestHistory</a> method is not declared the <em>Version History</em> button will not be displayed.
        </p>
        <img alt="onRequestHistoryData" src="<%= Url.Content("~/content/img/editor/onRequestHistoryData.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestHistoryData = function(event) {
    var version = event.data;
    docEditor.setHistoryData({
        "changesUrl": "https://example.com/url-to-changes.zip",
        "key": "Khirz6zTPdfd7",
        "previous": {
            "key": "af86C7e71Ca8",
            "url": "https://example.com/url-to-the-previous-version-of-the-document.docx"
        },
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
        <p>
            <b id="onRequestInsertImage" class="copy-link">onRequestInsertImage</b> - the function called when the user is trying to insert an image by clicking the <em>Image from Storage</em> button.
            The type of image insertion is specified in parameter <em>data.c</em>.
            To insert an image into the file you must call the <a href="<%= Url.Action("methods") %>#insertImage">insertImage</a> method with the specified command.
            If the method is not declared the <em>Image from Storage</em> button will not be displayed.
        </p>
        <img alt="onRequestInsertImage" src="<%= Url.Content("~/content/img/editor/onRequestInsertImage.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestInsertImage = function(event) {
    docEditor.insertImage({
        "c": event.data.c,
        "fileType": "png",
        "url": "https://example.com/url-to-example-image.png"
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
        <p>
            <b id="onRequestMailMergeRecipients" class="copy-link">onRequestMailMergeRecipients</b> - the function called when the user is trying to select recipients data by clicking the <em>Mail merge</em> button.
            To select recipient data you must call the <a href="<%= Url.Action("methods") %>#setMailMergeRecipients">setMailMergeRecipients</a> method.
            If the method is not declared the <em>Mail merge</em> button will not be displayed.
        </p>
        <img alt="onRequestMailMergeRecipients" src="<%= Url.Content("~/content/img/editor/onRequestMailMergeRecipients.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestMailMergeRecipients = function() {
    docEditor.setMailMergeRecipients({
        "fileType": "xlsx",
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
        <p>
            <b id="onRequestRename" class="copy-link">onRequestRename</b> - the function called when the user is trying to rename the file by clicking the <em>Rename...</em> button.
        </p>
        <div class="note">Until version 6.0 the <em>Rename...</em> button is only available if the <a href="<%= Url.Action("config/document/permissions") %>#rename">document.permissions.rename</a> is set to <b>true</b>.</div>
        <img alt="onRequestRename" src="<%= Url.Content("~/content/img/editor/onRequestRename.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestRename = function(event) {
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
        <p>
            <b id="onRequestRestore" class="copy-link">onRequestRestore</b> - the function called when the user is trying to restore the file version by clicking the <em>Restore</em> button in the version history.
            When the function is called, you must call the <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> method to initialize version history again.
            The document version number is sent in the <em>data.version</em> parameter if it is called for the document version from the history.
            Additionally, the document link is sent in the <em>data.url</em> parameter if it is called for the document changes from the <a href="<%= Url.Action("callback") %>#history">history object</a>.
            If the method is not declared the <em>Restore</em> button will not be displayed.
        </p>
        <div class="note">
            The <em>Restore</em> button is displayed for the previous document versions only and hidden for the current one.
            Until version 5.5 the <em>Restore</em> button is only available if the <a href="<%= Url.Action("config/document/permissions") %>#changeHistory">document.permissions.changeHistory</a> is set to <b>true</b>.
        </div>
        <img alt="onRequestRestore" src="<%= Url.Content("~/content/img/editor/onRequestRestore.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestRestore = function(event) {
    var url = event.data.url;
    var version = event.data.version;
    ...
    docEditor.refreshHistory({
        "currentVersion": 2,
        "history": [
            {
                "changes": changes, //the <em>changes</em> from <a href="<%= Url.Action("callback") %>#history">the history object</a> returned after saving the document
                "created": "2010-07-06 10:13 AM",
                "key": "af86C7e71Ca8",
                "serverVersion": serverVersion, //the <em>serverVersion</em> from <a href="<%= Url.Action("callback") %>#history">the history object</a> returned after saving the document
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
        "onRequestHistoryData": onRequestHistoryData,
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
            The title of the document and the absolute URL to the document to be downloaded is sent in the <em>data</em> parameter.
            If the method is not declared the <em>Save Copy as...</em> button will not be displayed.
        </p>
        <img alt="onRequestSaveAs" src="<%= Url.Content("~/content/img/editor/onRequestSaveAs.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestSaveAs = function(event) {
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
        <p>
            <b id="onRequestSendNotify" class="copy-link">onRequestSendNotify</b> - the function called when the user is mentioned in a comment.
            The list of users to be mentioned should be completed by <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> method.
            The message and the list of emails is sent in the <em>data</em> parameter.
            The comment data is received in the <em>data.actionLink</em> parameter and must be then used in the configuration as the value for the <a href="<%= Url.Action("config/editor") %>#actionLink">editorConfig.actionLink</a> parameter.
        </p>
        <div class="note">
            In version 5.4, <b>onRequestSendNotify</b> event can only be used if <a href="#onRequestUsers">onRequestUsers</a> event is set.
            Starting from version 5.5, there is no such dependency between <b>onRequestSendNotify</b> and <b>onRequestUsers</b> - both can be set independently.
        </div>
        <div class="header-gray">Example</div>
        <pre>
var onRequestSendNotify = function(event) {
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
        <p>
            <b id="onRequestSharingSettings" class="copy-link">onRequestSharingSettings</b> - the function called when the user is trying to manage document access rights by clicking <em>Change access rights</em> button.
            When the access rights is changed, you must call the <a href="<%= Url.Action("methods") %>#setSharingSettings">setSharingSettings</a> method to update the <a href="<%= Url.Action("config/document/info") %>#sharingSettings">information</a> about the settings which allow to share the document with other users.
            If the method is not declared the <em>Change access rights</em> button will not be displayed.
        </p>
        <img alt="onRequestSharingSettings" src="<%= Url.Content("~/content/img/editor/onRequestSharingSettings.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestSharingSettings = function() {
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
        <p>
            <b id="onRequestUsers" class="copy-link">onRequestUsers</b> - the function called when the commenter can select other users for mention in the comments.
            To set the users list you must call the <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> method.
        </p>
        <img alt="onRequestUsers" src="<%= Url.Content("~/content/img/editor/onRequestUsers.png") %>"/>
        <div class="header-gray">Example</div>
        <pre>
var onRequestUsers = function() {
    docEditor.setUsers({
        "users": [
            {
                "email": "john@example.com",
                "name": "John Smith"
            },
            {
                "email": "kate@example.com",
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
            The warning message is sent in the <em>data</em> parameter.
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
