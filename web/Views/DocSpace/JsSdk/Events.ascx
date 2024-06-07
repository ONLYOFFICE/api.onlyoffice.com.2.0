<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Events</span>
</h1>

<p class="dscr">When initializing the SDK frame, a number of events can be passed to the configuration, which will be executed at the appropriate moment:</p>

<ul class="columns-4" style="list-style: none;">
    <li><a href="#onAppError">onAppError</a></li>
    <li><a href="#onAppReady">onAppReady</a></li>
    <li><a href="#onAuthSuccess">onAuthSuccess</a></li>
    <li><a href="#onCloseCallback">onCloseCallback</a></li>
    <li><a href="#onDownload">onDownload</a></li>
    <li><a href="#onEditorCloseCallback">onEditorCloseCallback</a></li>
    <li><a href="#onSelectCallback">onSelectCallback</a></li>
</ul>

<h2>Events and their description:</h2>
<ul>
    <li>
        <p>
            <b id="onAppError" class="copy-link">onAppError</b> - the function called when SDK is initialized with an error. This error is returned during the initialization.
        </p>
        <div id="methodExample" class="header-gray">Example</div>
        <pre>
var onAppError = function () {
    console.log("ONLYOFFICE DocSpace reports an error");
};

var docSpace = DocSpace.SDK.initManager({
    "events": {
        "onAppError": onAppError,
        ...
    },
    ...
});
</pre>
    </li>
    <li>
        <p>
            <b id="onAppReady" class="copy-link">onAppReady</b> - the function called when SDK is initialized successfully.
        </p>
        <div id="methodExample" class="header-gray">Example</div>
        <pre>
var onAppReady = function () {
    console.log("ONLYOFFICE DocSpace is ready");
};

var docSpace = DocSpace.SDK.initManager({
    "events": {
        "onAppReady": onAppReady,
        ...
    },
    ...
});
</pre>
    </li>
    <li>
        <p>
            <b id="onAuthSuccess" class="copy-link">onAuthSuccess</b> - the function called upon successful authorization.
        </p>
        <div id="methodExample" class="header-gray">Example</div>
        <pre>
var onAuthSuccess = function () {
    console.log("The authorization is successful.");
};

var docSpace = DocSpace.SDK.initManager({
    "events": {
        "onAuthSuccess ": onAuthSuccess,
        ...
    },
    ...
});
</pre>
    </li>
    <li>
        <p>
            <b id="onCloseCallback" class="copy-link">onCloseCallback</b> - the function called only in the <a href="<%= Url.Action("jssdk/initmodes/roomselector") %>">room-selector</a>
            and <a href="<%= Url.Action("jssdk/initmodes/fileselector") %>">file-selector</a> modes when the room or file selector is closed or the selection is canceled.
        </p>
        <div id="methodExample" class="header-gray">Example</div>
        <pre>
var onCloseCallback = function () {
    console.log("The room selector is closed.");
};

var docSpace = DocSpace.SDK.initRoomSelector({
    "events": {
        "onCloseCallback": onCloseCallback,
        ...
    },
    ...
});
</pre>
    </li>
    <li>
        <p>
            <b id="onDownload" class="copy-link">onDownload</b> - the function called when firing events to download items from the manager.
            It returns a link to the download object. This event is called only when the <a href="<%= Url.Action("jssdk/config") %>#downloadToEvent">downloadToEvent</a> parameter is specified in the config.
        </p>
        <div id="methodExample" class="header-gray">Example</div>
        <pre>
var onDownload = function () {
    console.log("The 'New document' file has been downloaded.");
};

var docSpace = DocSpace.SDK.initManager({
    "events": {
        "onDownload": onDownload,
        ...
    },
    ...
});
</pre>
    </li>
    <li>
        <p>
            <b id="onEditorCloseCallback" class="copy-link">onEditorCloseCallback</b> - the function called when the document editor is closed.
        </p>
        <div id="methodExample" class="header-gray">Example</div>
        <pre>
var onEditorCloseCallback = function () {
    console.log("The document editor is closed.");
};

var docSpace = DocSpace.SDK.initEditor({
    "events": {
        "onEditorCloseCallback": onEditorCloseCallback,
        ...
    },
    ...
});
</pre>
    </li>
    <li>
        <p>
            <b id="onSelectCallback" class="copy-link">onSelectCallback</b> - the function called only in the <a href="<%= Url.Action("jssdk/initmodes/roomselector") %>">room-selector</a>
            and <a href="<%= Url.Action("jssdk/initmodes/fileselector") %>">file-selector</a> modes when a room or file is selected.
        </p>
        <div id="methodExample" class="header-gray">Example</div>
        <pre>
var onSelectCallback = function () {
    console.log("The 'New room' room was selected.");
};

var docSpace = DocSpace.SDK.initRoomSelector({
    "events": {
        "onSelectCallback": onSelectCallback,
        ...
    },
    ...
});
</pre>
        <p>The information about the selected item is returned:</p>
        <pre>
{
    "icon": "https://example.com/url-to-example-image.svg",
    "id": 34,
    "isSelected": false,
    "label": "roomName"
}
</pre>
        <p>where <b>example.com</b> is the name of the server with the ONLYOFFICE DocSpace installed.</p>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>icon</td>
                    <td>Defines the URL to the room/file icon.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>id</td>
                    <td>Defines the room/file ID.</td>
                    <td>integer</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>isSelected</td>
                    <td>Specifies whether the current room/file is selected.</td>
                    <td>boolean</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>label</td>
                    <td>Defines the room/file label.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
                </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="onSignOut" class="copy-link">onSignOut</b> - the function called when logging out of the user account.
        </p>
        <div id="methodExample" class="header-gray">Example</div>
        <pre>
var onSignOut = function () {
    console.log("The user is logging out of the DocSpace account.");
};

var docSpace = DocSpace.SDK.initManager({
    "events": {
        "onSignOut ": onSignOut,
        ...
    },
    ...
});
</pre>
    </li>
</ul>
