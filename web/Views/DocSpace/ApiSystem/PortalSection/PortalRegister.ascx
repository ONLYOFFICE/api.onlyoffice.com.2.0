<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("apisystem/portalsection") %>"></a>
    <span class="hdr">POST /api/portal/register</span>
</h1>

<div id="methodDesc" class="header-gray">Description</div>
<p class="dscr">Registers a new portal with the parameters specified in the request.</p>

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
            <td>firstName<span class="required">*</span>
                <div class="infotext">sent in Body</div>
            </td>
            <td>Portal owner first name</td>
            <td>string</td>
            <td>"John"</td>
        </tr>
        <tr class="tablerow">
            <td>email<span class="required">*</span>
                <div class="infotext">sent in Body</div>
            </td>
            <td>Portal owner email address</td>
            <td>string</td>
            <td>"test@example.com"</td>
        </tr>
        <tr class="tablerow">
            <td>language
                <div class="infotext">sent in Body</div>
            </td>
            <td>Portal language</td>
            <td>string</td>
            <td>"en"</td>
        </tr>
        <tr class="tablerow">
            <td>lastName<span class="required">*</span>
                <div class="infotext">sent in Body</div>
            </td>
            <td>Portal owner last name</td>
            <td>string</td>
            <td>"Smith"</td>
        </tr>
        <tr class="tablerow">
            <td>password
                <div class="infotext">sent in Body</div>
            </td>
            <td>Portal owner password</td>
            <td>string</td>
            <td>"123456"</td>
        </tr>
        <tr class="tablerow">
            <td>phone
                <div class="infotext">sent in Body</div>
            </td>
            <td>Portal owner phone number</td>
            <td>string</td>
            <td>"+123456789"</td>
        </tr>
        <tr class="tablerow">
            <td>portalName<span class="required">*</span>
                <div class="infotext">sent in Body</div>
            </td>
            <td>Portal name</td>
            <td>string</td>
            <td>"example"</td>
        </tr>
        <tr class="tablerow">
            <td>timeZoneName
                <div class="infotext">sent in Body</div>
            </td>
            <td>Portal time zone</td>
            <td>string</td>
            <td>"UTC"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
<span class="required-descr"><span class="required">*</span><em> - required field</em></span>

<div id="methodReturns" class="header-gray">Returns</div>
<p>The link for portal activation and portal description</p>

<div id="methodResponse" class="header-gray">Example Response</div>
<pre>
{
    "reference": "https://example.com/confirm.aspx",
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
