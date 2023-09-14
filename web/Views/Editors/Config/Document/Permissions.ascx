<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/document") %>"></a>
    <span class="hdr">Document Permissions</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The document permission section allows to change the permission for the document to be edited and downloaded or not.</p>

<div class="header-gray">Parameters</div>
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
            <td id="changeHistory" class="copy-link">changeHistory</td>
            <td>
                Allows to display the <em>Restore</em> button when using the <a href="<%= Url.Action("config/events") %>#onRequestRestore">onRequestRestore</a> event.
                The default value is <b>false</b>.
                Deprecated since version 5.5, please add the <a href="<%= Url.Action("config/events") %>#onRequestRestore">onRequestRestore</a> field instead.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="chat" class="copy-link">chat</td>
            <td>
                Defines if the chat functionality is enabled in the document or not.
                In case the chat permission is set to <b>true</b>, the <b>Chat</b> menu button will be displayed.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="comment" class="copy-link">comment</td>
            <td>
                Defines if the document can be commented or not.
                In case the commenting permission is set to <b>"true"</b> the document <b>side bar</b> will contain the <b>Comment</b> menu option; the document commenting will only be available for the document editor if the <a href="<%= Url.Action("config/editor") %>#mode">mode</a> parameter is set to <b>edit</b>. The default value coincides with the value of the <a href="#edit">edit</a> parameter.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">
                    In case <em>edit</em> is set to <b>"true"</b> and <em>comment</em> is also set to <b>"true"</b>, the user will be able to edit the document and comment.
                    In case <em>edit</em> is set to <b>"true"</b> and <em>comment</em> is set to <b>"false"</b>, the user will be able to edit only, the corresponding commenting functionality will be available for viewing only, the adding and editing of comments will be unavailable.
                    In case <em>edit</em> is set to <b>"false"</b> and <em>comment</em> is set to <b>"true"</b>, the document will be available for commenting only.
                    In case <em>edit</em> is set to <b>"false"</b> and <em>review</em> is set to <b>"false"</b> and <em>comments</em> is set to <b>"true"</b> the <em>fillForms</em> value is not considered and filling the forms is not available.
                </div>
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/comment.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="commentGroups" class="copy-link">commentGroups</td>
            <td>
                Defines the <a href="<%= Url.Action("config/editor") %>#user">groups</a> whose comments the user can edit, remove and/or view.
                The object has the following parameters:
                <ul>
                    <li>
                        <b>edit</b> - the user can edit comments made by other users,
                        <br />
                        <b>type</b>: list,
                        <br />
                        <b>example</b>: ["Group2", ""];
                    </li>
                    <li>
                        <b>remove</b> - the user can remove comments made by other users,
                        <br />
                        <b>type</b>: list,
                        <br />
                        <b>example</b>: [];
                    </li>
                    <li>
                        <b>view</b> - the user can view comments made by other users,
                        <br />
                        <b>type</b>: list,
                        <br />
                        <b>example</b>: "".
                    </li>
                </ul>
                The <em>[""]</em> value means that the user can edit/remove/view comments made by someone who belongs to none of these groups (for example, if the document is reviewed in third-party editors).
                If the value is <em>[]</em>, the user cannot edit/remove/view comments made by any group.
                If the <em>edit</em>, <em>remove</em> and <em>view</em> parameters are <em>""</em> or not specified, then the user can view/edit/remove comments made by any user.
            </td>
            <td>object</td>
            <td>{
    "edit": ["Group2", ""],
    "remove": [""],
    "view": ""
}</td>
        </tr>
        <tr class="tablerow">
            <td id="copy" class="copy-link">copy</td>
            <td>
                Defines if the content can be copied to the clipboard or not.
                In case the parameter is set to <b>false</b>, pasting the content will be available within the current document editor only.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="deleteCommentAuthorOnly" class="copy-link">deleteCommentAuthorOnly</td>
            <td>
                Defines if the user can delete only his/her comments.
                The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="download" class="copy-link">download</td>
            <td>
                Defines if the document can be downloaded or only viewed or edited online.
                In case the downloading permission is set to <b>"false"</b> the <b>Download as...</b> menu option will be absent from the <b>File</b> menu.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/download.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="edit" class="copy-link">edit</td>
            <td>
                Defines if the document can be edited or only viewed.
                In case the editing permission is set to <b>"true"</b> the <b>File</b> menu will contain the <b>Edit Document</b> menu option; please note that if the editing permission is set to <b>"false"</b> the document will be opened in viewer and you will <b>not</b> be able to switch it to the editor even if the <a href="<%= Url.Action("config/editor") %>#mode">mode</a> parameter is set to <b>edit</b>.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/edit.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="editCommentAuthorOnly" class="copy-link">editCommentAuthorOnly</td>
            <td>
                Defines if the user can edit only his/her comments.
                The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="fillForms" class="copy-link">fillForms</td>
            <td>
                Defines if the forms can be filled.
                Filling in forms will only be available for the document editor if the <a href="<%= Url.Action("config/editor") %>#mode">mode</a> parameter is set to <b>edit</b>.
                The default value coincides with the value of the <a href="#edit">edit</a> or the <a href="#review">review</a> parameter.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">
                    In case <em>edit</em> is set to <b>"true"</b> or <em>review</em> is set to <b>"true"</b>, the <em>fillForms</em> value is not considered and the form filling is possible.
                    In case <em>edit</em> is set to <b>"false"</b> and <em>review</em> is set to <b>"false"</b> and <em>fillForms</em> is also set to <b>"true"</b>, the user can only fill forms in the document.
                    In case <em>edit</em> is set to <b>"false"</b> and <em>review</em> is set to <b>"false"</b> and <em>fillForms</em> is set to <b>"true"</b> the <em>comments</em> value is not considered and the commenting is not available.
                    The form filling only mode is currently available for <b>Document Editor</b> only.
                </div>
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/fill-forms.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="modifyContentControl" class="copy-link">modifyContentControl</td>
            <td>
                Defines if the content control settings can be changed.
                Content control modification will only be available for the document editor if the <a href="<%= Url.Action("config/editor") %>#mode">mode</a> parameter is set to <b>edit</b>.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="modifyFilter" class="copy-link">modifyFilter</td>
            <td>
                Defines if the filter can applied globally (<b>true</b>) affecting all the other users, or locally (<b>false</b>), i.e. for the current user only.
                Filter modification will only be available for the spreadsheet editor if the <a href="<%= Url.Action("config/editor") %>#mode">mode</a> parameter is set to <b>edit</b>.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">In case the document is edited by a user with the full access rights, the filters applied by such a user will be visible to all other users despite their local settings.</div>
            </td>
        </tr>
        <tr>
            <td id="print" class="copy-link">print</td>
            <td>
                Defines if the document can be printed or not.
                In case the printing permission is set to <b>"false"</b> the <b>Print</b> menu option will be absent from the <b>File</b> menu.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/print.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="protect" class="copy-link">protect</td>
            <td>
                Defines if the <b>Protection</b> tab on the toolbar and the <b>Protect</b> button in the left menu are displayed (<b>true</b>) or hidden (<b>false</b>).
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/protect.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="rename" class="copy-link">rename</td>
            <td>
                Allows to display the <em>Rename...</em> button when using the <a href="<%= Url.Action("config/events") %>#onRequestRename">onRequestRename</a> event.
                The default value is <b>false</b>.
                Deprecated since version 6.0, please add the <a href="<%= Url.Action("config/events") %>#onRequestRename">onRequestRename</a> field instead.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="review" class="copy-link">review</td>
            <td>
                Defines if the document can be reviewed or not.
                In case the reviewing permission is set to <b>true</b> the document <b>status bar</b> will contain the <b>Review</b> menu option; the document review will only be available for the document editor if the <a href="<%= Url.Action("config/editor") %>#mode">mode</a> parameter is set to <b>edit</b>.
                The default value coincides with the value of the <a href="#edit">edit</a> parameter.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">
                    In case <em>edit</em> is set to <b>"true"</b> and <em>review</em> is also set to <b>"true"</b>, the user will be able to edit the document, accept/reject the changes made and switch to the review mode him/herself.
                    In case <em>edit</em> is set to <b>"true"</b> and <em>review</em> is set to <b>"false"</b>, the user will be able to edit only.
                    In case <em>edit</em> is set to <b>"false"</b> and <em>review</em> is set to <b>"true"</b>, the document will be available in review mode only.
                </div>
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/review.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="reviewGroups" class="copy-link">reviewGroups</td>
            <td>
                Defines the <a href="<%= Url.Action("config/editor") %>#user">groups</a> whose changes the user can accept/reject.
                The <em>[""]</em> value means that the user can review changes made by someone who belongs to none of these groups (for example, if the document is reviewed in third-party editors).
                If the value is <em>[]</em>, the user cannot review changes made by any group.
                If the value is <em>""</em> or not specified, then the user can review changes made by any user.
            </td>
            <td>array of string</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="userInfoGroups" class="copy-link">userInfoGroups</td>
            <td>
                Defines the groups of users whose information is displayed in the editors:
                <ul>
                    <li>the usernames are displayed in the list of the editing users in the editor header,</li>
                    <li>when typing text, the user cursors and tooltips with their names are displayed,</li>
                    <li>when locking objects in the strict co-editing mode, the usernames are displayed.</li>
                </ul>
                The <em>["Group1", ""]</em> means that the information about users from Group1 and users who don't belong to any group is displayed.
                The <em>[]</em> means that no user information is displayed at all.
                The <em>undefined</em> or <em>""</em> values mean that the information about all users is displayed.
            </td>
            <td>array of strings</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "chat": true,
            "comment": true,
            "commentGroups": {
                "edit": ["Group2", ""],
                "remove": [""],
                "view": ""
            },
            "copy": true,
            "deleteCommentAuthorOnly": false,
            "download": true,
            "edit": true,
            "editCommentAuthorOnly": false,
            "fillForms": true,
            "modifyContentControl": true,
            "modifyFilter": true,
            "print": true,
            "protect": true,
            "review": true,
            "reviewGroups": ["Group1", "Group2", ""],
            "userInfoGroups": ["Group1", ""]
        },
        ...
    },
    ...
});
</pre>
