<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("command/") %>"></a>
    <span class="hdr">drop</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Disconnects the users with the identifiers specified in the <em>users</em> parameter from the <b>document editing service</b>. These users will be able to view the document, but will not be allowed to make changes to it.</p>

<div class="header-gray">Request example</div>
<pre>
{
    "c": "drop",
    "key": "Khirz6zTPdfd7",
    "users": [ "6d5a81d0" ]
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
            <td>c</td>
            <td>Defines the command type.</td>
            <td>string</td>
            <td>required</td>
        </tr>
        <tr class="tablerow">
            <td>key</td>
            <td>Defines the document identifier used to unambiguously identify the document file.</td>
            <td>string</td>
            <td>required</td>
        </tr>
        <tr class="tablerow">
            <td>users</td>
            <td>Defines the list of the user identifiers.</td>
            <td>array of strings</td>
            <td>required</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Response example</div>

<pre>
{
    "error": 0,
    "key": "Khirz6zTPdfd7"
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
            <td>key</td>
            <td>Defines the document identifier used to unambiguously identify the document file.</td>
            <td>string</td>
            <td>required</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
