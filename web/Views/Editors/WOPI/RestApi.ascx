<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <span class="hdr">WOPI REST API</span>
    </h1>

    <p class="dscr">
        <a href="https://docs.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/rest/" target="_blank">WOPI REST API</a> specifies a set of operations that enables a client to access and change files stored on a server.
    </p>
    <p>ONLYOFFICE Docs uses the following WOPI operations:</p>
    <ul>
        <li><a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>">CheckFileInfo</a> - returns information about the file properties, access rights and editor settings.</li>
        <li><a href="<%= Url.Action("wopi/restapi/getfile") %>">GetFile</a> - requests a message to retrieve a file for the <em>HTTP://server/&lt;...&gt;/wopi*/files/&lt;id&gt;/contents</em> operation.</li>
        <li><a href="<%= Url.Action("wopi/restapi/lock") %>">Lock</a> - locks file editing by an online office that requested the lock.</li>
        <li><a href="<%= Url.Action("wopi/restapi/refreshlock") %>">RefreshLock</a> - refreshes the lock on a file by resetting its automatic expiration timer to 30 minutes.</li>
        <li><a href="<%= Url.Action("wopi/restapi/unlock") %>">Unlock</a> - allows for file editing.</li>
        <li><a href="<%= Url.Action("wopi/restapi/putfile") %>">PutFile</a> - requests a message to update a file for the <em>HTTP://server/&lt;...&gt;/wopi*/files/&lt;id&gt;/contents</em> operation.</li>
        <li><a href="<%= Url.Action("wopi/restapi/putrelativefile") %>">PutRelativeFile</a> - creates a new file on the host based on the current file.</li>
        <li><a href="<%= Url.Action("wopi/restapi/renamefile") %>">RenameFile</a> - renames a file.</li>
    </ul>

    <div class="header-gray">Possible error codes and their description</div>
    <table class="table">
        <colgroup>
            <col />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Error code</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>200 OK</td>
                <td>Success</td>
            </tr>
            <tr>
                <td>400 Bad Request</td>
                <td><b>X-WOPI-Lock</b> was not provided or was empty / Specified name is illegal</td>
            </tr>
            <tr>
                <td>401 Unauthorized</td>
                <td>Invalid access token</td>
            </tr>
            <tr>
                <td>404 Not Found</td>
                <td>Resource not found/user unauthorized</td>
            </tr>
            <tr>
                <td>409 Conflict</td>
                <td>Lock mismatch/locked by another interface; the <b>X-WOPI-Lock</b> response header containing the value of the current lock on the file must always be included when using this response code</td>
            </tr>
            <tr>
                <td>412 Precondition Failed</td>
                <td>File is larger than <b>X-WOPI-MaxExpectedSize</b></td>
            </tr>
            <tr>
                <td>413 Request Entity Too Large</td>
                <td>File is too large; the maximum file size is host-specific</td>
            </tr>
            <tr>
                <td>500 Internal Server Error</td>
                <td>Server error</td>
            </tr>
            <tr>
                <td>501 Not Implemented</td>
                <td>Operation not supported</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>
