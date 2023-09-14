<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Odoo ONLYOFFICE integration app
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Odoo ONLYOFFICE integration app</span>
    </h1>

    <p class="dscr">This <a href="https://github.com/ONLYOFFICE/onlyoffice-odoo" target="_blank">app</a> enables users to edit and collaborate on office documents within <a href="https://www.odoo.com/" target="_blank">Odoo</a> Documents using ONLYOFFICE Docs.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently, the following document formats can be edited: DOCX, DOCXF, XLSX, PPTX.</li>
        <li>The following formats are available for viewing only: DJVU, DOC, DOCM, DOT, DOTM, DOTX, EPUB, FB2, FODT, HTML, MHT, ODT, OFORM, OTT, OXPS, PDF, RTF, TXT, XPS, XML, CSV, FODS, ODS, OTS, XLS, XLSB, XLSM, XLT, XLTM, XLTX, FODP, ODP, OTP, POT, POTM, POTX, PPS, PPSM, PPSX, PPT, PPTM.</li>
        <li>The app will create a new <b>Open in ONLYOFFICE</b> menu option within the document library for Office documents. 
            This allows multiple users to collaborate in real time and to save back those changes to Odoo.</li>
    </ul>


    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>
    <p>
        You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Odoo and any end clients. 
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>. 
        ONLYOFFICE Docs must also be able to POST to Odoo directly.
    </p>
    <p>The easiest way to start an instance of ONLYOFFICE Docs is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="install" class="copy-link">Installing Odoo ONLYOFFICE integration app</h2>
    <p>To start using ONLYOFFICE Docs with Odoo, the following steps must be performed:</p>
    <p><b>Option 1</b>. Installation from the administration panel</p>
    <ol>
        <li><a href="https://www.odoo.com/web/login" target="_blank">Log into</a> your exisiting Odoo account or <a href="https://www.odoo.com/web/signup" target="_blank">sign up</a> for a new account.</li>
        <li>Go to the Odoo administration panel and click <b>Apps</b> on the top menu bar.</li>
        <li>Search for ONLYOFFICE in the <b>Apps</b> catalog.</li>
        <li>Click the <b>Install</b> button.</li>
    </ol>

    <p><b>Option 2</b>. Manual installation</p>
    <ol>
        <li>Navigate to the <a href="https://apps.odoo.com/apps" target="_blank">Odoo Apps catalog</a> and select the Odoo version you have installed.</li>
        <li>Search for ONLYOFFICE and download it. You can also download the latest app version from the official <a href="https://github.com/ONLYOFFICE/onlyoffice-odoo/releases" target="_blank">GitHub repository</a>.</li>
        <li>
            <p>Put ONLYOFFICE connector into <em>/path/to/odoo/addons</em>. Make sure the ONLYOFFICE folder is named as <em>onlyoffice_odoo</em>.</p>
            <p>Alternatively, you can add the following lines in the <em>/path/to/odoo/config/odoo.conf</em> file specifying your path to the folder with <em>apps/addons</em>:</p>
            <pre>
[options]
addons_path = /mnt/extra-addons
</pre>
        </li>
        <li>
            <p>Install the <em>pyjwt</em> package:</p>
            <pre>
pip install pyjwt
</pre>
        </li>
        <li>Switch your Odoo to the developer mode and click <b>Apps -> Update Apps List</b> or just restart your Odoo instance.</li>
    </ol>


    <h2 id="configuration" class="copy-link">Configuring Odoo ONLYOFFICE integration app</h2>
    <p>To configure the app, go to <b>Settings</b>. Find <b>ONLYOFFICE</b> on the left sidebar and press it. Specify the URL of the installed ONLYOFFICE Document Server:</p>
    <span class="commandline">https://&lt;documentserver&gt;/</span>
    <p>
        where the <b>documentserver</b> is the name of the server with <b>ONLYOFFICE Docs</b> installed.
        The address must be accessible from the user browser and from the Odoo server.
        The Odoo server address must also be accessible from <b>ONLYOFFICE Docs</b> for correct work.
    </p>
    <p>Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity.
        Specify your own <b>Secret key</b> on the Odoo configuration page. In the ONLYOFFICE Docs <a href="/editors/signature/">config file</a>, specify the same secret key and enable the validation.</p>


    <h2 id="how-it-works" class="copy-link">How it works</h2>

    <p>The ONLYOFFICE integration follows the API documented <a href="https://api.onlyoffice.com/editors/basic">here</a>.</p>


    <br />
    <p>Download the Odoo ONLYOFFICE integration app <a href="https://github.com/ONLYOFFICE/onlyoffice-odoo/tree/develop" target="_blank">here</a>.</p>

</asp:Content>
