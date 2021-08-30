<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE Alfresco module package
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ONLYOFFICE Alfresco module package</span>
    </h1>

    <p class="dscr">This <a href="https://github.com/ONLYOFFICE/onlyoffice-alfresco" target="_blank">plugin</a> enables users to edit office documents from <a href="https://www.alfresco.com/" target="_blank">Alfresco</a> Share using ONLYOFFICE Docs.</p>

    <p>The plugin is available in the official <a href="https://community.alfresco.com/docs/DOC-7918-onlyoffice-connector-for-alfresco" target="_blank">Alfresco Add-ons directory</a>.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently the following document formats can be opened and edited with this plugin: DOCX, XLSX, PPTX.</li>
        <li>
            <p>The plugin will create a new <b>Edit in ONLYOFFICE</b> menu option within the document library for Office documents.</p>
            <img alt="Edit in OnlyOffice" src="<%= Url.Content("~/content/img/editor/alfresco.png") %>"/>
            <p>This allows multiple users to collaborate in real time and to save back those changes to Alfresco.</p>
        </li>
        <li>To convert ODT, ODP, ODS, DOC, XLS, PPT files into their OOXML counterparts, select the <b>Convert using ONLYOFFICE</b> option. Resulting files will be placed in the same folder. 
            You can also configure rules for a folder, that will automatically convert files on upload or on change. Details you can find <a href="https://docs.alfresco.com/content-services/latest/using/content/rules/" target="_blank">here</a>.</li>
        <li>
            To create a new document, choose the context menu <b>Create new...</b> option within document library.
            <img alt="Create new..." src="<%= Url.Content("~/content/img/editor/alfresco-create.png") %>"/>
        </li>
    </ul>


    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>
    <p>
        You will need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Alfresco and any end clients (version 3.0 and later are supported for use with the plugin).
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>.
        ONLYOFFICE Docs must also be able to POST to Alfresco directly.
    </p>
    <p>The easiest way to start an instance of ONLYOFFICE Docs is to use <a href="https://github.com/ONLYOFFICE/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="install" class="copy-link">Installing ONLYOFFICE Alfresco module package</h2>

    <p>To start using ONLYOFFICE Docs with Alfresco, the following steps must be performed for Ubuntu 14.04:</p>
    <ol>
        <li>Upload the compiled <b>*.jar</b> packages to directories accordingly for your Alfresco installation:
            <ul>
                <li>from <em>onlyoffice-alfresco/repo/target/</em> to <em>/webapps/alfresco/WEB-INF/lib/</em> for Alfresco repository,</li>
                <li>from <em>onlyoffice-alfresco/share/target/</em> to <em>/webapps/share/WEB-INF/lib/</em> for Share.</li>
            </ul>
            <div class="note">You can download the already compiled package files <a target="_blank" href="https://github.com/onlyoffice/onlyoffice-alfresco/releases">here</a> and place them to the respective directories.</div>
        </li>
        <li>Make sure that Document Server will be able to POST to Alfresco.
            <p>You may need to change these lines in <b>alfresco-global.properties</b> or you can set it using <a href="#configuration">configuration page</a>:</p>
            <span class="commandline">alfresco.host=&lt;hostname&gt;
alfresco.port=443
alfresco.protocol=https

share.host=&lt;hostname&gt;
share.port=443
share.protocol=https</span>
            <div class="note">Probably located here <em>/usr/local/tomcat/shared/classes/alfresco-global.properties</em></div>
        </li>
        <li>Restart Alfresco:
            <span class="commandline">sudo ./alfresco.sh stop
