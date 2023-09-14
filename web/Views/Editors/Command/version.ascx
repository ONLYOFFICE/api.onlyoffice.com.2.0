<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("command/") %>"></a>
    <span class="hdr">version</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Requests the current version number of Document Server.</p>

<div class="header-gray">Request example</div>
<pre>
{
    "c": "version"
}
</pre>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Presence</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>c</td>
            <td>Defines the command type.</td>
            <td>string</td>
            <td>required</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Response example</div>

<pre>
{
    "error": 0,
    "version": "4.3.1.4"
}
</pre>

<div class="header-gray">Parameters</div>
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
            <td>error</td>
            <td>Defines an error code.</td>
            <td>integer</td>
            <td>required</td>
        </tr>
        <tr class="tablerow">
            <td>version</td>
            <td>Defines the document version.</td>
            <td>string</td>
            <td>required</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>