<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Mattermost ONLYOFFICE integration plugin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Mattermost ONLYOFFICE integration plugin</span>
    </h1>

    <p class="dscr">This <a href="https://github.com/ONLYOFFICE/onlyoffice-mattermost" target="_blank">plugin</a> enables users to edit office documents from <a href="https://mattermost.com/" target="_blank">Mattermost</a> using ONLYOFFICE Docs.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently, the following document formats can be edited: DOCX, XLSX, PPTX.</li>
        <li>The following formats are available for viewing only: XLS, CSV, XLSM, XLT, XLTM, ODS, FODS, OTS, PPS, PPSX, PPSM, PPT, PPTM, POT, POTX, POTM, ODP, FODP, OTP, DOC, DOCM, DOT, DOTX, DOTM, ODT, FODT, OTT, RTF.</li>
        <li>The plugin will create a new <b>Open in ONLYOFFICE</b> menu option within the document library for office documents. 
            This allows multiple users to collaborate in real time and save back those changes to Mattermost.</li>
    </ul>


    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>
    <p>
        You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Mattermost and any end clients. 
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>. 
        ONLYOFFICE Docs must also be able to POST to Mattermost directly.
    </p>
    <p>
        ONLYOFFICE Docs and Mattermost can be installed either on different computers, or on the same machine.
        If you use one machine, set up a custom port for Document Server.
    </p>
    <p>The easiest way to install an instance of ONLYOFFICE Docs is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="install" class="copy-link">Installing Mattermost ONLYOFFICE integration plugin</h2>
    <p>To start using ONLYOFFICE Docs with Mattermost, follow these steps:</p>
    <ol>
        <li>Clone the <a href="https://github.com/ONLYOFFICE/onlyoffice-mattermost" target="_blank">master branch</a>.</li>
        <li>Go to the project root.</li>
        <li>
            <p>Install the dependencies:</p>
            <span class="commandline">npm install --legacy-peer-deps</span>
            <note>Please note that you need to have Node.js v.15.14.0 installed on your machine to build the plugin.</note>
        </li>
        <li>
            <p>Run the following command:</p>
            <span class="commandline">make dist</span>
        </li>
        <li>Go to <em>&lt;your_mattermost_host&gt;/admin_console/plugins/plugin_management</em>.</li>
        <li>Choose the compiled plugin from your <em>dist</em> folder and press <b>Upload</b>.</li>
    </ol>


    <h2 id="configuration" class="copy-link">Configuring Mattermost ONLYOFFICE integration plugin</h2>
    <img class="screenshot max-width-832" alt="Mattermost settings" src="<%= Url.Content("~/content/img/editor/mattermost-settings.png") %>"/>
    <ul>
        <li><b>Enable Plugin</b>. Enable the Mattermost ONLYOFFICE integration plugin by setting this parameter to <b>true</b>.</li>
        <li>
            <p><b>Document Editing Service address</b>. To connect ONLYOFFICE Docs, enter the following address:</p>
            <span class="commandline">https://&lt;documentserver&gt;:&lt;port&gt;/</span>
            <p>
                where <b>documentserver</b> is the name of the server and <b>port</b> is the port number with <b>ONLYOFFICE Docs</b> installed.
                The address must be accessible from the user browser and from the Mattermost server.
                The Mattermost server address must also be accessible from <b>ONLYOFFICE Docs</b> for correct work.
            </p>
        </li>
        <li><b>Secret key</b>. Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity.
            Specify your own secret key in the Mattermost plugin configuration. In the ONLYOFFICE Docs <a href="/editors/signature/">config file</a>, specify the same secret key and enable the validation.</li>
        <li><b>JWT Header</b>. If JWT protection is enabled, it is necessary to specify a custom header name 
            since the Mattermost security policy blocks external <b>Authorization</b> headers. This header should be specified in the ONLYOFFICE Docs signature settings as well. 
            Further information about signature can be found <a href="<%= Url.Action("signature/") %>">here</a>.</li>
        <li><b>JWT Prefix</b>. Specify the ONLYOFFICE Docs prefix.</li>
    </ul>


    <h2 id="usage" class="copy-link">Using Mattermost ONLYOFFICE integration plugin</h2>
    <p>Users are able to open files sent in personal and group Mattermost chats for viewing and co-editing.</p>
    <p>When files are sent in the chat message, the following actions are available in the file context menu by clicking the &#8942; symbol:</p>
    <ul>
        <li><b>Open file in ONLYOFFICE</b> and <b>Change access rights</b> - for the author of the message.</li>
        <li><b>Open file in ONLYOFFICE</b> - for the recipient of the message.</li>
    </ul>
    <img class="screenshot max-width-550" alt="Mattermost actions" src="<%= Url.Content("~/content/img/editor/mattermost-actions.png") %>"/>

    <p>When clicking on the <b>Open file in ONLYOFFICE</b> button, the corresponding ONLYOFFICE editor opens in the same window.</p>
    <img class="screenshot max-width-832" alt="Mattermost editor" src="<%= Url.Content("~/content/img/editor/mattermost-editor.png") %>"/>

    <p>The author of the message with attached documents is able to change access rights to the file via the context menu using the <b>Change access rights</b> option. 
        This action is available both in personal and group chats.</p>
    <img class="screenshot max-width-400" alt="Mattermost share" src="<%= Url.Content("~/content/img/editor/mattermost-share.png") %>"/>

    <p>ONLYOFFICE bot sends notifications about changes in the document specifying the name of the user who made those changes.</p>
    <img class="screenshot max-width-300" alt="Mattermost bot" src="<%= Url.Content("~/content/img/editor/mattermost-bot.png") %>"/>


    <h2 id="howitworks" class="copy-link">How it works</h2>
    <p>The ONLYOFFICE integration follows the API documented <a href="<%= Url.Action("basic") %>">here</a>.</p>

    <br />
    <p>Download the Mattermost ONLYOFFICE integration plugin <a href="https://github.com/ONLYOFFICE/onlyoffice-mattermost" target="_blank">here</a>.</p>

</asp:Content>
