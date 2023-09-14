<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Command service</span>
</h1>

<p class="dscr">
    For the interaction with the <b>document command service</b> the POST requests are used.
    The request parameters are entered in JSON format in the request body.
    The requests are sent to the <span class="fakelink">https://documentserver/coauthoring/CommandService.ashx</span> address where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.
</p>

<div class="note">In <b>ONLYOFFICE Document Server</b> prior to version 4.2 the GET request with the parameters in the <em>QueryString</em> were used.</div>

<p>See the available command types below to find more about them.</p>

<div class="header-gray">Command types</div>

<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Command</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("command/drop") %>">drop</a></td>
            <td>This command allows to disconnect the specified users from the document editing service.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("command/forcesave") %>">forcesave</a></td>
            <td>This command allows to forcibly save the document being edited without closing it.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("command/info") %>">info</a></td>
            <td>This command allows to request a document status and the list of the identifiers of the users who opened the document for editing.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("command/license") %>">license</a></td>
            <td>This command allows to request the license from Document Server with information about the server and user quota.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("command/meta") %>">meta</a></td>
            <td>This command allows to update the meta information of the document for all collaborative editors.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("command/version") %>">version</a></td>
            <td>This command allows to request the current version number of Document Server.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<p>The JSON Web Token should be sent in the JSON object format to <b>document command service</b>. It is used to receive the status of the document with the key specified.</p>

<pre>
{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjIjoiaW5mbyIsImtleSI6IktoaXJ6NnpUUGRmZDcifQ.r_6sThjFABsHMNHhkVdHDSz4jwkbXRQNYdvawkBGJgg"
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
            <td>token</td>
            <td>Defines the encrypted signature added to the <b>Document Server</b> config in the form of a <a href="<%= Url.Action("signature/body") %>#command">token</a>.</td>
            <td>string</td>
            <td>required by configuration</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<p>The <b>document editing service</b> informs the <b>document storage service</b> about the result caused by command and sends the response with all the necessary data via the <a href="<%= Url.Action("callback") %>">callback handler</a>.</p>

<div class="header-gray">Possible error codes and their description</div>
<table class="error-table">
    <colgroup>
        <col class="table-name" />
        <col />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Error code</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>0</td>
            <td>No errors.</td>
        </tr>
        <tr class="tablerow">
            <td>1</td>
            <td>Document key is missing or no document with such key could be found.</td>
        </tr>
        <tr class="tablerow">
            <td>2</td>
            <td>Callback url not correct.</td>
        </tr>
        <tr class="tablerow">
            <td>3</td>
            <td>Internal server error.</td>
        </tr>
        <tr class="tablerow">
            <td>4</td>
            <td>No changes were applied to the document before the <b>forcesave</b> command was received.</td>
        </tr>
        <tr class="tablerow">
            <td>5</td>
            <td>Command not correct.</td>
        </tr>
        <tr class="tablerow">
            <td>6</td>
            <td>Invalid token.</td>
        </tr>
        <%--<tr class="tablerow">
            <td>7</td>
            <td>Token signature is expired.</td>
        </tr>--%>
    </tbody>
</table>
