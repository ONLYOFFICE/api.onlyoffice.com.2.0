<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("apisystem/tariffsection") %>"></a>
    <span class="hdr">GET /api/tariff/get</span>
    <span class="comment">This function requires authentication</span>
</h1>

<div id="methodDesc" class="header-gray">Description</div>
<p class="dscr">Returns a pricing plan of a portal with a name specified in the request.</p>

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
                <div class="infotext">sent in Query</div>
            </td>
            <td>Portal name</td>
            <td>string</td>
            <td>"example"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
<span class="required-descr"><span class="required">*</span><em> - required field</em></span>

<div id="methodReturns" class="header-gray">Returns</div>
<p>The description of the portal and the portal pricing plan</p>

<div id="methodResponse" class="header-gray">Example Response</div>
<pre>
{
    "tariff": {
        "activeUsers": 50,
        "dueDate": "2016-07-13",
        "features": "whitelabel",
        "maxFileSize": 104857600,
        "maxTotalSize": 1073741824
    },
    "tenant": {
        "created": "2010-07-07T15:46:00",
        "domain": "example.com",
        "language": "en-US",
        "ownerId": "78e1e841-8314-48465-8fc0-e7d6451b6475",
        "portalName": "example",
        "status": "Active",
        "tenantId": 1,
        "timeZoneName": "UTC"
    }
}
</pre>