sudo ./alfresco.sh start</span>
        </li>
    </ol>
    <p>The module can be checked in administrator tools at <em>/share/page/console/admin-console/module-package</em> in Alfresco.</p>

    <h2 id="configuration" class="copy-link">Configuring ONLYOFFICE Alfresco module package</h2>
    <p>Module configuration can be found inside <b>Alfresco Administration Console</b> or by simply navigating to <em>http://&lt;alfrescohost&gt;/alfresco/s/onlyoffice/onlyoffice-config</em>.</p>
    <div class="note">
        You can also add <em>onlyoffice.url</em> to <b>alfresco-global.properties</b>.
        Configuration made via settings page will override <b>alfresco-global.properties</b>.
    </div>
    <p>JWT can be configured via <a href="#configuration">configuration page</a> or by adding <em>onlyoffice.jwtsecret</em> to <b>alfresco-global.properties</b>.</p>
    <p>The JWT configuration on the Document Server side can be found <a href="/editors/signature/">here</a>.</p>

    <h2 id="compile" class="copy-link">Compiling ONLYOFFICE Alfresco module package</h2>

    <p>If you plan to compile the ONLYOFFICE Alfresco module package yourself (e.g. edit the source code and compile it afterwards), follow these steps:</p>
    <ol>
        <li>
            The latest stable <b>Oracle Java</b> version is necessary for the successful build.
            If you do not have it installed, use the following commands to install Oracle Java 8:
            <span class="commandline">sudo apt-get update
sudo apt-get install openjdk-8-jdk</span>
        </li>
        <li>Install the latest <b>Maven</b>. Installation process is described <a href="https://maven.apache.org/install.html">here</a>.
        </li>
        <li>Download the ONLYOFFICE Alfresco module package source code:
            <span class="commandline">git clone https://github.com/ONLYOFFICE/onlyoffice-alfresco.git</span>
        </li>
        <li>Get a submodule:
            <span class="commandline">git submodule update --init --recursive</span>
        </li>
        <li>Compile packages in the <em>repo</em> and <em>share</em> directories:
            <span class="commandline">cd onlyoffice-alfresco/
mvn clean install</span>
        </li>
    </ol>
    <p>Another way to build ONLYOFFICE Alfresco module package is using <b>docker-compose</b> file.</p>
    <p>Use this command from project directory:</p>
    <span class="commandline">docker-compose up</span>

    <h2 id="howitworks" class="copy-link">How it works</h2>
    <ol>
        <li>User navigates to a document within Alfresco Share and selects the <b>Edit in ONLYOFFICE</b> menu option.</li>
        <li>Alfresco Share makes a request to the repo end (URL of the form: <em>/parashift/onlyoffice/prepare?nodeRef={nodeRef}</em>).</li>
        <li>
            <p>Alfresco Repo end prepares a JSON object for the Share with the following properties:</p>
            <ul>
                <li><b>url</b> - the URL that ONLYOFFICE Docs uses to download the document (includes the <em>alf_ticket</em> of the current user);</li>
                <li><b>callbackUrl</b> - the URL that ONLYOFFICE Docs informs about status of the document editing;</li>
                <li><b>onlyofficeUrl</b> - the URL that the client needs to respond to ONLYOFFICE Docs (provided by the <em>onlyoffice.url</em> property);</li>
                <li><b>key</b> - the <em>UUID+Modified Timestamp</em> to instruct ONLYOFFICE Docs whether to download the document again or not;</li>
                <li><b>title</b> - the document title (name).</li>
            </ul>
        </li>
        <li>Alfresco Share takes this object and constructs a page from a freemarker template, filling in all of those values so that the client browser can load up the editor.</li>
        <li>The client browser makes a request to the JavaScript library from ONLYOFFICE Docs and sends ONLYOFFICE Docs the DocEditor configuration with the above properties.</li>
        <li>Then ONLYOFFICE Docs downloads the document from Alfresco and the user begins editing.</li>
        <li>ONLYOFFICE Docs sends a POST request to the <em>callback</em> URL to inform Alfresco that a user is editing the document.</li>
        <li>Alfresco locks the document, but still allows other users with write access to collaborate in real time with ONLYOFFICE Docs by leaving the Action present.</li>
        <li>When all users and client browsers are done with editing, they close the editing window.</li>
        <li>After <a href="<%= Url.Action("save") %>#savedelay">10 seconds</a> of inactivity, ONLYOFFICE Docs sends a POST to the <em>callback</em> URL letting Alfresco know that the clients have finished editing the document and closed it.</li>
        <li>Alfresco downloads a new version of the document, replacing the old one.</li>
    </ol>

    <br />
    <p>Download the ONLYOFFICE Alfresco module package <a href="https://github.com/ONLYOFFICE/onlyoffice-alfresco" target="_blank">here</a>.</p>

</asp:Content>
