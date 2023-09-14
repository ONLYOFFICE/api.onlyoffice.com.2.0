<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("jssdk/initmodes") %>"></a>
    <span class="hdr">Editor</span>
</h1>

<p class="dscr">Allows you to open the SDK as a document editor for editing by specifying the <a href="<%= Url.Action("jssdk/config") %>#id">id</a> parameter for a file.</p>
<img alt="Editor mode" class="screenshot" src="<%= Url.Content("~/content/img/docspace/editor-mode.png") %>" />

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
            <td><a href="<%= Url.Action("jssdk/methods") %>#initEditor">initEditor</a></td>
            <td>Initializes the SDK frame in the "editor" mode.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
<pre>
var docSpace = DocSpace.SDK.initEditor({config});
</pre>
