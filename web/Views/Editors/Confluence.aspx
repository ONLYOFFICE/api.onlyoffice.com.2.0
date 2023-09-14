<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Confluence ONLYOFFICE integration app
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Confluence ONLYOFFICE integration app</span>
    </h1>

    <p class="dscr">
        This <a href="https://github.com/ONLYOFFICE/onlyoffice-confluence" target="_blank">plugin</a> enables users to edit office documents from <a href="https://www.atlassian.com/software/confluence/" target="_blank">Confluence</a> using ONLYOFFICE Docs.
    </p>

    <p>The connector is available in the official <a href="https://marketplace.atlassian.com/1218214" target="_blank">Atlassian Marketplace</a>.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently, the following document formats can be edited or viewed: DOCX, XLSX, PPTX, DOCXF, OFORM.</li>
        <li>
            The plugin will create a new <b>Edit in ONLYOFFICE</b> menu option within the document library for Office documents. 
            This allows multiple users to collaborate in real time and to save back those changes to Confluence.
        </li>
        <li>Currently, the following document formats can be converted into OOXML: ODT, DOC, ODP, PPT, ODS, XLS.</li>
    </ul>
    
    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>
    <p>
        You will need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Confluence and any end clients.
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>.
        ONLYOFFICE Docs must also be able to POST to Confluence directly.
    </p>
    <p>The easiest way to start an instance of ONLYOFFICE Docs is to use <a href="https://github.com/ONLYOFFICE/Docker-DocumentServer" target="_blank">Docker</a>.</p>

    <h2 id="get-connector" class="copy-link">Installing Confluence ONLYOFFICE integration app</h2>
    <p>Upload the compiled <em>target/onlyoffice-confluence-plugin.jar</em> to Confluence on the <b>Manage add-ons</b> page.</p>
    <p>The latest compiled package files are available <a href="https://github.com/onlyoffice/onlyoffice-confluence/releases" target="_blank">here</a> 
        and on <a href="https://marketplace.atlassian.com/apps/1218214/onlyoffice-connector-for-confluence?tab=overview&hosting=datacenter" target="_blank">Atlassian Marketplace</a>.</p>
    <p>You could also install the app from Confluence administration panel:</p>
    <ol>
        <li>Log in to your Confluence instance as an administrator.</li>
        <li>Navigate to the <b>Manage add-ons</b> page.</li>
        <li>Click <b>Find new apps</b> or <b>Find new add-ons</b> on the left panel.</li>
        <li>
            Locate <b>ONLYOFFICE Connector for Confluence</b> using search.
            Results will include the add-on versions compatible with your Confluence instance.
        </li>
        <li>Click <b>Install</b> to download and install the app.</li>
        <li>Now you can click <b>Close</b> in the <b>Installed and ready to go</b> dialog.</li>
    </ol>

    <h2 id="configure" class="copy-link">Configuring Confluence ONLYOFFICE integration app</h2>
    <p>Find the uploaded <b>ONLYOFFICE Confluence connector</b> on the <b>Manage add-ons</b> page.
        Click <b>Configure</b> and enter the name of the server with ONLYOFFICE Docs installed:</p>
    <span class="commandline">https://documentserver/</span>
    <p>
        where the <b>documentserver</b> is the name of the server with <b>ONLYOFFICE Docs</b> installed.
        The address must be accessible from the user browser and from the Confluence server.
        The Confluence server address must also be accessible from <b>ONLYOFFICE Docs</b> for correct work.
    </p>
    <p>Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity.
        Specify your own <b>Secret key</b> on the Confluence administration page. In the ONLYOFFICE Docs <a href="/editors/signature/">config file</a>, specify the same secret key and enable the validation.</p>

    <h2 id="compile" class="copy-link">Compiling Confluence ONLYOFFICE integration app</h2>
    <p>If you plan to compile the Confluence ONLYOFFICE integration app yourself (e.g. edit the source code and compile it afterwards), follow these steps:</p>
    <ol>
        <li>
            <p>
                The stable Java version is necessary for the successful build. 
                If you do not have it installed, use the following commands to install <b>Open JDK 8</b>:
            </p>
            <span class="commandline">sudo apt-get update
sudo apt-get install openjdk-8-jdk</span>
        </li>
        <li>Install <b>Atlassian Plugin SDK</b>. Installation process is described <a href="https://developer.atlassian.com/docs/getting-started/set-up-the-atlassian-plugin-sdk-and-build-a-project" target="_blank">here</a>.</li>
        <li>Get a submodule:
            <span class="commandline">git submodule update --init --recursive</span>
        </li>
        <li>Compile package:
            <span class="commandline">atlas-package</span>
        </li>
    </ol>

    <h2 id="howitworks" class="copy-link">How it works</h2>
    <p>The ONLYOFFICE integration follows the API documented <a href="<%= Url.Action("basic") %>">here</a>.</p>
    <ol>
        <li>User navigates to the Confluence attachments and selects the <b>Edit in ONLYOFFICE</b> action.</li>
        <li>Confluence makes a request to OnlyOfficeEditorServlet (URL of the form: <em>/plugins/servlet/onlyoffice/doceditor?attachmentId=$attachment.id</em>).</li>
        <li>Confluence sends a document to ONLYOFFICE Document storage service and receive a temporary link.</li>
        <li>
            <p>Confluence prepares a JSON object with the following properties:</p>
            <ul>
                <li><b>url</b> - the temporary link that ONLYOFFICE Docs uses to download the document;</li>
                <li><b>callbackUrl</b> - the URL that ONLYOFFICE Docs informs about status of the document editing;</li>
                <li><b>docserviceApiUrl</b> - the URL that the client needs to reply to ONLYOFFICE Docs (provided by the <em>files.docservice.url.api</em> property);</li>
                <li><b>key</b> - the UUID to instruct ONLYOFFICE Docs whether to download the document again or not;</li>
                <li><b>title</b> - the document title (name).</li>
            </ul>
        <li>Confluence takes this object and constructs a page from a freemarker template, filling in all of those values so that the client browser can load up the editor.</li>
        <li>The client browser makes a request to the JavaScript library from ONLYOFFICE Docs and sends ONLYOFFICE Docs the DocEditor configuration with the above properties.</li>
        <li>Then ONLYOFFICE Docs downloads the document from Confluence and the user begins editing.</li>
        <li>When all users and client browsers are done with editing, they close the editing window.</li>
        <li>After <a href="<%= Url.Action("save") %>#savedelay">10 seconds</a> of inactivity, ONLYOFFICE Docs sends a POST to <em>callbackUrl</em> letting Confluence know that the clients have finished editing the document and closed it.</li>
        <li>Confluence downloads a new version of the document, replacing the old one.</li>
    </ol>

    <br />
    <p>Download the Confluence ONLYOFFICE integration app <a href="https://github.com/ONLYOFFICE/onlyoffice-confluence" target="_blank">here</a>.</p>

</asp:Content>
