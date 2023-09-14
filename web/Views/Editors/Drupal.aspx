<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Drupal ONLYOFFICE connector module
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Drupal ONLYOFFICE connector module</span>
    </h1>

    <p class="dscr">The ONLYOFFICE <a href="https://github.com/ONLYOFFICE/onlyoffice-drupal" target="_blank">module</a> enables users to edit files in the Media module from <a href="https://www.drupal.org/" target="_blank">Drupal</a> using ONLYOFFICE Docs.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently, the following document formats can be edited: DOCX, XLSX, PPTX.</li>
        <li>The following formats are available for viewing: DJVU, DOC, DOCM, DOCX, DOT, DOTM, DOTX, EPUB, FB2, FODT, HTML, MHT, ODT, OTT, OXPS, PDF, PPTX, RTF, TXT, XPS, XML, CSV, FODS, ODS, OTS, XLS, XLSM, XLSX, XLT, XLTM, XLTX, FODP, ODP, OTP, POT, POTM, POTX, PPS, PPSM, PPSX, PPT, PPTM.</li>
        <li>The module also allows to preview files on public pages.</li>
        <li>The module will create a new <b>Edit in ONLYOFFICE</b> menu option within the document library for office documents.
            This allows multiple users to collaborate in real time and save back those changes to Drupal.</li>
    </ul>


    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>
    <p>
        You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Drupal and any end clients. 
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>. 
        ONLYOFFICE Docs must also be able to POST to Drupal directly.
    </p>
    <p>The easiest way to install an instance of ONLYOFFICE Docs is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="install" class="copy-link">Installing Drupal ONLYOFFICE connector module</h2>
    <p>To start using ONLYOFFICE Docs with Drupal, follow these steps:</p>
    <p><b>Step 1: Add the module</b></p>
    <p>There are two options to add the Drupal module.</p>
    <p><b>Option 1</b>. Add a module using <a href="https://www.drupal.org/docs/extending-drupal/installing-modules#s-add-a-module-using-drupals-user-interface-easy" target="_blank">Drupal's User Interface</a>.</p>
    <ol>
        <li>On the <b>Admin</b> toolbar project page on <a href="https://www.drupal.org/download" target="_blank">drupal.org</a>, scroll to the <b>Downloads</b> section at the bottom of the page.</li>
        <li>Copy the address of the <em>tar.gz</em> link. Depending on your device and browser, you might do this by right clicking and selecting <b>Copy link address</b>.</li>
        <li>In the <b>Manage</b> administrative menu, navigate to <b>Extend</b> (admin/modules). The <b>Extend</b> page appears.</li>
        <li>Click <b>Install new module</b>. The <b>Install new module</b> page appears.</li>
        <li>In the field <b>Install from a URL</b>, paste the copied download link.</li>
        <li>Click <b>Install</b> to upload and unpack the new module on the server. The files are being downloaded to the modules directory.</li>
    </ol>

    <p><b>Option 2</b>. Add a module with <a href="https://www.drupal.org/docs/extending-drupal/installing-modules#s-add-a-module-with-composer" target="_blank">Composer</a>.</p>
    <p>Enter the following command at the root of your site:</p>
    <pre>
composer require onlyoffice/onlyoffice-drupal
</pre>

    <p><b>Step 2: Enable the module</b></p>
    <p>There are two options to enable the Drupal module.</p>
    <p><b>Option 1</b>. Using <a href="https://www.drupal.org/docs/extending-drupal/installing-modules#s-add-a-module-using-drupals-user-interface-easy" target="_blank">Drupal's User Interface</a>.</p>
    <ol>
        <li>Navigate to the <b>Extend</b> page (admin/modules) via the <b>Manage</b> administrative menu.</li>
        <li>Locate the ONLYOFFICE Connector module and check the box.</li>
        <li>Click <b>Install</b> to enable.</li>
    </ol>

    <p><b>Option 2</b>. Using the command line.</p>
    <ol>
        <li>
            <p>Run the following <b>Drush</b> command, giving the project name as a parameter:</p>
            <pre>
drush pm:enable onlyoffice
</pre>
        </li>
        <li>Follow the instructions on the screen.</li>
    </ol>

    <h2 id="configuration" class="copy-link">Configuring Drupal ONLYOFFICE connector module</h2>
    <p>In Drupal, open <em>~/config/system/onlyoffice-settings</em> page with administrative settings for <b>ONLYOFFICE</b> section.
        Enter the address to connect ONLYOFFICE Docs:</p>
    <pre>
https://&lt;documentserver&gt;/
</pre>
    <p>where <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed. The address must be accessible for the user browser and from the Drupal server.
        The Drupal server address must also be accessible from ONLYOFFICE Document Server for correct work.</p>
    <p>Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity.
        Specify your own <b>Secret key</b> in the Drupal administrative configuration. In the ONLYOFFICE Docs <a href="/editors/signature/">config file</a>, specify the same secret key and enable the validation.</p>

    <h2 id="usage" class="copy-link">Using Drupal ONLYOFFICE connector module</h2>
    <p><b>Edit files already uploaded to Drupal</b></p>
    <p>All office files added to Media can be opened for editing. In the last table column, call the drop-down list and select the <b>Edit in ONLYOFFICE</b> action.
        The editor opens in the same tab. Users with Administrator rights are able to co-edit files using ONLYOFFICE Docs. All changes are saved in the same file.</p>

    <p><b>Create new posts</b></p>
    <p>When creating a post, you can add the new ONLYOFFICE element:</p>
    <ol>
        <li>Go to <b>Structure -> Content types -> Manage fields</b>. On the opened page, click <b>Add field</b>. Add a new field: <b>File</b> or <b>Media</b>. Set the label and save.</li>
        <li>For the added <b>File</b> field, specify the file extensions. Go to <b>Structure -> Content types -> Manage fields</b>.
            In the <b>Allowed file extensions</b> field, specify the file formats that will be shown in the editors (docx, xlsx, pptx).</li>
        <li>For the added <b>Media</b> field, click the <b>Document</b> checkbox.</li>
        <li>Go to <b>Structure -> Media types -> Document -> Manage display</b>.</li>
        <li>For the <b>Document</b> field, specify the <em>ONLYOFFICE Preview</em> format. By clicking on the gear symbol, you can specify the dimensions of the embedded editor window.</li>
    </ol>
    <p>When you are done with the pre-settings, you can create posts on the <b>Content</b> tab. Click on the <b>Add Content</b> button and select the created content.</p>
    <p>Specify title and select a file (if the content contains <b>File</b> fields).</p>
    <p>For <b>Media</b> section, specify the name of the previously uploaded file.</p>
    <p>Your site visitors will also be able to view the created page (<b>People -> Permissions -> View published content</b>).</p>

    <h2 id="howitworks" class="copy-link">How it works</h2>
    <p>The ONLYOFFICE integration follows the API documented <a href="<%= Url.Action("basic") %>">here</a>.</p>

    <br />
    <p>Download the Drupal ONLYOFFICE connector module <a href="https://github.com/ONLYOFFICE/onlyoffice-drupal" target="_blank">here</a>.</p>

</asp:Content>
