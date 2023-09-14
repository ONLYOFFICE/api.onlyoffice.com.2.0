<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("command/") %>"></a>
    <span class="hdr">info</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Requests a document status and the list of the identifiers of the users who opened the document for editing. 
The response will be sent to the <a href="<%= Url.Action("callback") %>">callback handler</a>.</p>

<div class="header-gray">Request example</div>
<pre>
{
    "c": "info",
    "key": "Khirz6zTPdfd7",
    "userdata": "sample userdata"
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
            <td>userdata</td>
            <td>Defines some custom identifier which will help distinguish the specific request in case there were more than one.</td>
            <td>string</td>
            <td>optional</td>
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
