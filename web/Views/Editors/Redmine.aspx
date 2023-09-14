<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Redmine ONLYOFFICE integration plugin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Redmine ONLYOFFICE integration plugin</span>
    </h1>

    <p class="dscr">This <a href="https://github.com/ONLYOFFICE/onlyoffice-redmine" target="_blank">plugin</a> enables users to edit office documents within <a href="https://www.redmine.org/" target="_blank">Redmine</a> using ONLYOFFICE Docs.</p>

    <p>The plugin is available in the official <a href="https://www.redmine.org/plugins/onlyoffice_redmine" target="_blank">Redmine Plugins Directory</a>.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently, the following document formats can be edited: DOCX, XLSX, PPTX, DOCXF, OFORM.</li>
        <li>The following formats are available for viewing only: DOC, DOCM, DOT, DOTX, DOTM, ODT, FODT, OTT, RTF, TXT, HTML, HTM, MHT, XML, PDF, DJVU, FB2, EPUB, XPS, XLS, XLSM, XLT, XLTX, XLTM, ODS, FODS, OTS, CSV, PPS, PPSX, PPSM, PPT, PPTM, POT, POTX, POTM, ODP, FODP, OTP.</li>
        <li>The plugin will create a new <b>Edit in ONLYOFFICE</b> menu option within the document library for office documents. This allows multiple users to collaborate in real time and to save back those changes to Redmine.</li>
    </ul>


    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>
    <p>
        You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Redmine and any end clients. 
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>. 
        ONLYOFFICE Docs must also be able to POST to Redmine directly.
    </p>
    <p>The easiest way to start an instance of ONLYOFFICE Docs is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="install" class="copy-link">Installing Redmine ONLYOFFICE integration plugin</h2>
    <p>To start using ONLYOFFICE Docs with Redmine, the following steps must be performed:</p>
    <ol>
        <li>If you're new to Redmine, install it following <a href="https://www.redmine.org/projects/redmine/wiki/RedmineInstall" target="_blank">these instructions</a>.</li>
        <li>
            <p>Download Redmine ONLYOFFICE integration plugin. You can either clone the master branch or download the latest zipped version. 
            Before installing, make sure that the Redmine instance is stopped:</p>
            <pre>
git clone https://github.com/ONLYOFFICE/onlyoffice-redmine
</pre>
            <p>Go to the Redmine ONLYOFFICE integration plugin folder and get a submodule:</p>
            <pre>
cd onlyoffice-redmine
git submodule update --init --recursive
</pre>
        </li>
        <li>Put <b>onlyoffice_redmine</b> plugin directory into plugins. The plugins sub-directory must be named as <b>onlyoffice_redmine</b>. 
            If necessary, rename <b>onlyoffice_redmine-x.y.z</b> to <b>onlyoffice_redmine</b>.</li>
        <li>
            <p>Go to the Redmine directory:</p>
            <pre>
cd redmine
</pre>
        </li>
        <li>
            <p>Install dependencies:</p>
            <pre>
bundle install
</pre>
        </li>
        <li>
            <p>Initialize/Update database:</p>
            <pre>
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production bundle exec rake redmine:plugins:migrate NAME=onlyoffice_redmine
</pre>
        </li>
    </ol>


    <h2 id="configuration" class="copy-link">Configuring Redmine ONLYOFFICE integration plugin</h2>
    <p>Configure the plugin via the Redmine interface. Go to <b>Administration -> Plugins -> Onlyoffice Redmine plugin -> Configure</b> and specify the following parameters:</p>
    <ul>
        <li>
            <p><b>Document Editing Service address</b>: To connect ONLYOFFICE Docs, enter the following address:</p>
            <pre>
https://&lt;documentserver&gt;:&lt;port&gt;/
</pre>
            <p>where <b>documentserver</b> is the name of the server and <b>port</b> is the port number with <b>ONLYOFFICE Docs</b> installed.</p>
        </li>
        <li><b>Secret key</b>: Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity.
            Specify your own secret key on the Redmine configuration page. In the ONLYOFFICE Docs <a href="/editors/signature/">config file</a>, specify the same secret key and enable the validation.</li>
    </ul>
    <p>You can also configure the <b>Editor customization settings</b>:</p>
    <ul>
        <li>Display or hide <b>Chat</b> menu button</li>
        <li>Display the header more compact</li>
        <li>Display or hide <b>Feedback & Support</b> menu button</li>
        <li>Display or hide <b>Help</b> menu button</li>
        <li>Display monochrome toolbar header</li>
    </ul>


    <h2 id="howitworks" class="copy-link">How it works</h2>
    <p>The ONLYOFFICE integration follows the API documented <a href="<%= Url.Action("basic") %>">here</a>.</p>
    <p>Redmine ONLYOFFICE integration plugin allows opening files uploaded to the <b>Issues</b>, <b>Files</b>, <b>Documents</b>, <b>Wiki</b>, or <b>News</b> modules for viewing and co-editing. 
        For each module, the access rights to view/edit files depend on the settings (permissions) of the user role.</p>

    <ul>
        <li>
            <p><b>Issues module</b></p>
            <p>Files added when creating a task or from comments to a task are available for viewing and editing.</p>
            <p>File editing is available for user roles with the <b>Edit issues</b> permission.</p>
            <p>Opening files for viewing is available for user roles with the <b>View issues</b> permission.</p>
        </li>
        <li>
            <p><b>Files module</b></p>
            <p>Files are available only for viewing for users who have the <b>View files</b> or <b>Manage files</b> permissions.</p>
        </li>
        <li>
            <p><b>Documents module</b></p>
            <p>The uploaded files in this module are available for viewing and editing.</p>
            <p>Document editing is available for user roles with the <b>Edit documents</b> permission.</p>
            <p>Opening documents for viewing is available for user roles with the <b>View documents</b> permission.</p>
        </li>
        <li>
            <p><b>Wiki module</b></p>
            <p>The uploaded files in this module are available for viewing and editing.</p>
            <p>File editing is available for user roles with the <b>Edit Wiki pages</b> permission.</p>
            <p>Opening files for viewing is available for user roles with the <b>View Wiki</b> permission.</p>
        </li>
        <li>
            <p><b>News module</b></p>
            <p>The uploaded files in this module are available for viewing and editing.</p>
            <p>File editing is available for user roles with the <b>Manage news</b> permission.</p>
            <p>Opening files for viewing is available for user roles with the <b>View news</b> permission.</p>
        </li>
        <li>
            <p><b>Saving changes</b></p>
            <p>All the changes made in the document are saved in the original file.</p>
        </li>
    </ul>

    <br />
    <p>Download the Redmine ONLYOFFICE integration plugin <a href="https://github.com/ONLYOFFICE/onlyoffice-redmine" target="_blank">here</a>.</p>

</asp:Content>
