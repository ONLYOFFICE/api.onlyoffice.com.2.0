<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    WordPress ONLYOFFICE integration plugin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">WordPress ONLYOFFICE integration plugin</span>
    </h1>

    <p class="dscr">This <a href="https://github.com/ONLYOFFICE/onlyoffice-wordpress" target="_blank">plugin</a> enables users to edit and view office documents from <a href="https://wordpress.org/" target="_blank">WordPress</a> pages on site and admin panel using ONLYOFFICE Docs.</p>
    <p>The minimum WordPress version for ONLYOFFICE integration plugin is 5.9.0.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently, the following document formats can be edited: DOCX, XLSX, PPTX.</li>
        <li>The following formats are available for viewing only: DOC, DOCM, DOT, DOTX, DOTM, ODT, FODT, OTT, RTF, TXT, HTML, HTM, MHT, XML, PDF, DJVU, FB2, EPUB, XPS, XLS, XLSM, XLT, XLTX, XLTM, ODS, FODS, OTS, CSV, PPS, PPSX, PPSM, PPT, PPTM, POT, POTX, POTM, ODP, FODP, OTP.</li>
        <li>The plugin allows multiple users to collaborate in real time and save back those changes to WordPress.</li>
    </ul>


    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>
    <p>
        You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from WordPress and any end clients. 
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>. 
        ONLYOFFICE Docs must also be able to POST to WordPress directly.
    </p>
    <p>The easiest way to install an instance of ONLYOFFICE Docs is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="install" class="copy-link">Installing WordPress ONLYOFFICE integration plugin</h2>
    <p>To start using ONLYOFFICE Docs with WordPress, follow these steps:</p>
    <ol>
        <li>Download the zipped plugin.</li>
        <li>Navigate to the <b>Plugins</b> section in your WordPress administrative dashboard.</li>
        <li>Click <b>Add New</b> at the top of the page.</li>
        <li>Click <b>Upload Plugin</b> at the top of the page.</li>
        <li>Click <b>Choose File</b> and select the downloaded zipped plugin.</li>
        <li>Once the plugin is installed, click <b>Activate</b>.</li>
    </ol>
    <p>Alternatively, you can clone the master branch (and then activate the plugin from the WordPress administrative dashboard as well):</p>
    <pre>
cd wp-content/plugins
git clone https://github.com/ONLYOFFICE/onlyoffice-wordpress
</pre>


    <h2 id="configuration" class="copy-link">Configuring WordPress ONLYOFFICE integration plugin</h2>
    <p>Configure the plugin via the WordPress interface. Go to <b>WordPress administrative dashboard -> ONLYOFFICE -> Settings</b> and specify the following parameters:</p>
    <ul>
        <li><b>Document Editing Service address</b>. The URL of the installed ONLYOFFICE Document Server.</li>
        <li><b>Document server JWT secret key</b>. Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity.
            Specify your own secret key in the WordPress administrative configuration. In the ONLYOFFICE Docs <a href="/editors/signature/">config file</a>, specify the same secret key and enable the validation.</li>
    </ul>


    <h2 id="usage" class="copy-link">Using WordPress ONLYOFFICE integration plugin</h2>
    <p>ONLYOFFICE integration plugin allows WordPress administrators to open files for collaborative editing using ONLYOFFICE Docs (online document editors).
        In published posts, the editors are visible to all WordPress site visitors (both authorized and unauthorized) in the <b>Embedded</b> mode only.</p>
    <p><b>Editing files uploaded to WordPress</b></p>
    <p>All uploaded files from the <b>Media</b> section will appear on the <b>ONLYOFFICE -> Files</b> page. The editor opens in the same tab by clicking on the file name.
        Users with administrator rights are able to co-edit documents. All the changes are saved in the same file.</p>

    <p><b>Creating a post</b></p>
    <p>When creating a post, you can add the ONLYOFFICE element (block) and then upload a new file or select one from the <b>Media Library</b>.
        The added file will be displayed as the ONLYOFFICE logo with the file name in the currently edited post.
        After the post is published (when you press the <b>Publish</b> or <b>Update</b> button), your WordPress site visitors will have access to this file for viewing in the <b>Embedded</b> mode.</p>

    <h2 id="howitworks" class="copy-link">How it works</h2>
    <p>The ONLYOFFICE integration follows the API documented <a href="<%= Url.Action("basic") %>">here</a>.</p>

    <br />
    <p>Download the WordPress ONLYOFFICE integration plugin <a href="https://github.com/ONLYOFFICE/onlyoffice-wordpress" target="_blank">here</a>.</p>

</asp:Content>
