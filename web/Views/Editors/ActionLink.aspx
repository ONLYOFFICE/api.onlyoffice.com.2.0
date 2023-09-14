<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Action link
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Action link</span>
    </h1>
    <p class="dscr">The reference figure and the steps below explain the process of working with links in ONLYOFFICE Document Server.</p>
    <img class="screenshot max-width-832" alt="Action link" src="<%= Url.Content("~/content/img/editor/actionLink-create.png") %>" />
    <ol>
        <li>The user sends a request to get a link to the document which contains a bookmark in the <b>document editor</b>.</li>
        <li>The <b>document editor</b> sends the request to the <b>document manager</b> where the software integrators create the link.</li>
        <li>The <b>document manager</b> sends the link back to the <b>document editor</b> where the link is displayed.</li>
    </ol>

    <h2 id="apply" class="copy-link">How this can be done in practice</h2>
    <ol>
        <li>Create an <em>html</em> file to <a href="<%= Url.Action("open") %>#apply">Open the document</a>.</li>
        <li>
            <p>
                Specify the event handler for the <em>Get link</em> button to be displayed in the bookmark editing menu in the configuration script for Document Editor initialization.
                When the <a href="<%= Url.Action("config/events") %>#onMakeActionLink">onMakeActionLink</a> event is called, the user request is sent to the software integrators which create the link in the document storage service.
            </p>
            <img alt="Action link" src="<%= Url.Content("~/content/img/editor/onMakeActionLink.png") %>" />
            <pre>
var onMakeActionLink = function (event){
    var ACTION_DATA = event.data;
    ...
    var link = GENERATE_LINK(ACTION_DATA);
    docEditor.setActionLink(link);
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onMakeActionLink": onMakeActionLink,
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>
                In order to give the user the link to the document which contains a bookmark, the software integrators send the link to the <a href="<%= Url.Action("methods") %>#setActionLink">setActionLink</a> method:
            </p>
            <pre>
docEditor.setActionLink(link);
</pre>
        </li>
    </ol>

    <h2 id="apply" class="copy-link">Opening the bookmark</h2>
    <img alt="Action link" src="<%= Url.Content("~/content/img/editor/actionLink-open.png") %>" />
    <ol>
        <li>The user follows the link in the <b>document manager</b>.</li>
        <li>The <b>document manager</b> sends the initialization <em>editorConfig</em> to the <b>document editor</b>.</li>
        <li>The <b>document editor</b> scrolls the document to the bookmark.</li>
    </ol>
    <p>
        When the user follows the link, the <b>document editor</b> sends the initialization <em>editorConfig</em> to the <b>document editing service</b>.
        The ACTION_DATA received from the <a href="<%= Url.Action("config/events") %>#onMakeActionLink">onMakeActionLink</a> event is specified in the <a href="<%= Url.Action("config/editor") %>#actionLink">data.actionLink</a> parameter of the <em>editorConfig</em>:
    </p>
    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "actionLink": ACTION_DATA,
        ...
    },
    ...
});
</pre>
    <div class="note">The link is generated in the same way when <a href="<%= Url.Action("mentions") %>#apply">mentioning</a> users in the comments.</div>
</asp:Content>
