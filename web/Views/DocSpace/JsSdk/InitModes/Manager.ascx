<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("jssdk/initmodes") %>"></a>
    <span class="hdr">Manager</span>
</h1>

<p class="dscr">Displays a list of entities depending on the specified <a href="<%= Url.Action("jssdk/config") %>#rootPath">rootPath</a>.
It allows you to create rooms, folders, and files and work with them.</p>
<img alt="Manager mode" class="screenshot" src="<%= Url.Content("~/content/img/docspace/manager-mode.png") %>" />

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
            <td><a href="<%= Url.Action("jssdk/methods") %>#initManager">initManager</a></td>
            <td>Initializes the SDK frame in the "manager" mode.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
<pre>
var docSpace = DocSpace.SDK.initManager({config});
</pre>
