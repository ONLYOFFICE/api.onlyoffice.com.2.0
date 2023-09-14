<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ownCloud ONLYOFFICE integration app
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ownCloud ONLYOFFICE integration app</span>
    </h1>

    <div class="video-link" title="Show video">
        <img src="<%= Url.Content("~/content/img/video/owncloud_integration.png") %>" alt="Show video" />

        <div class="popap-dialog">
            <div class="popap-container">
                <div class="popap-header">How to integrate ONLYOFFICE Docs with ownCloud</div>
                <iframe src="https://www.youtube.com/embed/IAjhUxBWKkQ?wmode=transparent" class="video-frame" frameborder="0" allowfullscreen></iframe>
                <a class="button-close button">Close</a>
            </div>
            <div class="button-close popap-close" title="Close">&times;</div>
        </div>
    </div>

    <p>
        This <a href="https://github.com/ONLYOFFICE/onlyoffice-owncloud" target="_blank">app</a> enables users to edit office documents from <a href="https://owncloud.com" target="_blank">ownCloud</a> using ONLYOFFICE Docs.
    </p>
    <p>The latest connector signed versions are available in the official store for <a target="_blank" href="https://marketplace.owncloud.com/apps/onlyoffice">ownCloud</a>.</p>
    
    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently, the following document formats can be opened and edited with this app: DOCX, XLSX, PPTX, CSV, TXT, DOCXF, OFORM.</li>
        <li>The following formats are available for viewing only: PDF, DJVU, XPS.</li>
        <li>The following formats can be converted into OOXML: DOC, DOCM, DOT, DOTX, EPUB, HTM, HTML, ODP, ODT, POT, POTM, POTX, PPS, PPSM, PPSX, PPT, PPTM, RTF, XLS, XLSM, XLT, XLTM, XLTX.
            ODT, ODS, and ODP are also available for instant conversion. After you enable the corresponding option in the admin settings, ODF-formatted documents are immediately converted in the editor and opened after you click on it.
        </li>
        <li>
            The app will create an item in the <b>new (+)</b> menu to create <b>Document</b>, <b>Spreadsheet</b>, <b>Presentation</b>.
            It will also create a new <b>Open in ONLYOFFICE</b> menu option within the document library for Office documents.
            This allows multiple users to collaborate in real time and to save back those changes to ownCloud. 
            Co-editing is also available between several federated ownCloud instances connected to one Document Server.
        </li>
        <li>Sharing files is possible with different permission types - viewing/editing, commenting, reviewing, filling forms. It's also possible to restrict downloading (in all editors) and modifying filters (in spreadsheets). Sharing via public link is also available.</li>
        <li>It is possible to work with documents, spreadsheets, and presentations within <b>ownCloud Web</b>.</li>
    </ul>

    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>
    <p>
        You will need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from ownCloud and any end clients.
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>.
        ONLYOFFICE Docs must also be able to POST to ownCloud directly.
    </p>
    <p>
        ONLYOFFICE Docs and ownCloud can be installed either on different computers, or on the same machine.
        In case you select the latter variant, you will need to set up a custom port for Document Server as by default both ONLYOFFICE Docs and ownCloud work on port 80.
        Or you can use Document Server behind a proxy, please refer to <a href="https://helpcenter.onlyoffice.com/server/document/document-server-proxy.aspx" target="_blank">this article</a> to learn how you can configure it.
    </p>
    <p>You can also use our <a target="_blank" href="https://github.com/ONLYOFFICE/docker-onlyoffice-owncloud">Docker installation</a> to get installed and configured Document Server and ownCloud installation with a couple of commands.</p>


    <h2 id="install" class="copy-link">Installing ownCloud ONLYOFFICE integration app</h2>
    <p>
        The ownCloud administrator can install the integration app from the in-built application market.
        To do this, click the upper-left hamburger menu and select <b>Market</b>.
        After that, find <b>ONLYOFFICE</b> in the list of available applications and install it.
    </p>
    <p>
        If the server with the ownCloud installed does not have the Internet access, or if you need it for some other reason, the administrator can install the application manually.
        To start using ONLYOFFICE Docs with ownCloud, the following steps must be performed:
    </p>
    <ol>
        <li>Go to the ownCloud server <em>apps/</em> directory (or some other directory <a href="https://doc.owncloud.org/server/admin_manual/installation/apps_management_installation.html#using-custom-app-directories" target="_blank">used</a> to connect applications):
            <span class="commandline">cd apps/</span>
        </li>
        <li>Get the ownCloud ONLYOFFICE integration app.
            There are several ways to do that:
            <ol style="list-style-type: lower-alpha;">
                <li>Download the latest signed version from the official store for <a target="_blank" href="https://marketplace.owncloud.com/apps/onlyoffice">ownCloud</a>.</li>
                <li>Download the latest signed version from the application <a target="_blank" href="https://github.com/ONLYOFFICE/onlyoffice-owncloud/releases">release page</a> on GitHub.</li>
                <li>Clone the application source code and compile it yourself:
                    <span class="commandline">git clone https://github.com/ONLYOFFICE/onlyoffice-owncloud.git onlyoffice
