<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <a class="up" href="<%= Url.Action("wopi/restapi") %>"></a>
        <span class="hdr">GetFile</span>
    </h1>

    <div class="header-gray"><b>GET /wopi/files/<i>(file_id)</i>/contents</b></div>
    <p class="dscr">Requests a message to retrieve a file for the <em>HTTP://server/&lt;...&gt;/wopi*/files/&lt;id&gt;/contents</em> operation.</p>
    <p>The response body must contain the full file contents in the binary format.</p>

    <div class="header-gray">Parameters</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>file_id</td>
                <td>The file ID that must be URL safe.</td>
                <td>string</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Query parameters</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>access_token</td>
                <td>An access token that the host will use to determine whether the request is authorized.</td>
                <td>string</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Request headers</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col />
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
            <tr>
                <td>X-WOPI-MaxExpectedSize</td>
                <td>The maximum expected size of the file being requested. The host should use the maximum value of a 4-byte integer if this value is not set in the request. 
                If the file requested is larger than this value, the host must respond with <b>412 Precondition Failed</b>.</td>
                <td>integer</td>
                <td>optional</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Response headers</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col />
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
            <tr>
                <td>X-WOPI-ItemVersion</td>
                <td>The file version.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Response body</div>
    <p>The response body must be the full binary contents of the file.</p>
