<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("jssdk/initmodes") %>"></a>
    <span class="hdr">System</span>
</h1>

<p class="dscr">Displays a blank page with the loader. It allows you to call system methods.</p>

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
            <td><a href="<%= Url.Action("jssdk/methods") %>#initSystem">initSystem</a></td>
            <td>Initializes the SDK frame in the "system" mode.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
<pre>
var docSpace = DocSpace.SDK.initSystem({config});
</pre>
