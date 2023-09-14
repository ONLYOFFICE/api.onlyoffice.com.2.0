<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Reviewing
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Reviewing</span>
    </h1>

    <p class="dscr">
        The <b>Review option</b> allows you to review a document, change sentences, phrases and other page elements, correct spelling, etc. without actually editing it.
        All the changes will be recorded and shown to the user who created the document.
    </p>
    <img class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/review.png") %>" alt="" />

    <h2 id="access-rights" class="copy-link">Review access rights</h2>
    <p>
        In order to enable the review option, the <a href="<%= Url.Action("config/document/permissions") %>#review">review</a> parameter in the permissions section of the document initialization must be set to <b>true</b>.
        The document <b>status bar</b> will contain the <b>Review</b> menu option.
    </p>
    <p>
        In case the <em>edit</em> parameter is set to <b>true</b> and the <em>review</em> parameter is also set to <b>true</b>, the user will be able to edit the document, accept or reject the changes and switch to the review mode him/herself.
    </p>
    <img class="screenshot max-width-832" alt="Reviewing" src="<%= Url.Content("~/content/img/editor/accept_reject.png") %>" />
    <p>
        In case the <em>edit</em> parameter is set to <b>false</b> and the <em>review</em> parameter is set to <b>true</b>, the document will be available for reviewing only.
    </p>
    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": false,
            "review": true
        },
        ...
    },
    ...
});
</pre>
    <div class="note">Please note that the document review will only be available for the document editor if the <a href="<%= Url.Action("config/editor") %>#mode">mode</a> parameter is set to <b>edit</b>.</div>

    <h2 id="group-rights" class="copy-link">Differentiation of reviewing rights by groups</h2>
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
                Specify the access rights using the <a href="<%= Url.Action("config/document/permissions") %>#reviewGroups">reviewGroups</a> parameter in the permissions section of the editor initialization.
            </p>
            <div class="note">
                If the <b>reviewGroups</b> parameter is specified in the editor config, the access rights to reviewing all changes are disabled.
                Otherwise, if the current user does not belong to any of the groups, he or she can review documents of all groups.
            </div>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "reviewGroups": ["Group1", "Group2"],
            ...
        }
        ...
    },
    ...
});
</pre>
            <p>
                <em>["Group1", "Group2"]</em> means that user can review changes made by users from <em>Group1</em> and <em>Group2</em>.
            </p>
            <p>
                The <a href="<%= Url.Action("config/document/permissions") %>#reviewGroups">reviewGroups</a> parameter can take the value of an empty group.
                This means that the user can review changes made by users who do not belong to any of the groups (for example, the document that is reviewed in third-party editors).
            </p>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "reviewGroups": ["Group2", ""],
            ...
        }
        ...
    },
    ...
});
</pre>
            <p>
                <em>["Group2", ""]</em> means that user can review changes made by users from <em>Group2</em> and users who do not belong to any of the groups.
            </p>
        </li>
    </ol>
</asp:Content>
