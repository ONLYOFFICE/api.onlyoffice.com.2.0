<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Commenting
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Commenting</span>
    </h1>

    <p class="dscr">
        The <b>Comment option</b> allows you to leave comments on the specific words, phrases, sentences and other document parts, edit and remove these comments. 
        All the comments will be saved and shown to other document users.
    </p>
    <img class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/comment.png") %>" alt="" />

    <h2 id="access-rights" class="copy-link">Comment access rights</h2>
    <p>
        In order to enable the comment option, the <a href="<%= Url.Action("config/document/permissions") %>#comment">comment</a> parameter in the permissions section of the document initialization must be set to <b>true</b>.
        The document <b>side bar</b> will contain the <b>Comment</b> menu option.
    </p>
    <p>
        In case the <em>edit</em> parameter is set to <b>true</b> and the <em>comment</em> parameter is also set to <b>true</b>, the user will be able to edit the document and comment.
    </p>
    <img class="screenshot max-width-832" alt="Commenting" src="<%= Url.Content("~/content/img/editor/commenting.png") %>" />
    <p>
        In case the <em>edit</em> parameter is set to <b>false</b> and the <em>comment</em> parameter is set to <b>true</b>, the document will be available for commenting only.
    </p>
    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": false,
            "comment": true
            ...
        },
        ...
    },
    ...
});
</pre>
    <div class="note">Please note that the document commenting will only be available for the document editor if the <a href="<%= Url.Action("config/editor") %>#mode">mode</a> parameter is set to <b>edit</b>.</div>

    
    <h2 id="author-rights" class="copy-link">Differentiation of commenting rights by authors</h2>
    <ol>
        <li>
            <p>
                If you want to allow editing comments only by their authors, set the <a href="<%= Url.Action("config/document/permissions") %>#editCommentAuthorOnly">editCommentAuthorOnly</a> 
                parameter in the permissions section of the editor initialization to <b>true</b>.
            </p>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "editCommentAuthorOnly": true
            ...
        },
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>
                If you want to allow deleting comments only by their authors, set the <a href="<%= Url.Action("config/document/permissions") %>#deleteCommentAuthorOnly">deleteCommentAuthorOnly</a> 
                parameter in the permissions section of the editor initialization to <b>true</b>.
            </p>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "deleteCommentAuthorOnly": true
            ...
        },
        ...
    },
    ...
});
</pre>
        </li>
    </ol>


    <h2 id="group-rights" class="copy-link">Differentiation of commenting rights by groups</h2>
    <ol>
        <li>
            <p>
                Specify the group (or several groups separated with commas) the user belongs to by adding the field <em>group</em> to the <a href="<%= Url.Action("config/editor") %>#user">user</a> parameter in the editorConfig section.
            </p>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "user": {
            "id": "78e1e841",
            "name": "John Smith",
            "group": "Group1"
        }
    },
    ...
});

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "user": {
            "id": "F89d8069ba2b",
            "name": "Kate Cage",
            "group": "Group2"
        }
    },
    ...
});
</pre>
        </li>
        <li>
            <p>
                Specify the access rights using the <a href="<%= Url.Action("config/document/permissions") %>#commentGroups">commentGroups</a> parameter in the permissions section of the editor initialization.
            </p>
            <div class="note">
                If the <b>commentGroups</b> parameter is specified in the editor config, the access rights to viewing, editing and/or removing all comments are disabled.
                Otherwise, if the current user does not belong to any of the groups, he or she can edit, remove and/or view comments of all groups.
            </div>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "commentGroups": {
                "edit": ["Group2", ""],
                "remove": [""],
                "view": ""
            },
            ...
        }
        ...
    },
    ...
});
</pre>
            <ul>
                <li><em>"edit": ["Group2", ""]</em> means that the user can edit comments made by users from <em>Group2</em> and users who do not belong to any of the groups (for example, the document that is commented in third-party editors).</li>
                <li><em>"remove": [""]</em> means that the user can remove comments made by someone who belongs to none of these groups (for example, the document that is commented in third-party editors).</li>
                <li><em>"view": ""</em> means that the user can view comments made by any user.</li>
            </ul>
        </li>
    </ol>


    <h2 id="threaded-comments" class="copy-link">Threaded comments in spreadsheets</h2>
    <p>
        To display ONLYOFFICE spreadsheet comments in other editors correctly, all the comments are saved in two formats - original and threaded:
    </p>
    <ol>
        <li>
            <p>The <b>original comment format</b> looks as follows:</p>
            <pre>
${author1}:
comment
${author2}:
reply1
${author2}:
reply2
</pre>
            <img class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/comments-threaded.png") %>" alt="" />
        </li>
        <li>
            To convert the original comments format into the <b>threaded comments</b>, the <em>"${author}:\n"</em> string is deleted if the comment starts with it.
        </li>
    </ol>

    <p>The file in the editors opens as follows:</p>
    <ul>
        <li>If there are threaded comments in the file, they are used when opening.</li>
        <li>If there are comments in the original ONLYOFFICE format only, they are converted into threaded comments.</li>
    </ul>

</asp:Content>
