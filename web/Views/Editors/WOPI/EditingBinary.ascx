<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <span class="hdr">Editing binary document formats</span>
    </h1>

    <p class="dscr">The online office does not support editing files in the legacy binary formats such as <em>doc</em>, <em>ppt</em>, and <em>xls</em>.
    However, it can convert documents in such formats to the <em>docx</em>, <em>pptx</em>, and <em>xlsx</em> formats accordingly to let the users edit their contents in the online office.</p>
    <note>Usually, conversion does not make any visible changes to the original document layout and formatting.
    But sometimes it can occur and users might wish to revert to the previous binary document format after it has been converted.</note>

    <p>The <a href="<%= Url.Action("wopi/discovery") %>#convert">convert</a> WOPI discovery action implements the possibility to convert a file in the binary format into the modern OOXML format.
    A host must also support the <a href="<%= Url.Action("wopi/restapi/PutRelativeFile") %>">PutRelativeFile</a> WOPI operation. The process of the binary file editing consists of the following steps:</p>
    <ol>
        <li>The host runs the <b>convert</b> action on a binary file.</li>
        <li>The online office retrieves the file from the host and converts it.</li>
        <li>The online office sends the converted document back to the host by executing the <b>PutRelativeFile</b> operation with the original file ID.</li>
        <li>Hosts use the <b>X-WOPI-FileConversion</b> request header of the <b>PutRelativeFile</b> operation to determine that the request is being made in the context of a file conversion.</li>
        <li>After the document is successfully converted, the online office redirects the user to the <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#HostEditUrl">HostEditUrl</a>
        that's returned in the <b>PutRelativeFile</b> response body.</li>
    </ol>
    <p>Now the user can edit the document in the OOXML format.</p>

    <h2 id="viewing-mode" class="copy-link">Viewing mode</h2>

    <p>There might be another scenario when the host first opens a document in the viewer and then uses the <b>Edit</b> button to convert the document into the OOXML format and edit it.
    The process of opening a binary file with the <a href="<%= Url.Action("wopi/discovery") %>#view">view</a> action should be done as follows:</p>
    <ol>
        <li>Set the <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#UserCanWrite">UserCanWrite</a> property to <b>true</b>.</li>
        <li>Set the <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#UserCanNotWriteRelative">UserCanNotWriteRelative</a> property to <b>false</b> (or simply omit it).</li>
        <li>Set the <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#HostEditUrl">HostEditUrl</a> property to a host URL that runs the <b>convert</b> action when loaded.</li>
    </ol>
    <p>If all these conditions are met, the <b>Edit</b> button is displayed in the viewer. When the user clicks it, the <b>HostEditUrl</b> provided for the binary file is opened and starts the conversion process.
    Finally, the user is redirected to the <b>HostEditUrl</b> for the newly converted document.</p>

    <h2 id="customization" class="copy-link">Customization</h2>

    <p>Sometimes, the users might be confused when opening their binary files without any changes made. It happens because all the changes are made in the newly converted OOXML files.
    That is why, it can be important to inform the users prior the conversion start. There are three ways how the hosts can do this.</p>

    <p><b>Option 1</b>. Displaying a notification message</p>
    <p>The host can display some UI to the user before the conversion start. When the <b>convert</b> action is executed,
    the host identifies it as an attempt to edit a binary document and displays a notification message to inform a user that the document will be converted.
    This scenario can be also applied to the <b>Edit</b> button by setting the <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#EditModePostMessage">EditModePostMessage</a>
    property to <b>true</b> and handling the <a href="<%= Url.Action("wopi/postmessage") %>#UI_Edit">UI_Edit</a> PostMessage.</p>

    <p><b>Option 2</b>. Handling converted documents differently</p>
    <p>The host can handle converted documents in a unique way, by handling the <a href="<%= Url.Action("wopi/restapi/PutRelativeFile") %>">PutRelativeFile</a> operation differently
    when called during the conversion process. The <b>X-WOPI-FileConversion</b> header tells hosts when the operation is being called from the conversion flow,
    so the host can choose how best to handle those requests.</p>

    <p><b>Option 3</b>. Redirecting to an interstitial page</p>
    <p>The online office navigates to the <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#HostEditUrl">HostEditUrl</a> that's returned in the <a href="<%= Url.Action("wopi/restapi/PutRelativeFile") %>">PutRelativeFile</a> response,
    which the host controls. So, hosts can send the user to any URL after the conversion is finished. For example, a host might redirect the user to an interstitial page that informs them that their document has been converted.</p>
    <img class="screenshot max-width-300" alt="Convert binary files" src="<%= Url.Content("~/content/img/editor/convert-binary-files.jpg") %>" />
