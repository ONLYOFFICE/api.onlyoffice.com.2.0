<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Opening File
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Opening file</span>
    </h1>
    <p class="dscr">The reference figure and the steps below explain the process of opening a document in ONLYOFFICE Document Server.</p>
    <img alt="Opening File" src="<%= Url.Content("~/content/img/editor/opening.svg") %>" />
    <ol>
        <li>The user uses the <b>document manager</b> (found in his/her browser) to open the document for viewing or editing.
            <div class="note">The browser <b>document manager</b> receives the list of all documents available to the user from the <b>document storage service</b>.</div>
        </li>
        <li>The document identifier and the link to it at the <b>document storage service</b> are sent using the <a href="<%= Url.Action("basic") %>">JavaScript API</a> to the <b>document editor</b>.</li>
        <li>
            The <b>document editor</b> forms a request to the <b>document editing service</b> for document opening.
            The <b>document editor</b> uses the document identifier and its link received from the <b>document manager</b> (at step 2).
        </li>
        <li>
            The <b>document editing service</b> downloads the document file from the <b>document storage service</b> using the ID and link provided.
            At this step the <a href="<%= Url.Action("conversion") %>">conversion</a> of the file into Office Open XML format is also performed for the <b>document editor</b> better performance and formats compatibility.
        </li>
        <li>When ready the <b>document editing service</b> transfers the document file to the browser-based <b>document editor</b>.</li>
        <li>The <b>document editor</b> displays the document file and/or (in case the appropriate rights are provided) allows its editing.</li>
    </ol>
    <p>After the editing is finished, the <a href="<%= Url.Action("save") %>">document saving</a> process takes place.</p>

    <h2 id="apply" class="copy-link">How this can be done in practice</h2>
    <ol>
        <li>Create an empty <em>html</em> file.</li>
        <li>Add the <em>div</em> element as shown below.
            <pre>&lt;div id=&quot;placeholder&quot;&gt;&lt;/div&gt;</pre>
        </li>
        <li>Specify your ONLYOFFICE Document Server link with the JavaScript API that will be used for your website.
            <pre>&lt;script type=&quot;text/javascript&quot; src=&quot;https://documentserver/web-apps/apps/api/documents/api.js&quot;&gt;&lt;/script&gt;</pre>
            Where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.
        </li>
        <li>Add the script initializing the <b>Document Editor</b> for the <em>div</em> element with the configuration for the document you want to open.
            Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links. Otherwise, an error will occur.
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50IFRpdGxlLmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCJ9.7IpEJxdOvBQ0kJ8l6ZegIV4tX5vsPbZZCDDVmcFROXc"
});
</pre>
            Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        </li>
        <li>Open your <em>html</em> file in the browser.</li>
    </ol>
</asp:Content>
