<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Strapi ONLYOFFICE integration plugin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Strapi ONLYOFFICE integration plugin</span>
    </h1>

    <p class="dscr">This <a href="https://github.com/ONLYOFFICE/onlyoffice-strapi" target="_blank">plugin</a> enables users to edit office documents from <a href="https://strapi.io/" target="_blank">Strapi</a> using ONLYOFFICE Docs.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently, the following document formats can be edited: DOCX, XLSX, PPTX.</li>
        <li>The following formats are available for viewing: DOC, DOCX, DOCM, DOT, DOTX, DOTM, ODT, FODT, OTT, RTF, TXT, HTML, HTM, MHT, XML, PDF, DJVU, FB2, EPUB, XPS, OXPS, XLS, XLSX, XLSM, XLT, XLTX, XLTM, ODS, FODS, OTS, CSV, PPS, PPSX, PPSM, PPT, PPTX, PPTM, POT, POTX, POTM, ODP, FODP, OTP.</li>
        <li>The plugin will create a new <b>Edit in ONLYOFFICE</b> menu option within the document library for office documents. 
            This allows multiple users to collaborate in real time and save back those changes to Strapi.</li>
    </ul>


    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>
    <p>
        You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Strapi and any end clients. 
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>. 
        ONLYOFFICE Docs must also be able to POST to Strapi directly.
    </p>
    <p>The easiest way to install an instance of ONLYOFFICE Docs is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="install" class="copy-link">Installing Strapi ONLYOFFICE integration plugin</h2>
    <p>To start using ONLYOFFICE Docs with Strapi, follow these steps:</p>
    <ol>
        <li>
            <p>Change the Strapi middlewares file: <em>strapi/config/middlewares.js</em>.</p>
            <p>To allow inserting a frame with the editor and loading <em>api.js</em>, replace the <em>strapi::security</em> line in this file with the following:</p>
            <pre>
{
    name: "strapi::security",
    config: {
        contentSecurityPolicy: {
            useDefaults: true,
            directives: {
                "script-src": ["'self'", "https:", "http:"],
                "frame-src": ["'self'", "https:", "http:"],
            },
        },
    },
}
</pre>
            <p>If such a config already exists, you just need to add <em>directives</em>.</p>
        </li>
        <li>
            <p>Install the plugin in your Strapi project:</p>
            <span class="commandline">npm install onlyoffice-stapi --save</span>
        </li>
        <li>
            <p>After successful installation, you have to rebuild the admin UI so it'll include this plugin. To rebuild and restart Strapi, run:</p>
            <span class="commandline"># using yarn
yarn build
yarn develop

# using npm
npm run build
npm run develop
</span>
        </li>
    </ol>


    <h2 id="configuration" class="copy-link">Configuring Strapi ONLYOFFICE integration plugin</h2>
    <p>You can configure ONLYOFFICE app via Strapi <b>Dashboard -> Settings -> Global settings -> ONLYOFFICE</b>. On the settings page, enter:</p>
    <ul>
        <li><b>Document server address</b>. The URL of the installed ONLYOFFICE Document Server.</li>
        <li><b>Document server JWT secret key</b>. Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity.
            Specify your own secret key on the Strapi settings page. In the ONLYOFFICE Docs <a href="/editors/signature/">config file</a>, specify the same secret key and enable the validation.</li>
    </ul>


    <h2 id="usage" class="copy-link">Using Strapi ONLYOFFICE integration plugin</h2>
    <p>Users are able to view, edit, and co-author documents added to the Strapi Media Library. Documents available for viewing/editing can be found and sorted on the ONLYOFFICE file page within Strapi. The editor opens by clicking on the file name.</p>
    <p><b>Access rights</b></p>
    <ul>
        <li>Opening files for editing: roles with the <b>Update (crop, details, replace) + delete</b> permission setting.</li>
        <li>Opening files for viewing: roles with the <b>Access the Media Library</b> permission setting.</li>
    </ul>

    <h2 id="howitworks" class="copy-link">How it works</h2>
    <p>The ONLYOFFICE integration follows the API documented <a href="<%= Url.Action("basic") %>">here</a>.</p>

    <br />
    <p>Download the Strapi ONLYOFFICE integration plugin <a href="https://github.com/ONLYOFFICE/onlyoffice-strapi" target="_blank">here</a>.</p>

</asp:Content>
