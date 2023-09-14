<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Document Server FAQ: <br />
        Managing versions questions</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="versions_1">
    <dt>Which methods can be used when working with the document history events?</dt>
    <dd>
        <p>The document history can be shown using the <a href="<%= Url.Action("config/events") %>#onRequestHistory">onRequestHistory</a> function (with the <em>events.onRequestHistory</em> event). Unless you use them, the <b>Version History</b> menu option (<b>Version History</b> button in the <b>Collaboration</b> tab) is not shown in the Document Server interface.</p>
        <p>Once you call this function in the configuration file (together with the <a href="<%= Url.Action("methods") %>#refreshHistory">refreshHistory</a> method), the menu option and button are shown and the program will display the existing document versions. The data which is shown in the document version history, can be taken from the <b>document editing service</b> <a href="<%= Url.Action("callback") %>#status-2">callback</a>.</p>
        <p>So the implementation of the document version history display should look like this:</p>
        <ol>
            <li>The callback handler receives the data in the response from the <b>document editing service</b> with <em>status</em> <b>2</b> (which means that the all the users of the document closed it and the current version has been compiled). This response will look something like this:
                <pre>{
    "key": "2745492410",
    "status": 2,
    "users": ["F89d8069ba2b"],
    "url": "https://documentserver/url-to-edited-document.docx",
    "history": {
        "serverVersion": serverVersion,
        "changes": changes
    }
}</pre>
            </li>
            <li>The callback handler parses the received data and passes it to the configuration file (it does not need to parse the <em>history.serverVersion</em> and <em>history.changes</em> data which can be used by the <em>onRequestHistory</em> function as is).</li>
            <li>The configuration file must have the following sections present: <em>events.onRequestHistory</em> and the <em>onRequestHistory</em> function itself:
                <pre>var onRequestHistory = function() {
    docEditor.refreshHistory({
        "currentVersion": 2,
        "history": [
            {
                "changes": changes,
                "created": "2019-02-01 3:03 PM",
                "key": "2745492410",
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
        ]
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestHistory": onRequestHistory,
        ...
    },
    ...
});</pre>
                Where 
                <ul>
                    <li><em>currentVersion</em> is the number of the latest version which will be displayed in the editor interface as the current one;</li>
                    <li><em>history</em> is the array of objects, each representing a document saved single version:
                        <ul>
                            <li><em>history.changes</em> and <em>history.serverVersion</em> is the data received from the <b>document editing service</b>;</li>
                            <li><em>history.user.id</em> is the ID of the user who was the last to save changes to the document for the specified version;</li>
                            <li><em>history.created</em> is the time of the document specified version compilation (corresponds to when <em>status</em> <b>2</b> was received);</li>
                            <li><em>history.version</em> is the number of the specified version as will be displayed in the version history section of the document editor interface.</li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li>The document is opened with all the above parameters specified. Switch to the <b>File</b> > <b>Version History</b> menu option (or <b>Collaboration</b> > <b>Version History</b>) and there the version data will be displayed.</li>
        </ol>
        <div class="note">The <em>history.changes</em> objects are displayed as smaller changes (revisions) within the versions.</div>
    </dd>
</dl>
<dl class="faq_block" id="versions_2">
    <dt>How to display a document with highlighted changes?</dt>
    <dd>
        <p>The <b>document editing service</b> saves all the interim changes of the document into separate files and, once the version is compiled and <em>status</em> <b>2</b> is received, the link to the archive with all the changes between the versions is also sent to the callback handler.</p>
        <p>So, if you want to additionally show the difference between the versions, you will also have to use the <a href="<%= Url.Action("config/events") %>#onRequestHistoryData">onRequestHistoryData</a> function (with the <em>events.onRequestHistoryData</em> event) which must contain data also returned by the <b>document editing service</b> <a href="<%= Url.Action("callback") %>#changeshistory">callback</a>.</p>
        <p>In addition to the actions described in the <a href="#versions_1">above question</a> you will need to:</p>
        <ul>
            <li>Parse the <em>changesurl</em> parameter from the <b>document editing service</b> received response with <em>status</em> <b>2</b>:
                <pre>{
    "changesurl": "https://documentserver/url-to-changes.zip",
    "key": "2745492410",
    "status": 2,
    "users": ["F89d8069ba2b"],
    "url": "https://documentserver/url-to-edited-document.docx",
    "history": {
        "serverVersion": serverVersion,
        "changes": changes
    }
}</pre>
            </li>
            <li>Add the <em>onRequestHistoryData</em> function to the configuration file together with the <em>setHistoryData</em> method and <em>events.onRequestHistoryData</em> event:
                <pre>var onRequestHistoryData = function(event) {
    var version = event.data;
    docEditor.setHistoryData({
        "changesUrl": "https://example.com/url-to-changes.zip",
        "key": "2745492410",
        "previous": {
            "key": "af86C7e71Ca8",
            "url": "https://example.com/url-to-the-previous-version-of-the-document.docx"
        },
        "url": "https://documentserver/url-to-edited-document.docx",
        "version": version
    })
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestHistoryData": onRequestHistoryData,
        ...
    },
    ...
});</pre>
                The object containing the valid links to the current document version (<em>url</em>) and to the previous document version (<em>previous.url</em>) as well as the IDs (<em>key</em> and <em>previous.key</em>) must be passed to the configuration file. <em>changesUrl</em> archive file must be also available and downloadable from the browser to be able to display the changes.
            </li>
        </ul>
    </dd>
</dl>
<dl class="faq_block" id="versions_3">
    <dt>Why is a new version not shown in the document history after I forcefully save a document?</dt>
    <dd>
        <p>ONLYOFFICE Docs highlights the changes made from the beginning of the current document session, not from the beginning of the document version.
        And even if several document versions are created during one session, all changes from this session will be highlighted.
        Therefore, you cannot see the document versions created with the <a href="<%= Url.Action("save") %>#forcesave">force saving option</a> in the document history.</p>
    </dd>
</dl>