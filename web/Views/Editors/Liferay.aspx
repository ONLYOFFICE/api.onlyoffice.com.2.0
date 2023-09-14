<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE Connector for Liferay
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ONLYOFFICE Connector for Liferay</span>
    </h1>

    <p>This <a href="https://github.com/ONLYOFFICE/onlyoffice-liferay" target="_blank">plugin</a> enables users to edit office documents from <a href="https://www.liferay.com/" target="_blank">Liferay</a> using ONLYOFFICE Docs.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently, the following document formats can be opened and edited with this plugin: DOCX, XLSX, PPTX, DOCXF, OFORM.</li>
        <li>The following formats are available for viewing only: ODT, ODS, ODP, DOC, XLS, PPT, PDF.</li>
        <li>The plugin will create a new <b>ONLYOFFICE Edit/View</b> menu option within the <b>Documents and Media</b> section for Office documents. 
            This allows multiple users to collaborate in real time and to save back those changes to Liferay.</li>
    </ul>

    <h2 id="installing-doc-serv" class="copy-link">Installing ONLYOFFICE Docs</h2>

    <p>
        You will need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Liferay and any end clients.
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>.
        ONLYOFFICE Docs must also be able to POST to Liferay directly.
    </p>

    <p>The easiest way to start an instance of ONLYOFFICE Docs is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="installing-plugin" class="copy-link">Installing ONLYOFFICE Connector for Liferay</h2>

    <p>
        Either install it from <a href="https://web.liferay.com/marketplace/-/mp/application/171169174" target="_blank">Liferay Marketplace</a> 
        or if you are building the connector by yourself, simply put compiled <b>.jar</b> file from <em>build\libs</em> folder to <em>/opt/liferay/deploy</em>. 
        Liferay will install it automatically.
    </p>


    <h2 id="configuring" class="copy-link">Configuring ONLYOFFICE Connector for Liferay</h2>

    <p>
        In order to configure connector, you must navigate to <b>System Settings</b> (<b>Control Panel -> Configuration -> System Settings</b>).
        In <b>Platform</b> section click the <b>Connectors</b> category and select <b>ONLYOFFICE</b>.
    </p>
    <p>Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity.
        Specify your own <b>Secret key</b> on the Liferay <b>System Settings</b> page. In the ONLYOFFICE Docs <a href="/editors/signature/">config file</a>, specify the same secret key and enable the validation.</p>


    <h2 id="compiling" class="copy-link">Compiling ONLYOFFICE Connector for Liferay</h2>

    <p>
        Simply run <i>gradle build</i>.
        Output <b>.jar</b> will be placed inside the <i>build/libs</i> directory.
    </p>


    <h2 id="how-it-works" class="copy-link">How it works</h2>

    <p>The ONLYOFFICE integration follows the API documented <a href="<%= Url.Action("basic") %>">here</a>.</p>
    <ol>
        <li>User navigates to the <b>Documents and Media</b> section within Liferay and selects the <b>Edit in ONLYOFFICE</b> action.</li>
        <li>
            <p>Liferay prepares a JSON object for the Document Server with the following properties:</p>
            <ul>
                <li><b>url</b>: the URL that ONLYOFFICE Docs uses to download the document,</li>
                <li><b>callbackUrl</b>: the URL that ONLYOFFICE Docs informs about status of the document editing;</li>
                <li><b>key</b>: the <em>fileVersionId</em> to instruct ONLYOFFICE Docs whether to download the document again or not;</li>
                <li><b>title</b>: the document title (name).</li>
            </ul>
        </li>
        <li>The client browser makes a request to the JavaScript library from ONLYOFFICE Docs and sends ONLYOFFICE Docs the DocEditor configuration with the above properties.</li>
        <li>Then ONLYOFFICE Docs downloads the document from Liferay and the user begins editing.</li>
        <li>ONLYOFFICE Docs sends a POST request to <i>callbackUrl</i> to inform Liferay that a user is editing the document.</li>
        <li>Liferay locks the document, but still allows other users with write access to collaborate in real time with ONLYOFFICE Docs by leaving the Action present.</li>
        <li>When all users and client browsers are done with editing, they close the editing window.</li>
        <li>After <a href="<%= Url.Action("save") %>#savedelay">10 seconds</a> of inactivity, ONLYOFFICE Docs sends a POST to <i>callbackUrl</i> letting Liferay know that the clients have finished editing the document and closed it.</li>
        <li>Liferay downloads a new version of the document, replacing the old one.</li>
    </ol>


    <br />
    <p>Download the ONLYOFFICE Connector for Liferay <a href="https://github.com/ONLYOFFICE/onlyoffice-liferay" target="_blank">here</a>.</p>

</asp:Content>
