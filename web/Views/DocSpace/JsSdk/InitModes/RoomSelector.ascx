<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("jssdk/initmodes") %>"></a>
    <span class="hdr">Room-selector</span>
</h1>

<p class="dscr">Opens the room selector and allows you to select a room from a list of the available rooms.</p>
<img alt="Room-selector mode" class="screenshot" src="<%= Url.Content("~/content/img/docspace/room-selector-mode.png") %>" />

<div class="header-gray">Method</div>
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
            <td><a href="<%= Url.Action("jssdk/methods") %>#initRoomSelector">initRoomSelector</a></td>
            <td>Initializes the SDK frame in the "room-selector" mode.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
<pre>
var docSpace = DocSpace.SDK.initRoomSelector({config});
</pre>
