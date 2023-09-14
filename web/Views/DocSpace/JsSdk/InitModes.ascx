<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Initialization modes</span>
</h1>

<p><em>api.js</em> allows you to initialize the SDK in the following modes:</p>
<ul>
    <li><a href="<%= Url.Action("jssdk/initmodes/manager") %>">manager</a> - displays a list of entities depending on the specified <em>rootPath</em>;</li>
    <li><a href="<%= Url.Action("jssdk/initmodes/roomselector") %>">room-selector</a> - opens the room selector;</li>
    <li><a href="<%= Url.Action("jssdk/initmodes/fileselector") %>">file-selector</a> - opens the file selector;</li>
    <li><a href="<%= Url.Action("jssdk/initmodes/editor") %>">editor</a> - allows you to open the SDK as a document editor for editing by specifying the <em>id</em> parameter for a file;</li>
    <li><a href="<%= Url.Action("jssdk/initmodes/viewer") %>">viewer</a> - allows you to open the SDK as a document editor for viewing by specifying the <em>id</em> parameter for a file;</li>
    <li><a href="<%= Url.Action("jssdk/initmodes/system") %>">system</a> - calls the system methods.</li>
</ul>

<p>To simplify working with modes, the SDK has methods that do not require you to specify the appropriate mode:</p>
<div class="header-gray">DocSpace.SDK</div>
<table class="table hover">
    <colgroup>
        <col class="table-name" />
        <col />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("jssdk/methods") %>#initManager">initManager</a></td>
            <td>Initializes the SDK frame in the "manager" mode.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("jssdk/methods") %>#initRoomSelector">initRoomSelector</a></td>
            <td>Initializes the SDK frame in the "room-selector" mode.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("jssdk/methods") %>#initFileSelector">initFileSelector</a></td>
            <td>Initializes the SDK frame in the "file-selector" mode.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("jssdk/methods") %>#initEditor">initEditor</a></td>
            <td>Initializes the SDK frame in the "editor" mode.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("jssdk/methods") %>#initViewer">initViewer</a></td>
            <td>Initializes the SDK frame in the "viewer" mode.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("jssdk/methods") %>#initSystem">initSystem</a></td>
            <td>Initializes the SDK frame in the "system" mode.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
