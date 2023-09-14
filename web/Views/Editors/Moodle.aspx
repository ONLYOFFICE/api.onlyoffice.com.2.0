<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Moodle ONLYOFFICE integration plugin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Moodle ONLYOFFICE integration plugin</span>
    </h1>

    <p class="dscr">This <a href="https://github.com/ONLYOFFICE/moodle-mod_onlyofficeeditor" target="_blank">plugin</a> enables users to edit office documents from <a href="https://moodle.org/" target="_blank">Moodle</a> using ONLYOFFICE Docs.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently, the following document formats can be edited: DOCX, XLSX, PPTX, TXT, CSV.</li>
        <li>The following formats are available for viewing only: PDF.</li>
        <li>Currently, the following document formats can be converted into OOXML: ODT, ODS, ODP, DOC, XLS, PPT, PPS, EPUB, RTF, HTML, HTM.</li>
        <li>The plugin will create a new <b>ONLYOFFICE document</b> activity as one of the edit modes for the necessary course page. 
            This allows multiple users to collaborate in real time and to save back those changes to Moodle.</li>
    </ul>


    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>
    <p>
        You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Moodle and any end clients.
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>.
        ONLYOFFICE Docs must also be able to POST to Moodle directly.
    </p>
    <p>The easiest way to install an instance of ONLYOFFICE Docs is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="install" class="copy-link">Installing Moodle ONLYOFFICE integration plugin</h2>
    <p>This plugin is an <b>activity module</b>.</p>
    <p>Follow the usual Moodle plugin installation steps to install this plugin into your <em>mod/onlyoffice</em> directory. Please see <a href="https://docs.moodle.org/311/en/Installing_plugins" target="_blank">Moodle Documentation</a> for more information.</p>
    <p>The latest compiled package files are available <a href="https://github.com/ONLYOFFICE/moodle-mod_onlyofficeeditor/releases" target="_blank">here</a>.</p>


    <h2 id="configuration" class="copy-link">Configuring Moodle ONLYOFFICE integration plugin</h2>
    <p>Once the plugin is installed, the plugin settings page will be opened. Alternatively, you can find the uploaded app on the <b>Plugins overview</b> page and click <b>Settings</b>.</p>
    <ul>
        <li>
            <p>Enter the name of the server with ONLYOFFICE Docs installed in the <b>Document Editing Service address</b> field:</p>
            <span class="commandline">http://documentserver/</span>
            <p>
                where <b>documentserver</b> is the name of the server with <b>ONLYOFFICE Docs</b> installed.
                The address must be accessible from the user browser and from the Moodle server.
                The Moodle server address must also be accessible from <b>ONLYOFFICE Docs</b> for correct work.
            </p>
        </li>
        <li>Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity.
            Specify your own <b>Document Server Secret</b> on the Moodle <b>Settings</b> page. In the ONLYOFFICE Docs <a href="/editors/signature/">config file</a>, specify the same secret key and enable the validation.</li>
    </ul>


    <h2 id="usage" class="copy-link">Using Moodle ONLYOFFICE integration plugin</h2>
    <p>Once the plugin is installed and configured, you can add instances of ONLYOFFICE activity to your course pages as per usual Moodle practice:</p>
    <ol>
        <li>Open the necessary course page.</li>
        <li>Activate the <b>Edit Mode</b> using the switcher at the top right corner.</li>
        <li>Click <b>Add an activity or resource</b>.</li>
        <li>Select the <b>ONLYOFFICE document</b> activity in the pop-up window.</li>
        <li>Type in the activity name, upload or drag-and-drop the necessary document from your PC and click the <b>Save and display</b> button.</li>
    </ol>
    <p>Admins/Teachers can choose whether or not documents can be downloaded or printed from inside the ONLYOFFICE editor. This can be done in the <b>Document permissions</b> section.</p>
    <p>Clicking the activity name/link in the course page opens the <em>ONLYOFFICE editor</em> in the user's browser, ready for collaborative editing.</p>


    <h2 id="howitworks" class="copy-link">How it works</h2>
    <p>The ONLYOFFICE integration follows the API documented <a href="<%= Url.Action("basic") %>">here</a>.</p>

    <br />
    <p>Download the Moodle ONLYOFFICE integration plugin <a href="https://github.com/ONLYOFFICE/moodle-mod_onlyofficeeditor" target="_blank">here</a>.</p>

</asp:Content>
