<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <a class="up" href="<%= Url.Action("wopi/restapi") %>"></a>
        <span class="hdr">PutFile</span>
    </h1>

    <div class="header-gray"><b>POST /wopi/files/<i>(file_id)</i>/contents</b></div>
    <p class="dscr">Requests a message to update a file for the <em>HTTP://server/&lt;...&gt;/wopi*/files/&lt;id&gt;/contents</em> operation.</p>
    <p>The request body must contain the full file contents in the binary format.</p>
    <p>This operation works as follows:</p>
    <ol>
        <li>The WOPI host checks if a file is currently locked or not.</li>
        <li>If the file is currently <b>locked</b> and the <b>X-WOPI-Lock</b> value does not match the lock currently on the file, 
        the host must return <b>409 Conflict</b> (<em>"lock mismatch"</em>) and include the <b>X-WOPI-Lock</b> response header containing the value of the current lock on the file. 
        In the case where the file is unlocked, the host must set <b>X-WOPI-Lock</b> to the empty string.</li>
        <li>If the file is <b>unlocked</b>, the host must check the current size of the file. If it is 0 bytes, the <b>PutFile</b> request should be considered valid and should proceed. 
        If it is any value other than 0 bytes, or is missing altogether, the host should respond with <b>409 Conflict</b>.</li>
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
                <td>The requested operation from the WOPI server (<em>PUT</em>).</td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr>
                <td>X-WOPI-Lock</td>
                <td>The lock ID that the host must use to identify the lock on the file.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr>
                <td>X-WOPI-Editors</td>
                <td>All the users who contributed changes to the document in this <b>PutFile</b> request (<a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#UserId">UserId</a> values delimited by commas).</td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr>
                <td>X-LOOL-WOPI-IsModifiedByUser</td>
                <td>Indicates whether the user has modified the document before the save (<b>"true"</b>), or if they just pressed the <b>Save</b> button without any modification (<b>"false"</b>).</td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr>
                <td>X-LOOL-WOPI-IsAutosave</td>
                <td>Indicates whether the <b>PutFile</b> is triggered by autosave (<b>"true"</b>) or by explicit user operation (<b>Save</b> button or menu entry) (<b>"false"</b>).</td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr>
                <td>X-LOOL-WOPI-IsExitSave</td>
                <td>Indicates whether an automatic save will be triggered when the document gets cleaned up from memory (e.g. when all users disconnect) (<b>"true"</b>) or not (<b>"false"</b>).</td>
                <td>string</td>
                <td>optional</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Request body</div>
    <p>The request body must be the full binary contents of the file.</p>

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
