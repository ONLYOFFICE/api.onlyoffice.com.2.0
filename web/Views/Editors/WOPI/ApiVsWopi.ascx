<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <span class="hdr">ONLYOFFICE Docs API vs WOPI</span>
    </h1>

    <p class="dscr">You can integrate <a href="https://www.onlyoffice.com/office-suite.aspx" target="_blank">ONLYOFFICE Docs</a> with any cloud service using either API or WOPI.</p>
    <p>The table below will help you find out the difference between these options.</p>

    <table class="table">
        <colgroup>
            <col />
            <col class="table-api" />
            <col class="table-wopi" />
        </colgroup>
        <thead style="background-color: #ebebeb">
            <tr class="tablerow">
                <td class="borders"></td>
                <td style="text-align: center" class="borders"><h2>API</h2></td>
                <td style="text-align: center" class="borders"><h2>WOPI</h2></td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td id="general-info" class="table-header-gray borders copy-link table-style"><h2>General info</h2></td>
                <td class="borders">
                    <p>Application Programming Interface: describes the main methods that allow you to interact with different ONLYOFFICE components, 
                        including editors, thus giving you programmatic access to it.</p>
                    <p><a href="<%= Url.Action("basic") %>">Learn more</a></p>
                </td>
                <td class="borders">
                    <p>Web Application Open Platform Interface: REST-based protocol by Microsoft that defines a set of operations that enables a client to access 
                        and change files stored by a server.</p>
                    <p><a href="<%= Url.Action("wopi/") %>">Learn more</a></p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="integration" class="table-header-gray borders copy-link table-style"><h2>Integration with sync&share and DMS solutions</h2></td>
                <td class="borders">
                    <p>Integration via ready-to-use connectors developed by ONLYOFFICE or its partners.</p>
                    <p><a href="https://www.onlyoffice.com/all-connectors.aspx" target="_blank">Check all integrations</a></p>
                </td>
                <td class="borders">
                    <p>Integration via WOPI connector/universal WOPI client.</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="collaboration" class="table-header-gray borders copy-link table-style"><h2>Collaboration (modes)</h2></td>
                <td class="borders">
                    <p>Switching between real-time and paragraph-locking co-editing modes.</p>
                </td>
                <td class="borders">
                    <p>Only real-time co-editing, switching between the modes is not available in the interface.</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="customization" class="table-header-gray borders copy-link table-style"><h2>Customization</h2></td>
                <td class="borders">
                    <ul>
                        <li>Specifying the editor interface <a href="<%= Url.Action("config/editor") %>#lang">language</a></li>
                        <li>Specifying the editor interface <a href="<%= Url.Action("config/editor/customization") %>#uiTheme">theme</a></li>
                        <li>Disabling the <a href="<%= Url.Action("config/editor/customization") %>#chat">chat</a> functionality via the <b>Chat</b> menu button</li>
                        <li>Displaying the <a href="<%= Url.Action("config/editor/customization") %>#customer">customer</a> information in the editor <b>About</b> section</li>
                        <li>Editor <a href="<%= Url.Action("config/editor/customization") %>">customization</a> is available through the parameters 
                        for controlling the toolbars appearance and hiding them, branding</li>
                        <li>Passing <a href="<%= Url.Action("config/editor") %>#templates">templates</a> to create a new file</li>
                        <li>Passing a list of the <a href="<%= Url.Action("config/editor") %>#recent">recently opened files</a></li>
                        <li>Connecting <a href="<%= Url.Action("config/editor/plugins") %>">plugins</a></li>
                    </ul>
                </td>
                <td class="borders">
                    <ul>
                        <li>Specifying the editor interface <a href="<%= Url.Action("wopi/discovery") %>#ui">language</a></li>
                        <li>Specifying the editor interface <a href="<%= Url.Action("wopi/discovery") %>#thm">theme</a></li>
                        <li>Disabling the <a href="<%= Url.Action("wopi/discovery") %>#dchat">chat</a> functionality via the <b>Chat</b> menu button</li>
                        <li>Displaying the <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#BreadcrumbBrandUrl">customer</a> information in the editor <b>About</b> section</li>
                    </ul>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="denying-requests" class="table-header-gray borders copy-link table-style"><h2>Denying requests for resources</h2></td>
                <td class="borders">
                    <p>Configuring IPs of <a href="<%= Url.Action("wopi/") %>#ip-filter">trusted integrators</a> (white list) which requests ONLYOFFICE Docs can accept.</p>
                </td>
                <td class="borders">
                    <p>Configuring IPs of <a href="<%= Url.Action("wopi/") %>#ip-filter">trusted integrators</a> (white list) which requests ONLYOFFICE Docs can accept.</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="access-to-server" class="table-header-gray borders copy-link table-style"><h2>Restricting access to the use of ONLYOFFICE server</h2></td>
                <td class="borders">
                    <p>Editing access control is based on JWT signature. The secret key is required to generate a <a href="<%= Url.Action("signature/browser") %>">file open request</a>.</p>
                </td>
                <td class="borders">
                    <p>No restrictions</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="access-to-data" class="table-header-gray borders copy-link table-style"><h2>Restricting access to data</h2></td>
                <td class="borders">
                    <p>Verification of request from the ONLYOFFICE server is based on the JWT signature. 
                    The request is <a href="<%= Url.Action("signature/request") %>#callbackUrl">signed</a> with a secret key, 
                    and this allows making sure that it is not executed by a third-party.</p>
                </td>
                <td class="borders">
                    <p>Verification of request from the ONLYOFFICE server is based on the private key signing the request 
                    and a public key which is written in the <a href="<%= Url.Action("wopi/proofkeys") %>">proof-key</a> element 
                    in the <a href="<%= Url.Action("wopi/discovery") %>">WOPI discovery XML</a>.</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="basic-actions" class="table-header-gray borders copy-link table-style"><h2>Basic actions</h2></td>
                <td class="borders">
                    <p>The basic actions of viewing, editing, co-editing, mobile viewing and editing, embedded documents viewing are supported.</p>
                </td>
                <td class="borders">
                    <p>The basic actions of viewing, editing and co-editing are supported.</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="methods" class="table-header-gray borders copy-link table-style"><h2>Additional actions through method calls</h2></td>
                <td class="borders">
                    <ul>
                        <li><a href="<%= Url.Action("methods") %>#downloadAs">Download</a> request in a different format</li>
                        <li>Setting the <a href="<%= Url.Action("methods") %>#setFavorite">Favorite</a> status</li>
                        <li>Displaying tooltip with the <a href="<%= Url.Action("methods") %>#showMessage">message</a></li>
                    </ul>
                </td>
                <td class="borders">
                    <p>No additional actions</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="events" class="table-header-gray borders copy-link table-style"><h2>Additional actions through event handling</h2></td>
                <td class="borders">
                    <ul>
                        <li><a href="<%= Url.Action("config/events") %>#onRequestClose">Closing</a> the editor</li>
                        <li><a href="<%= Url.Action("config/editor/customization") %>#goback">Going</a> to a file folder</li>
                        <li><a href="<%= Url.Action("config/events") %>#onRequestEditRights">Switching</a> from the viewing into the editing mode</li>
                        <li><a href="<%= Url.Action("config/events") %>#onRequestRename">Renaming</a> a file</li>
                        <li>Opening a dialog of <a href="<%= Url.Action("config/events") %>#onRequestSharingSettings">sharing access</a> settings</li>
                        <li>Opening the document <a href="<%= Url.Action("config/events") %>#onRequestHistory">version history</a></li>
                        <li><a href="<%= Url.Action("config/events") %>#onRequestInsertImage">Inserting images</a> from the storage</li>
                        <li><a href="<%= Url.Action("config/events") %>#onRequestMailMergeRecipients">Mail merging</a></li>
                        <li><a href="<%= Url.Action("config/events") %>#onRequestCompareFile">Comparison</a> with a document from the storage</li>
                        <li>Getting the <a href="<%= Url.Action("config/events") %>#onMakeActionLink">action link</a></li>
                        <li>Request to <a href="<%= Url.Action("config/events") %>#onRequestSaveAs">save</a> a file in a different format</li>
                        <li>Getting a list of users for <a href="<%= Url.Action("config/events") %>#onRequestUsers">mentioning</a></li>
                        <li><a href="<%= Url.Action("config/events") %>#onRequestCreateNew">Creating</a> a new file</li>
                    </ul>
                </td>
                <td class="borders">
                    <ul>
                        <li><a href="<%= Url.Action("wopi/postmessage") %>#UI_Close">Closing</a> the editor</li>
                        <li><a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#BreadcrumbFolderUrl">Going</a> to a file folder</li>
                        <li><a href="<%= Url.Action("wopi/postmessage") %>#UI_Edit">Switching</a> from the viewing into the editing mode</li>
                        <li><a href="<%= Url.Action("wopi/postmessage") %>#File_Rename">Renaming</a> a file</li>
                        <li>Opening a dialog of <a href="<%= Url.Action("wopi/postmessage") %>#UI_Sharing">sharing access</a> settings</li>
                        <li>Opening the document <a href="<%= Url.Action("wopi/postmessage") %>#UI_FileVersions">version history</a></li>
                        <li><a href="<%= Url.Action("wopi/postmessage") %>#UI_InsertGraphic">Inserting images</a> from the storage</li>
                    </ul>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="file-lock" class="table-header-gray borders copy-link table-style"><h2>File lock</h2></td>
                <td class="borders">
                    <p>Getting a message with the <a href="<%= Url.Action("callback") %>#status">document status</a> informing about opening a file for editing, 
                    closing a file with no changes or closing a file which is ready for saving after editing.</p>
                </td>
                <td class="borders">
                    <ul>
                        <li><a href="<%= Url.Action("wopi/restapi/lock") %>">Locks</a> file editing by an online office that requested the lock</li>
                        <li><a href="<%= Url.Action("wopi/restapi/refreshlock") %>">Refreshes the lock</a> on a file by resetting its automatic expiration timer to 30 minutes</li>
                        <li>Allows for <a href="<%= Url.Action("wopi/restapi/unlock") %>">file editing</a></li>
                    </ul>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="file-access-rights" class="table-header-gray borders copy-link table-style"><h2>File access rights</h2></td>
                <td class="borders">
                    <ul>
                        <li>Viewing</li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#edit">Editing</a></li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#review">Reviewing</a> (only for text documents)</li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#comment">Commenting</a></li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#fillForms">Filling forms</a> (only for forms)</li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#modifyContentControl">Modifying content controls</a> (only for text documents)</li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#modifyFilter">Modifying filters</a> (only for spreadsheets)</li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#copy">Copying</a> to the clipboard</li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#download">Downloading</a></li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#print">Printing</a></li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#rename">Renaming</a></li>
                    </ul>
                </td>
                <td class="borders">
                    <ul>
                        <li>Viewing</li>
                        <li><a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#UserCanWrite">Editing</a></li>
                        <li><a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#UserCanReview">Reviewing</a> (only for text documents)</li>
                        <li><a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#HidePrintOption">Printing</a></li>
                        <li><a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#UserCanRename">Renaming</a></li>
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>
