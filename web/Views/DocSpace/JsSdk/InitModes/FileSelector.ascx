<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("jssdk/initmodes") %>"></a>
    <span class="hdr">File-selector</span>
</h1>

<p class="dscr">Opens the file selector and allows you to select a file from a list of available files.</p>
<img alt="File-selector mode" class="screenshot" src="<%= Url.Content("~/content/img/docspace/file-selector-mode.png") %>" />

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
            <td><a href="<%= Url.Action("jssdk/methods") %>#initFileSelector">initFileSelector</a></td>
            <td>Initializes the SDK frame in the "file-selector" mode.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
<pre>
var docSpace = DocSpace.SDK.initFileSelector({config});
</pre>
