<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    HumHub ONLYOFFICE connector
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">HumHub ONLYOFFICE connector</span>
    </h1>

    <p>This <a href="https://github.com/ONLYOFFICE/onlyoffice-humhub" target="_blank">plugin</a> enables users to edit office documents from <a href="https://www.humhub.com/" target="_blank">HumHub</a> using ONLYOFFICE Docs.</p>
    <p>The plugin is available in the official <a href="https://marketplace.humhub.com/module/onlyoffice" target="_blank">HumHub Marketplace</a>.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently, the following document formats can be opened and edited with this plugin: DOCX, XLSX, PPTX, DOCXF, OFORM.</li>
        <li>The following formats are available for viewing only: ODT, ODS, ODP, DOC, XLS, PPT, TXT, PDF.</li>
        <li>The following formats can be converted into OOXML: ODT, ODS, ODP, DOC, XLS, PPT, TXT, CSV.</li>
        <li>The plugin will create a new <b>Edit/View</b> menu option for Office documents. 
            This allows multiple users to collaborate in real time and to save back those changes to HumHub.</li>
    </ul>

    <h2 id="installing-doc-serv" class="copy-link">Installing ONLYOFFICE Docs</h2>

    <p>
        You will need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from HumHub and any end clients.
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>. ONLYOFFICE Docs must also be able to POST to HumHub directly.
    </p>

    <p>The easiest way to start an instance of ONLYOFFICE Docs is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="installing-plugin" class="copy-link">Installing HumHub ONLYOFFICE connector</h2>

    <p>
        Either install it from <a href="https://marketplace.humhub.com/module/onlyoffice" target="_blank">HumHub Marketplace</a> or simply clone the <a href="https://github.com/ONLYOFFICE/onlyoffice-humhub" target="_blank">repository</a> inside one of the folder specified by <em>moduleAutoloadPaths</em> parameter.
        Please see <a href="https://docs.humhub.org/docs/develop/environment#module-loader-path" target="_blank">HumHub Documentation</a> for more information.
    </p>


    <h2 id="configuring" class="copy-link">Configuring HumHub ONLYOFFICE connector</h2>

    <p>
        In order to configure plugin, you must navigate to <b>Administation -> Modules</b>.
        Find ONLYOFFICE plugin and click <b>Configure</b>.
    </p>
    <p>Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity.
        Specify your own <b>JWT Secret</b> on the HumHub configuration page. In the ONLYOFFICE Docs <a href="/editors/signature/">config file</a>, specify the same secret key and enable the validation.</p>


    <h2 id="how-it-works" class="copy-link">How it works</h2>

    <p>The ONLYOFFICE integration follows the API documented <a href="<%= Url.Action("basic") %>">here</a>.</p>
    <ol>
        <li>When creating a new file, the user will be provided with <b>Document</b>, <b>Spreadsheet</b> or <b>Presentation</b> options in the <b>Create document</b> menu.</li>
        <li>The browser invokes the <em>index</em> method in the <em>/controllers/CreateController.php</em> controller.</li>
        <li>Or, when opening an existing file, the user will be provided with <b>View document</b> or <b>Edit document</b> depending on an extension.</li>
        <li>A popup is opened and the <em>index</em> method of the <em>/controllers/OpenController.php</em> controller is invoked.</li>
        <li>
            <p>The app prepares a JSON object with the following properties:</p>
            <ul>
                <li><b>url</b> - the URL that ONLYOFFICE Docs uses to download the document;</li>
                <li><b>callbackUrl</b> - the URL that ONLYOFFICE Docs informs about status of the document editing;</li>
                <li><b>key</b> - the random MD5 hash to instruct ONLYOFFICE Docs whether to download the document again or not;</li>
                <li><b>title</b> - the document title (name);</li>
                <li><b>id</b> - the user identification;</li>
                <li><b>name</b> - the user name.</li>
            </ul>
        </li>
        <li>HumHub takes this object and constructs a page from <em>views/open/index.php</em> template, filling in all of those values so that the client browser can load up the editor.</li>
        <li>The client browser makes a request to the JavaScript library from ONLYOFFICE Docs and sends ONLYOFFICE Docs the DocEditor configuration with the above properties.</li>
        <li>Then ONLYOFFICE Docs downloads the document from HumHub and the user begins editing.</li>
        <li>ONLYOFFICE Docs sends a POST request to <em>callbackUrl</em> to inform HumHub that a user is editing the document.</li>
        <li>When all users and client browsers are done with editing, they close the editing window.</li>
        <li>After <a href="<%= Url.Action("save") %>#savedelay">10 seconds</a> of inactivity, ONLYOFFICE Docs sends a POST to <em>callbackUrl</em> letting HumHub know that the clients have finished editing the document and closed it.</li>
        <li>HumHub downloads a new version of the document, replacing the old one.</li>
    </ol>

    <br />
    <p>Download the HumHub ONLYOFFICE connector <a href="https://github.com/ONLYOFFICE/onlyoffice-humhub" target="_blank">here</a>.</p>

</asp:Content>
