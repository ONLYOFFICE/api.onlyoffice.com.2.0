<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <a class="up" href="<%= Url.Action("wopi/restapi") %>"></a>
        <span class="hdr">Unlock</span>
    </h1>

    <div class="header-gray"><b>POST /wopi/files/<i>(file_id)</i></b></div>
    <p class="dscr">Allows for file editing.</p>
    <p>This operation works as follows:</p>
    <ol>
        <li>The WOPI host checks if a file is currently locked or not.</li>
        <li>If the file is <b>unlocked</b>, or if the file is currently <b>locked</b> and the <b>X-WOPI-Lock</b> value does not match the lock currently on the file, 
        the host must return <b>409 Conflict</b> (<em>"lock mismatch"</em>) and include the <b>X-WOPI-Lock</b> response header containing the value of the current lock on the file. 
        In the case where the file is unlocked, the host must set <b>X-WOPI-Lock</b> to the empty string.</li>
        <li>In the case where the file is locked by a third-party client, hosts should still always include the current lock ID in the <b>X-WOPI-Lock</b> response header.</li>
    </ol>

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
                <td>X-WOPI-Override</td>
                <td>The requested operation from the WOPI server (<em>UNLOCK</em>).</td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr>
                <td>X-WOPI-Lock</td>
                <td>The lock ID that the host must use to identify the lock on the file.</td>
                <td>string</td>
                <td>required</td>
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
                <td>X-WOPI-Lock</td>
                <td>The lock ID identifying the current lock on the file. This header must always be included when responding to the request with <b>409 Conflict</b>. 
                It should not be included when responding to the request with <b>200 OK</b>.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr>
                <td>X-WOPI-LockFailureReason</td>
                <td>The cause of the lock failure. This header may be included when responding to the request with <b>409 Conflict</b>. It must only be used for logging purposes.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr>
                <td>X-WOPI-ItemVersion</td>
                <td>The file version.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>
