<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Inline editors
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Inline editors</span>
    </h1>
    <p class="dscr">The steps below explain the process of connecting several editors to the same html page in ONLYOFFICE Document Server.</p>
    <div class="note">Simultaneous work with several editors is available starting from version 5.5.</div>
    <img alt="Inline editors" src="<%= Url.Content("~/content/img/editor/inlineEditors.png") %>" />
    <ol>
        <li>Create an empty <em>html</em> file.</li>
        <li>
            <p>
                Specify your ONLYOFFICE Document Server link with the JavaScript API that will be used for your website:
            </p>
            <pre>&lt;script type=&quot;text/javascript&quot; src=&quot;https://documentserver/web-apps/apps/api/documents/api.js&quot;&gt;&lt;/script&gt;</pre>
            <p>
                Where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.
            </p>
        </li>
        <li>
            <p>
                Add the <em>div</em> element as shown below.
                In order to connect several editors to the same <em>html</em> page, each of them can be initialized separately:
            </p>
            <pre>
&lt;div id="placeholder1"&gt;&lt;/div&gt;
&lt;div id="placeholder2"&gt;&lt;/div&gt;
&lt;div id="placeholder3"&gt;&lt;/div&gt;
...
</pre>
        </li>
        <li>
            <p>
                Add the script initializing the <b>Document Editor</b> for the <em>div</em> element with the configuration for the document you want to open.
                Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links. Otherwise, an error will occur.
            </p>
            <p>Each editor has its own initialization script:</p>
            <pre>
var documentEditor = new DocsAPI.DocEditor("placeholder1", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50IFRpdGxlLmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCJ9.7IpEJxdOvBQ0kJ8l6ZegIV4tX5vsPbZZCDDVmcFROXc"
});

var spreadsheetEditor = new DocsAPI.DocEditor("placeholder2", {
    "document": {
        "fileType": "xlsx",
        "key": "af86C7e71Ca8",
        "title": "Example Spreadsheet Title.xlsx",
        "url": "https://example.com/url-to-example-spreadsheet.xlsx"
    },
    "documentType": "cell",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6Inhsc3giLCJrZXkiOiJhZjg2QzdlNzFDYTgiLCJ0aXRsZSI6IkV4YW1wbGUgU3ByZWFkc2hlZXQgVGl0bGUueGxzeCIsInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtc3ByZWFkc2hlZXQueGxzeCJ9LCJkb2N1bWVudFR5cGUiOiJjZWxsIn0.8CklPIjYSEkgM7swGAC7-85ICcq_42be3WTWNOuvhlg"
});

var presentationEditor = new DocsAPI.DocEditor("placeholder3", {
    "document": {
        "fileType": "pptx",
        "key": "bv48M5r64Sf9",
        "title": "Example Presentation Title.pptx",
        "url": "https://example.com/url-to-example-presentation.pptx"
    },
    "documentType": "slide",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6InBwdHgiLCJrZXkiOiJidjQ4TTVyNjRTZjkiLCJ0aXRsZSI6IkV4YW1wbGUgUHJlc2VudGF0aW9uIFRpdGxlLnBwdHgiLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXByZXNlbnRhdGlvbi5wcHR4In0sImRvY3VtZW50VHlwZSI6InNsaWRlIn0.FKaDWfJE-OuODhtpq-8Qv6BdDy_evgdpaBw616T7zOs"
});
...
</pre>
            <p>
                Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            </p>
        </li>
        <li>
            <p>
                In order to finish editing, the <a href="<%= Url.Action("methods") %>#destroyEditor">destroyEditor</a> method must be called to close the required editor:
            </p>
            <pre>
documentEditor.destroyEditor();
spreadsheetEditor.destroyEditor();
presentationEditor.destroyEditor();
...
</pre>
        </li>
        <li>
            <p>
                Open your <em>html</em> file in the browser.
            </p>
        </li>
    </ol>
</asp:Content>