cd onlyoffice
git submodule update --init --recursive</span>
                </li>
            </ol>
            <div class="note">ownCloud does not work with unsigned applications giving an alert, so you will need to use either the option <b>a</b> or <b>b</b> to get the application.</div>
        </li>
        <li>Change the owner to update the application right from ownCloud web interface:
            <span class="commandline">chown -R www-data:www-data onlyoffice</span>
        </li>
        <li>In ownCloud, open the <em>~/settings/admin?sectionid=apps&category=disabled</em> page with <b>Not enabled</b> apps by administrator and click <b>Enable</b> for the <b>ONLYOFFICE</b> application.</li>
    </ol>


    <h2 id="settings" class="copy-link">Configuring ownCloud ONLYOFFICE integration app</h2>
    <p>
        In ownCloud, open the <em>~/settings/admin?sectionid=additional#onlyoffice</em> page with administrative settings for <b>ONLYOFFICE</b> section.
        Enter the following address to connect ONLYOFFICE Docs:
    </p>
    <span class="commandline">https://&lt;documentserver&gt;/</span>

    <p>
        where the <b>documentserver</b> is the name of the server with the <b>ONLYOFFICE Docs</b> installed.
        The address must be accessible for the user browser and from the ownCloud server.
        The ownCloud server address must also be accessible from <b>ONLYOFFICE Docs</b> for correct work.
    </p>
    <img alt="Local" src="<%= Url.Content("~/content/img/editor/owncloud-local.jpg") %>" />

    <p id="internalUrl">
        Sometimes your network configuration might not allow the requests between installed ownCloud and ONLYOFFICE Docs using the public addresses.
        The <b>Advanced server settings</b> allows to set the ONLYOFFICE Docs address for internal requests from ownCloud server and the returning ownCloud address for the internal requests from ONLYOFFICE Docs.
        You need to enter them in the appropriate fields.
    </p>
    <img alt="Public" src="<%= Url.Content("~/content/img/editor/owncloud-public.jpg") %>" />

    <p>Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity.
        Specify your own <b>Secret key</b> in the ownCloud administrative configuration. In the ONLYOFFICE Docs <a href="/editors/signature/">config file</a>, specify the same secret key and enable the validation.</p>

    <p>Enable or disable the <b>Open file in the same tab</b> setting.</p>

    <p>
        The <b>Open in ONLYOFFICE</b> action will be added to the file context menu.
        You can specify this action as default and it will be used when the file name is clicked for the selected file types.
    </p>

    <h2 id="check-connection" class="copy-link">Checking the connection</h2>
    <p>You can check the connection to ONLYOFFICE Docs by using the following occ command:</p>
    <span class="commandline">occ onlyoffice:documentserver --check</span>
    <p>You will see a text either with information about the successful connection or the cause of the error.</p>


    <h2 id="ownCloud-web" class="copy-link">Enabling editing for ownCloud Web</h2>
    <p>To enable work within <b>ownCloud Web</b>, register the connector in the ownCloud Web <em>config.json</em>:</p>
    <ul>
        <li>If you installed ownCloud Web from the <a target="_blank" href="https://marketplace.owncloud.com/apps/onlyoffice">official marketplace</a>, the path is <em>&lt;owncloud-root-catalog&gt;/config/config.json</em>.</li>
        <li>If you compiled it from source code yourself using <a href="#install">this instruction</a>, the path is <em>&lt;owncloud-web-root-catalog&gt;/config/config.json</em>.</li>
    </ul>
    <p>To register the connector, use these lines:</p>
    <pre>
