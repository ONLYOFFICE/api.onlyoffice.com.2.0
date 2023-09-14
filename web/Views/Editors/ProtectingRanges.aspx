<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Protecting ranges
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Protecting ranges</span>
    </h1>
    <p class="dscr">The reference figure and the steps below explain the process of protecting ranges in spreadsheets in ONLYOFFICE Document Server.</p>
    <img alt="Protect ranges" src="<%= Url.Content("~/content/img/editor/protect-ranges-scheme.svg") %>" />
    <ol>
        <li>The user opens <em>Protection -> Protect Range</em> in the <b>document editor</b>, clicks <em>New</em>, and starts typing the user name in the <em>Who can edit</em> field.</li>
        <li>The <b>document editor</b> sends a request to the <b>document manager</b> for a list of users to allow editing the specified sheet range.</li>
        <li>The <b>document manager</b> sends the list of users to the <b>document editor</b> where this list will be displayed under the <em>Who can edit</em> field.</li>
        <li>The user specifies the range title and address in the corresponding fields of the <em>New Range</em> window in the <b>document editor</b> and clicks <em>OK</em> to add this range to the list of protected ranges.</li>
    </ol>

    <h2 id="apply" class="copy-link">How this can be done in practice</h2>
    <ol>
        <li>Create an empty <em>html</em> file to <a href="<%= Url.Action("open") %>#apply">Open the document</a>.</li>
        <li>
            <p>
                In the configuration script for Document Editor initialization, specify the event handler to display the list of users for granting the access rights
                to edit the specified sheet range. When the user opens <em>Protection -> Protect Range</em>, clicks <em>New</em>, and starts typing in the <em>Who can edit</em> field,
                the <a href="<%= Url.Action("config/events") %>#onRequestUsers">onRequestUsers</a> event is called and the user can select other users to allow them to edit this range.
                The <em>data.c</em> parameter with the <em>protect</em> operation type is passed in this event.
            </p>
            <img alt="Grant access" src="<%= Url.Content("~/content/img/editor/protect-range.png") %>" />
            <pre>
var onRequestUsers = function(event) {
    docEditor.setUsers({
        "c": event.data.c,
        "users": [
            {
                "email": "john@example.com",
                "id": "78e1e841",
                "name": "John Smith"
            },
            {
                "email": "kate@example.com",
                "id": "F89d8069ba2b",
                "name": "Kate Cage"
            },
            ...
        ]
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestUsers": onRequestUsers,
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>
                In order to set the users list under the <em>Who can edit</em> field, the <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> method must be called:
            </p>
            <pre>
docEditor.setUsers({
    "c": "protect",
    "users": [
        {
            "email": "john@example.com",
            "id": "78e1e841",
            "name": "John Smith"
        },
        {
            "email": "kate@example.com",
            "id": "F89d8069ba2b",
            "name": "Kate Cage"
        },
        ...
    ]
});
</pre>
            <p>
                Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
                See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
            </p>
        </li>
    </ol>

</asp:Content>
