<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Renaming Files
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Renaming files</span>
    </h1>
    <p class="dscr">The reference figure and the steps below explain the process of renaming a document in ONLYOFFICE Document Server.</p>
    <img alt="Renaming File" src="<%= Url.Content("~/content/img/editor/rename.svg") %>" />
    <ol>
        <li>The user gives a new name to the document in the <b>document editor</b>.</li>
        <li>The <b>document editor</b> informs the <b>document manager</b> about the new name of the document.</li>
        <li>The <b>document manager</b> sends the new name of the document to the <b>document storage service</b> where the software integrators rename the document.</li>
        <li>The <b>document storage service</b> informs the <b>document editing  service</b> about the new name of the document.</li>
        <li>The <b>document editing  service</b> sends the new name of the document to the <b>document editor</b> of each user.</li>
        <li>Now the new name becomes visible to all users.</li>
    </ol>

    <h2 id="apply" class="copy-link">How this can be done in practice</h2>
    <ol>
        <li>Create an <em>html</em> file to <a href="<%= Url.Action("open") %>#apply">Open the document</a>.</li>
        <li>
            <p>
                Specify the event handler for opening the <em>Rename...</em> menu in the configuration script for Document Editor initialization.
                When the <a href="<%= Url.Action("config/events") %>#onRequestRename">onRequestRename</a> event is called, the new name of the document without extension is sent to the software integrators which rename the document in the document storage service.
            </p>
            <img class="screenshot max-width-300" alt="Renaming File" src="<%= Url.Content("~/content/img/editor/onRequestRename.png") %>" />
            <pre>
var onRequestRename = function(event) {
    var title = event.data;
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestRename": onRequestRename,
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>
                In order to update the name of the document for all collaborative editors, send the request to the <a href="<%= Url.Action("command") %>">document command service</a>, using the <a href="<%= Url.Action("command/meta") %>">meta</a> value for the <em>c</em> parameter:
            </p>
            <pre>
{
    "c": "meta",
    "key": "Khirz6zTPdfd7",
    "meta": {
        "title": "Example Document Title.docx"
    }
}
</pre>
        </li>
        <li>
            <p>
                When the name of the document is changed via the <a href="<%= Url.Action("command/meta") %>">meta</a> command, the <a href="<%= Url.Action("config/events") %>#onMetaChange">onMetaChange</a> event must be called in the document editor of each user.
                This event sends the name of the document in the <em>data.title</em> parameter.
            </p>
            <pre>
var onMetaChange = function (event) {
    var title = event.data.title;
    ...
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onMetaChange": onMetaChange,
        ...
    },
    ...
});          
</pre>
        </li>
    </ol>
</asp:Content>
