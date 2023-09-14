<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Basic concepts
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Basic concepts</span>
    </h1>

    <span class="pvl_product">ONLYOFFICE Document Server</span><span class="pvl_version">v<%= Products.Get("editors").Version %></span>

    <p class="dscr">
        <a href="<%= Url.Action("getdocs") %>">ONLYOFFICE Docs</a> is an open-source office suite that includes editors for text documents, spreadsheets, presentations and fillable forms. 
        It provides the following features:
    </p>
    <ul>
        <li>creating, editing and viewing text documents, spreadsheets, presentations and fillable forms;</li>
        <li>collaborating on files with other teammates in real time.</li>
    </ul>
    <p>ONLYOFFICE Docs also supports the <b>WOPI protocol</b> that is used to integrate your application with an online office. 
    Further information about WOPI can be found <a href="<%= Url.Action("wopi") %>">here</a>.</p>

    <p><b>ONLYOFFICE Docs API</b> is used to let the developers integrate the ONLYOFFICE Document/Spreadsheet/Presentation Editors into their own web sites and setup and manage the editors.</p>

    <p>The API JavaScript file can normally be found in the following editors folder:</p>
    <p><b>https://documentserver/web-apps/apps/api/documents/api.js</b></p>
    <p>Where <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>
    <p>The target HTML file where the editors are to be embedded need to have a placeholder <em>div</em> tag, where all the information about the editor parameters will be passed:</p>

    <pre>
&lt;div id=&quot;placeholder&quot;&gt;&lt;/div&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;https://documentserver/web-apps/apps/api/documents/api.js&quot;&gt;&lt;/script&gt;
</pre>

    <p>The page code containing the changeable parameters looks the following way:</p>

    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", config);
</pre>

    <p>Where <em>config</em> is an object:</p>

    <pre>
config = {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "callbackUrl": "https://example.com/url-to-callback.ashx"
    }
};
</pre>
    <p>
        Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </p>

    <p>From now the <i>docEditor</i> object can be used to call the <b>document editor</b> <a href="<%= Url.Action("methods") %>">Methods</a>.</p>

    <p>
        The example above includes all the parameters necessary for Document Server correct startup.
        There are additional non-obligatory parameters though which can be changed to achieve different goals with your document (change access rights for the document, display different information about the document, etc.).
        See the <a href="<%= Url.Action("advanced") %>">Advanced parameters</a> section to find out what these parameters are and how you can change them.
    </p>

    <p>To prevent the substitution of important parameters, add an encrypted signature to the requests in the form of <a href="<%= Url.Action("signature/") %>">token</a>.</p>

    <h2>Get help</h2>

    <p>If you have any questions about ONLYOFFICE Docs, try to find them in the <a href="<%= Url.Action("faq") %>">FAQ</a> section first.</p>
    <p>You can request a feature or report a bug by posting an issue on <a href="https://github.com/ONLYOFFICE/DocumentServer/issues" target="_blank">GitHub</a>.</p>
    <p>You can also ask our developers on <a href="https://forum.onlyoffice.com/c/document-api/39" target="_blank">ONLYOFFICE forum</a> (registration required).</p>
</asp:Content>
