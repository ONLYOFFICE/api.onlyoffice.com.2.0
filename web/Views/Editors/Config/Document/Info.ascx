<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/document") %>"></a>
    <span class="hdr">Document Info</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The document info section allows to change additional parameters for the document (document owner, folder where the document is stored, uploading date, sharing settings).</p>

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
            <td id="author" class="copy-link">author</td>
            <td>
                Defines the name of the document author/creator.
                Deprecated since version 5.4, please use <a href="#owner">owner</a> instead.
            </td>
            <td>string</td>
            <td>"John Smith"</td>
        </tr>
        <tr class="tablerow">
            <td id="created" class="copy-link">created</td>
            <td>
                Defines the document creation date.
                Deprecated since version 5.4, please use <a href="#uploaded">uploaded</a> instead.
            </td>
            <td>string</td>
            <td>"2010-07-07 3:46 PM"</td>
        </tr>
        <tr>
            <td id="favorite" class="copy-link">favorite</td>
            <td>
                Defines the highlighting state of the <em>Favorite</em> icon.
                When the user clicks the icon, the <a href="<%= Url.Action("config/events") %>#onMetaChange">onMetaChange</a> event is called.
                If the parameter is <em>undefined</em>, the <em>Favorite</em> icon is not displayed at the editor window header.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/favorite.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="folder" class="copy-link">folder</td>
            <td>Defines the folder where the document is stored (can be empty in case the document is stored in the root folder).</td>
            <td>string</td>
            <td>"Example Files"</td>
        </tr>
        <tr class="tablerow">
            <td id="owner" class="copy-link">owner</td>
            <td>Defines the name of the document owner/creator.</td>
            <td>string</td>
            <td>"John Smith"</td>
        </tr>
        <tr>
            <td id="sharingSettings" class="copy-link">sharingSettings</td>
            <td>Displays the information about the settings which allow to share the document with other users:
                <ul>
                    <li>
                        <b>isLink</b> - changes the user icon to the link icon.
                        <br />
                        <b>type</b>: boolean
                        <br />
                        <b>example</b>: false
                    </li>
                    <li>
                        <b>permissions</b> - the access rights for the user with the name above.
                        Can be <b>Full Access</b>, <b>Read Only</b> or <b>Deny Access</b>
                        <br />
                        <b>type</b>: string
                        <br />
                        <b>example</b>: "Full Access"
                    </li>
                    <li>
                        <b>user</b> - the name of the user the document will be shared with.
                        <br />
                        <b>type</b>: string
                        <br />
                        <b>example</b>: "John Smith".
                    </li>
                </ul>
            </td>
            <td>array of object</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/sharing_settings.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="uploaded" class="copy-link">uploaded</td>
            <td>Defines the document uploading date.</td>
            <td>string</td>
            <td>"2010-07-07 3:46 PM"</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/info.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>

<div class="header-gray">Example</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "info": {
            "favorite": true,
            "folder": "Example Files",
            "owner": "John Smith",
            "sharingSettings": [
                {
                    "permissions": "Full Access",
                    "user": "John Smith"
                },
                {
                    "isLink": true,
                    "permissions": "Read Only",
                    "user": "External link"
                },
                ...
            ],
            "uploaded": "2010-07-07 3:46 PM"
        },
        ...
    },
    ...
});
</pre>
