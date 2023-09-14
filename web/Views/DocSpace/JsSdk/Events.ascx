<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Events</span>
</h1>

<p class="dscr">When initializing the SDK frame, a number of events can be passed to the configuration, which will be executed at the appropriate moment:</p>

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
        "onAppError": null,
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
        "onAppReady": null,
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
        "onCloseCallback": null,
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
        "onSelectCallback": null,
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
</ul>
