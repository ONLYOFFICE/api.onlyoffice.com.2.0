<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("apisystem/portalsection") %>"></a>
    <span class="hdr">PUT /api/portal/status</span>
    <span class="comment">This function requires authentication</span>
</h1>

<div id="methodDesc" class="header-gray">Description</div>
<p class="dscr">Changes a portal activation status with a value specified in the request.</p>

<div id="methodParams" class="header-gray">Parameters</div>
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
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>portalName<span class="required">*</span>
                <div class="infotext">sent in Body</div>
            </td>
            <td>Portal name</td>
            <td>string</td>
            <td>"example"</td>
        </tr>
        <tr class="tablerow">
            <td>status<span class="required">*</span>
                <div class="infotext">sent in Query</div>
            </td>
            <td>New portal status: <b>Active</b> - 0, <b>Suspended</b> - 1</td>
            <td>string</td>
            <td>"Suspended"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
<span class="required-descr"><span class="required">*</span><em> - required field</em></span>

<div id="methodReturns" class="header-gray">Returns</div>
<p>The portal description</p>

<div id="methodResponse" class="header-gray">Example Response</div>
<pre>
{
    "tenant": {
        "created": "2010-07-07T15:46:00",
        "domain": "example.com",
        "language": "en-US",
        "ownerId": "78e1e841-8314-48465-8fc0-e7d6451b6475",
        "portalName": "example",
        "status": "Suspended",
        "tenantId": 1,
        "timeZoneName": "UTC"
    }
}
</pre>
