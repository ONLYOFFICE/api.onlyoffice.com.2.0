<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Document History
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Document history</span>
    </h1>
    <p class="dscr">You can view the document history using the <b>document editor</b>.</p>
    <div class="note">The history is currently available for text document and presentation files.</div>

    <p>
        The document history is stored with the document storage service.
        The <b>document editor</b> displays the document history as a version list at the left-side panel.
        When you select a document version from the list it will be displayed for preview.
    </p>
    <ol>
        <li>The user clicks the <em>Version History</em> button while editing the document within the <b>document editor</b>.</li>
        <li>The <b>document editor</b> requests the list of the document versions from the <b>document storage service</b>.</li>
        <li>The <b>document storage service</b> sends the list of the document versions with the version number to be displayed.</li>
        <li>The <b>document editor</b> requests the information about the selected document version from the <b>document storage service</b>.</li>
        <li>The <b>document storage service</b> sends the link to the selected version of the document.</li>
        <li>The <b>document editor</b> displays the selected document version.</li>
        <li>When the user clicks another version in the document version list, the <b>document editor</b> requests the information about the version to be displayed anew.</li>
    </ol>

    <h2 id="apply" class="copy-link">How this can be done in practice</h2>
    <ol>
        <li>Create an <em>html</em> file to <a href="<%= Url.Action("open") %>#apply">Open the document</a>.</li>
        <li>
            <p>
                Specify the event handler for opening the <a href="<%= Url.Action("config/events") %>#onRequestHistory">version history</a> list in the configuration script for Document Editor initialization.
                When the <a href="<%= Url.Action("config/events") %>#onRequestHistory">onRequestHistory</a> event is called, the <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> method must be executed.
                This method contains document history for each document version, if the history parameter has been present for each version.
            </p>
            <pre>
var onRequestHistory = function() {
    docEditor.refreshHistory({
        "currentVersion": 2,
        "history": [
            {
                "created": "2010-07-06 10:13 AM",
                "key": "af86C7e71Ca8",
                "user": {
                    "id": "F89d8069ba2b",
                    "name": "Kate Cage"
                },
                "version": 1
            },
            {
                "created": "2010-07-07 3:46 PM",
                "key": "Khirz6zTPdfd7",
                "user": {
                    "id": "78e1e841",
                    "name": "John Smith"
                },
                "version": 2
            },
            ...
        ]
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestHistory": onRequestHistory,
        ...
    },
    ...
});
</pre>
            <img alt="Opening File" src="<%= Url.Content("~/content/img/editor/history_open.png") %>" />
        </li>
        <li>
            <p>
                In the configuration script for Document Editor initialization specify the event handler which will select the <a href="<%= Url.Action("config/events") %>#onRequestHistoryData">version from history</a>.
                When the <a href="<%= Url.Action("config/events") %>#onRequestHistoryData">onRequestHistoryData</a> event is called, the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method must be executed.
                This method contains the absolute URL to the file of the corresponding version.
            </p>
            <pre>
var onRequestHistoryData = function(event) {
    var version = event.data;
    docEditor.setHistoryData({
        "key": "Khirz6zTPdfd7",
        "url": "https://example.com/url-to-example-document.docx",
        "version": version
    })
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestHistoryData": onRequestHistoryData,
        ...
    },
    ...
});
</pre>
            <img alt="Opening File" src="<%= Url.Content("~/content/img/editor/history.png") %>" />
        </li>
        <li>Open your <em>html</em> file in the browser.</li>
        <li>Open the <em>Version History</em> option in the Document Editor menu.</li>
    </ol>
    
    <h2 id="apply-changes" class="copy-link">Opening the document history with changes highliting</h2>
    <p>
        If the document version was created with the <b>document editor</b>, then the document changes can be displayed when viewing the document history.
        The additional data must be saved to the <b>document storage service</b> when <a href="<%= Url.Action("save") %>">saving</a> the editing session beside the document versions themselves to achieve that.
        After editing in <b>document editor</b> the information about the changes during the editing session is sent together with the changed document:</p>
    <ul>
        <li>
            <p>
                <a href="<%= Url.Action("callback") %>#history">history</a> - this information allows to display the time and the author for each document version when you view the document history in the side panel.
                Must be sent as a property changes of the object sent as the argument to the <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> method.
            </p>
            <pre>
docEditor.refreshHistory({
    "currentVersion": 2,
    "history": [
        {
            "changes": changes,
            "created": "2010-07-06 10:13 AM",
            "key": "af86C7e71Ca8",
            "serverVersion": serverVersion,
            "user": {
                "id": "F89d8069ba2b",
                "name": "Kate Cage"
            },
            "version": 1
        },
        {
            "changes": changes,
            "created": "2010-07-07 3:46 PM",
            "key": "Khirz6zTPdfd7",
            "serverVersion": serverVersion,
            "user": {
                "id": "78e1e841",
                "name": "John Smith"
            },
            "version": 2
        },
        ...
    ],
});
</pre>
            <p>Where the <b>changes</b> is the <em>changes</em> from <a href="<%= Url.Action("callback") %>#history">the history object</a> returned after saving the document.</p>
            <p>Where the <b>serverVersion</b> is the <em>serverVersion</em> from <a href="<%= Url.Action("callback") %>#history">the history object</a> returned after saving the document.</p>
        </li>
        <li>
            <p>
                <a href="<%= Url.Action("callback") %>#changesurl">changesurl</a> - the absolute URL to the file with the document editing data used to show the changes corresponding to the specific document version.
                The file must be saved and its address must be sent as changesUrl parameter using the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method.
                The link to the previous document version (<em>previous.url</em>) must be added into the object.
            </p>
            <pre>
docEditor.setHistoryData({
    "changesUrl": "https://example.com/url-to-changes.zip",
    "key": "Khirz6zTPdfd7",
    "previous": {
        "key": "af86C7e71Ca8",
        "url": "https://example.com/url-to-the-previous-version-of-the-document.docx"
    },
    "url": "https://example.com/url-to-example-document.docx",
    "version": 2
});
</pre>
            <div id="changesurl-cors" class="note">
                The <em>changesurl</em> request is made in the browser from the added iframe with the <b>documentserver</b> domain, where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.
                For its correct work the cross-origin HTTP requests must be allowed (CORS).
                This can be achieved using the <em>Access-Control-Allow-Origin</em> header.
            </div>
            <img alt="changesurl" src="<%= Url.Content("~/content/img/editor/changesurl.png") %>" />
        </li>
    </ul>
</asp:Content>
