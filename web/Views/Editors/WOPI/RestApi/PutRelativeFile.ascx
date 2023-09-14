<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <a class="up" href="<%= Url.Action("wopi/restapi") %>"></a>
        <span class="hdr">PutRelativeFile</span>
    </h1>

    <div class="header-gray"><b>POST /wopi/files/<i>(file_id)</i></b></div>
    <p class="dscr">Creates a new file on the host based on the current file.</p>
    <p>This operation works as follows:</p>
    <ol>
        <li>The WOPI host checks if a file is currently locked or not.</li>
        <li>If the file is currently <b>locked</b> and the <b>X-WOPI-Lock</b> value does not match the lock currently on the file,
        the host must return <b>409 Conflict</b> (<em>"lock mismatch"</em>) and include the <b>X-WOPI-Lock</b> response header containing the value of the current lock on the file.
        In the case where the file is unlocked, the host must set <b>X-WOPI-Lock</b> to the empty string.</li>
        <li>If the file is <b>unlocked</b>, the host takes the file name from the <b>X-WOPI-SuggestedTarget</b> header and modifies it in order to make the request succeed:
            <ul>
                <li>If the header contains only a file extension (starts with a period), then the resulting file name will consist of this extension and the initial file name without extension.</li>
                <li>If the header contains a full file name, then it will be a name for the resulting file.</li>
            </ul>
        </li>
        <li>Finally, the host creates a new file that has a legal name and does not overwrite any existing files, while preserving the file extension.</li>
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
                <td>The requested operation from the WOPI server (<em>PUT_RELATIVE</em>).</td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr>
                <td>X-WOPI-SuggestedTarget</td>
                <td>A file extension or a full file name, including the file extension in the format of the UTF-7 encoded string.</td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr>
                <td>X-WOPI-Size</td>
                <td>The size of the file in bytes.</td>
                <td>integer</td>
                <td>optional</td>
            </tr>
            <tr>
                <td>X-WOPI-FileConversion</td>
                <td>Indicates that the request is being made in the context of <a href="<%= Url.Action("wopi/editingbinary") %>">binary document conversion</a>.</td>
                <td>boolean</td>
                <td>optional</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Request body</div>
    <p>The request body must contain the full file contents in the binary format.</p>

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
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Response body</div>
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
                <td>Name</td>
                <td>The file name, including extension, without a path.</td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr>
                <td>Url</td>
                <td>URI of the form <em>http://server/<...>/wopi/files/(file_id)?access_token=(access token)</em>, of the newly created file on the host.</td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr>
                <td>HostViewUrl</td>
                <td>URI to a host page that loads the <a href="<%= Url.Action("wopi/discovery") %>#view">view</a> WOPI action for the newly created file.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr>
                <td>HostEditUrl</td>
                <td>URI to a host page that loads <a href="<%= Url.Action("wopi/discovery") %>#edit">edit</a> action for the newly created file.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>
