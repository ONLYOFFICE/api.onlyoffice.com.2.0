<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Comparing documents
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Comparing documents</span>
    </h1>
    <p class="dscr">The reference figure and the steps below explain the process of comparing documents in ONLYOFFICE Document Server.</p>
    <img alt="Comparing documents" src="<%= Url.Content("~/content/img/editor/compare.png") %>" />
    <ol>
        <li>The user opens the document for viewing or editing using the <b>document manager</b> (found in his/her browser).</li>
        <li>The <b>document storage service</b> sends the document information using the <a href="<%= Url.Action("basic") %>">JavaScript API</a> 
            to the <b>document editor</b> and specifies the possibility to choose the file from the <b>document manager</b>.</li>
        <li>The file is <a href="<%= Url.Action("open") %>">opened</a> for editing.</li>
        <li>The user sends a request to get a list of storage documents for comparing by clicking the <em>Document from Storage</em> button in the <b>document editor</b>.</li>
        <li>The <b>document editor</b> informs the <b>document manager</b> about the request.</li>
        <li>The <b>document manager</b> sends the document to the <b>document editor</b> for comparing.</li>
    </ol>

    <h2 id="apply" class="copy-link">How this can be done in practice</h2>
    <ol>
        <li>Create an <em>html</em> file to <a href="<%= Url.Action("open") %>#apply">Open the document</a>.</li>
        <li>
            <p>
                Specify the event handler for the <em>Document from Storage</em> button to be displayed in the <em>Compare</em> options 
                in the configuration script for Document Editor initialization. When the user clicks the button, 
                the <a href="<%= Url.Action("config/events") %>#onRequestCompareFile">onRequestCompareFile</a> event is called and they can select the document for comparing from the Storage.
            </p>
            <img class="screenshot-width-832" alt="Comparing files" src="<%= Url.Content("~/content/img/editor/onRequestCompareFile.png") %>" />
            <pre>
var onRequestCompareFile = function() {
    docEditor.setRevisedFile({
        "fileType": "docx",
        "url": "https://example.com/url-to-example-document.docx"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestCompareFile": onRequestCompareFile,
        ...
    },
    ...
});           
</pre>
        </li>
        <li>
            <p>
                In order to select a document for comparing, the <a href="<%= Url.Action("methods") %>#setRevisedFile">setRevisedFile</a> method must be called:
            </p>
            <pre>
docEditor.setRevisedFile({
    "fileType": "docx",
    "url": "https://example.com/url-to-example-document.docx"
});                     
</pre>
        </li>
        <li>
            <p>
                After that the user can accept or reject the changes using the corresponding buttons on the top toolbar.
            </p>
            <img class="screenshot-width-832" alt="Accept changes" src="<%= Url.Content("~/content/img/editor/compare-documents.png") %>" />
        </li>
    </ol>
</asp:Content>