"external_apps": [
    {
        "id": "onlyoffice",
        "path": "http(s)://&lt;owncloud-10-server-address&gt;/custom/onlyoffice/js/web/onlyoffice.js",
    }
]
</pre>
    <p>Depending on your webserver configuration you can drop the <em>index.php</em> segment from the URL path.</p>
    
    <h2 id="howitworks" class="copy-link">How it works</h2>
    <p>The ONLYOFFICE integration follows the API documented <a href="https://api.onlyoffice.com/editors/basic">here</a>.</p>
    <ol>
        <li>When creating a new file, the user navigates to a document folder within ownCloud and clicks the <b>Document</b>, <b>Spreadsheet</b> or <b>Presentation</b> item in the <b>new (+)</b> menu.</li>
        <li>
            The browser invokes the <em>create</em> method in the <em>/lib/Controller/EditorController.php</em> controller.
            This method adds a copy of a file from the <em>assets</em> folder to the folder the user is currently in.
        </li>
        <li>When opening an existing file, the user navigates to it within ownCloud and selects the <b>Open in ONLYOFFICE</b> menu option.</li>
        <li>A new browser tab is opened and the <em>index</em> method of the <em>/lib/Controller/EditorController.php</em> controller is invoked.</li>
        <li>
            <p>The app prepares a JSON object with the following properties:</p>
            <ul>
                <li><b>url</b> - the URL that ONLYOFFICE Docs uses to download the document;</li>
                <li><b>callbackUrl</b> - the URL that ONLYOFFICE Docs informs about status of the document editing;</li>
                <li><b>documentServerUrl</b> - the URL that the client needs to respond to ONLYOFFICE Document Server (can be set at the administrative settings page);</li>
                <li><b>key</b> - the <em>UUID+Modified Timestamp</em> to instruct ONLYOFFICE Docs whether to download the document again or not.</li>
            </ul>
        </li>
        <li>ownCloud takes this object and constructs a page from <em>templates/editor.php</em> template, filling in all of those values so that the client browser can load up the editor.</li>
        <li>The client browser makes a request to the JavaScript library from ONLYOFFICE Docs and sends ONLYOFFICE Docs the DocEditor configuration with the above properties.</li>
        <li>Then ONLYOFFICE Docs downloads the document from ownCloud and the user begins editing.</li>
        <li>ONLYOFFICE Docs sends a POST request to <em>callbackUrl</em> to inform ownCloud that a user is editing the document.</li>
        <li>When all users and client browsers are done with editing, they close the editing window.</li>
        <li>After <a href="<%= Url.Action("save") %>#savedelay">10 seconds</a> of inactivity, ONLYOFFICE Docs sends a POST to <em>callbackUrl</em> letting ownCloud know that the clients have finished editing the document and closed it.</li>
        <li>ownCloud downloads a new version of the document, replacing the old one.</li>
    </ol>


    <h2 id="issue" class="copy-link">Known issues</h2>
    <ul>
        <li>
            <b>Connecting external storages</b>. Adding the storage using the <b>External storages</b> app has issues with the co-editing in some cases.
            If the connection is made using the same authorization keys (the <em>Username and password</em> or <em>Global credentials</em> authentication type is selected), then the co-editing is available for the users.
            If different authorization keys are used (<em>Log-in credentials, save in database</em> or <em>User entered, store in database</em> authentication options), the co-editing is not available.
            When the <em>Log-in credentials, save in session</em> authentication type is used, the files cannot be opened in the editor.
        </li>
        <li>
            <b>Encrypting file storage</b>. ownCloud provides an option to encrypt the file storage.
            But if the encryption with the <em>per-user encryption keys</em> (used by default in ownCloud <b>Default encryption module</b> app) is enabled, ONLYOFFICE Docs cannot open the encrypted files for editing and save them after the editing.
            The ONLYOFFICE section of the administrative settings page will display a notification about it.
            However, if you set the encryption with the <em>master key</em>, ONLYOFFICE application will work as intended.
            The instruction on enabling <em>master key</em> based encryption is available in the official documentation on <a href="https://doc.owncloud.org/server/admin_manual/configuration/files/encryption/encryption_configuration.html#enabling-master-key-based-encryption-from-the-command-line" target="_blank">ownCloud</a> websites.
            <div class="note note-important">
                <div class="note-important-label">Please note</div>
                ownCloud recommends using <em>master encryption key</em> only on fresh installations with no existing data, or on systems where encryption has not already been enabled, as your files previously encrypted with the use of <em>per-user encryption keys</em> <b>might be lost forever</b> after you enable <em>master key</em> based encryption on them.
            </div>
        </li>
        <li>
            <p><b>Validating certificate</b>. If you are using a self-signed certificate for your Document Server, ownCloud will not validate such a certificate and will not allow connection to/from Document Server.
            This issue can be solved in two ways:</p>
            <ol>
                <li>Check the <b>Disable certificate verification (insecure)</b> box on the ONLYOFFICE administration page, Server settings section, within your ownCloud.</li>
                <li>Change the ownCloud config file manually. Locate the ownCloud config file (<em>/owncloud/config/config.php</em>) and open it. Insert the following section to it:</li>
            </ol>
        <pre>
