<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    SuiteCRM ONLYOFFICE integration plugin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">SuiteCRM ONLYOFFICE integration plugin</span>
    </h1>

    <p class="dscr">This <a href="https://github.com/ONLYOFFICE/onlyoffice-suitecrm" target="_blank">plugin</a> enables users to edit office documents from <a href="https://suitecrm.com/" target="_blank">SuiteCRM</a> using ONLYOFFICE Docs.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently, the following document formats can be edited: DOCX, XLSX, PPTX, DOCXF, OFORM.</li>
        <li>The following formats are available for viewing only: PDF, ODT, ODS, ODP, DOC, XLS, PPT, PPS, EPUB, RTF, HTML, HTM, TXT, CSV.</li>
        <li>The plugin allows users to edit text documents, spreadsheets, presentations, and create and fill out digital forms.</li>
        <li>The plugin will create a new <b>Open in ONLYOFFICE</b> menu option within the document library for office documents.
            This allows multiple users to collaborate in real time and save back those changes to SuiteCRM.</li>
    </ul>


    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>
    <p>
        You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from SuiteCRM and any end clients.
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>.
        ONLYOFFICE Docs must also be able to POST to SuiteCRM directly.
    </p>
    <p>The easiest way to install an instance of ONLYOFFICE Docs is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="install" class="copy-link">Installing SuiteCRM ONLYOFFICE integration plugin</h2>
    <p>The latest compiled package files of the ONLYOFFICE integration plugin are available <a href="https://github.com/ONLYOFFICE/onlyoffice-suitecrm/releases" target="_blank">here</a>.</p>
    <p>To start using ONLYOFFICE Docs with SuiteCRM, follow these steps:</p>
    <ol>
        <li>Launch your SuiteCRM, switch to <b>Admin -> Admin Tools -> Module Loader</b> and upload the ONLYOFFICE plugin archive.</li>
        <li>Install the uploaded module by pressing the <b>Install</b> button.</li>
        <li>Switch to <b>Admin -> Admin Tools -> Repair</b> and run <b>Quick Repair and Rebuild</b>.</li>
    </ol>


    <h2 id="configuration" class="copy-link">Configuring SuiteCRM ONLYOFFICE integration plugin</h2>
    <p>The plugin settings page is available after installation: <b>Admin -> ONLYOFFICE -> ONLYOFFICE Settings</b>.</p>
    <ul>
        <li>
            <p><b>Document Server address</b>. Enter the name of the server with ONLYOFFICE Docs installed:</p>
            <span class="commandline">http://documentserver/</span>
            <p>
                where <b>documentserver</b> is the name of the server with <b>ONLYOFFICE Docs</b> installed.
                The address must be accessible from the user browser and from the SuiteCRM server.
                The SuiteCRM server address must also be accessible from <b>ONLYOFFICE Docs</b> for correct work.
            </p>
        </li>
        <li><b>Document Server Secret</b>. Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity.
            Specify your own secret key on the SuiteCRM <b>ONLYOFFICE Settings</b> page. In the ONLYOFFICE Docs <a href="/editors/signature/">config file</a>, specify the same secret key and enable the validation.</li>
    </ul>


    <h2 id="usage" class="copy-link">Using SuiteCRM ONLYOFFICE integration plugin</h2>
    <p>Once the plugin is installed and configured, you can edit and collaborate on office files in the <b>Documents</b> module:</p>
    <ol>
        <li>Go to the <b>Documents</b> module.</li>
        <li>Open the <b>Detail View</b> page by clicking the file name.</li>
        <li>On the <b>Detail View</b> page, click <b>Open in ONLYOFFICE</b> in the drop-down <b>ACTIONS</b> menu - the file will open in a new tab.</li>
    </ol>


    <h2 id="howitworks" class="copy-link">How it works</h2>
    <p>The ONLYOFFICE integration follows the API documented <a href="<%= Url.Action("basic") %>">here</a>.</p>

    <br />
    <p>Download the SuiteCRM ONLYOFFICE integration plugin <a href="https://github.com/ONLYOFFICE/onlyoffice-suitecrm" target="_blank">here</a>.</p>

</asp:Content>