'onlyoffice' => array (
    'verify_peer_off' => true
)
</pre>
            <p>This will disable the certificate verification and allow ownCloud to establish connection with Document Server.</p>
            <note>Please remember that this is a temporary insecure solution and we strongly recommend that you replace the certificate with the one issued by some CA. Once you do that, do not forget to uncheck the corresponding setting box or remove the above section from the ownCloud config file.</note>
        </li>
        <li>
            <b>Federated Cloud Sharing</b>. If the document is shared using the <b>Federated Cloud Sharing</b> app, the co-editing between the ownCloud instances connected to different ONLYOFFICE servers will not be available.
            The users from one and the same Document Server can edit the document in the co-editing mode, but the users from two (or more) different Document Servers will not be able to collaborate on the same document in real time.
        </li>
        <li>
            <p>
                <b>Converting files</b>. ONLYOFFICE Docs uses Office Open XML format as a basis when opening and editing files.
                If the file format is different from OOXML, it will still be converted to the corresponding OOXML for the Document Server proper work and faster performance.
                After that you can edit the file, making any changes available for the base OOXML format and save the file to this base OOXML format.
            </p>
            <p>
                In case the source ownCloud file format was different from the base one, and you still want to save it to the original format, the file will be converted to this format from OOXML.
                As the formats are fundamentally different, some data (such as charts, tables, autoshapes or images) and formatting can be lost due to the simple reason that some formats (<em>csv</em>, <em>txt</em>, etc.) do not support them or treat them differently than OOXML standard does.
                That is why all the non-OOXML files by default are opened for viewing only, although there is an option to convert the file in the context menu.
                If you realise the data/formatting loss risks after the conversion, but still want to open non-OOXML files for editing, you can check them in the list in the settings.
                Editing for <em>csv</em> and <em>txt</em> files is available by default.
            </p>
        </li>
    </ul>


    <br />
    <p>Download the ownCloud ONLYOFFICE integration app <a href="https://github.com/ONLYOFFICE/onlyoffice-owncloud" target="_blank">here</a>.</p>

</asp:Content>
