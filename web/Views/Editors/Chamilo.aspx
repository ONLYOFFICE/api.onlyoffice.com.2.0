<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Chamilo ONLYOFFICE integration plugin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Chamilo ONLYOFFICE integration plugin</span>
    </h1>

    <p class="dscr">This <a href="https://github.com/ONLYOFFICE/onlyoffice-chamilo" target="_blank">plugin</a> enables users to edit office documents within <a href="https://chamilo.org/en/" target="_blank">Chamilo</a> using ONLYOFFICE Docs.</p>

    <h2 id="features" class="copy-link">Features</h2>
    <ul>
        <li>Currently, the following document formats can be edited: DOCX, XLSX, PPTX, PPSX, DOCXF, OFORM.</li>
        <li>The following formats are available for viewing only: PDF, DJVU, TXT, CSV, ODT, ODS, ODP, DOC, XLS, PPT, PPS, EPUB, RTF, HTML, HTM, MHT, XPS.</li>
        <li>The plugin will create a new <b>Open with ONLYOFFICE</b> menu option within the document library for Office documents. 
            This allows multiple users to collaborate in real time and to save back those changes to Chamilo.</li>
    </ul>


    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>
    <p>
        You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Chamilo and any end clients. 
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>. 
        ONLYOFFICE Docs must also be able to POST to Chamilo directly.
    </p>
    <p>
        ONLYOFFICE Docs and Chamilo can be installed either on different computers, or on the same machine.
        If you use one machine, set up a custom port for Document Server as by default both ONLYOFFICE Docs and Chamilo work on port 80.
    </p>
    <p>The easiest way to start an instance of ONLYOFFICE Docs is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="collect" class="copy-link">Collecting Chamilo ONLYOFFICE integration plugin</h2>
    <ol>
        <li>
            <p>Get the latest version of the <a href="https://github.com/ONLYOFFICE/onlyoffice-chamilo" target="_blank">repository</a> running the command:</p>
            <span class="commandline">git clone https://github.com/ONLYOFFICE/onlyoffice-chamilo
cd onlyoffice-chamilo
</span>
        </li>
        <li>
            <p>Get a submodule:</p>
            <span class="commandline">git submodule update --init --recursive</span>
        </li>
        <li>
            <p>Collect all files:</p>
            <span class="commandline">mkdir /tmp/onlyoffice-deploy
mkdir /tmp/onlyoffice-deploy/onlyoffice
cp -r ./ /tmp/onlyoffice-deploy/onlyoffice
cd /tmp/onlyoffice-deploy/onlyoffice
rm -rf ./.git*
rm -rf */.git*
</span>
        </li>
        <li>
            <p>Archive the files obtained in the previous step:</p>
            <span class="commandline">cd ../
zip onlyoffice.zip -r onlyoffice
</span>
        </li>
    </ol>


    <h2 id="install" class="copy-link">Installing Chamilo ONLYOFFICE integration plugin</h2>
    <p>To start using ONLYOFFICE Docs with Chamilo, the following steps must be performed:</p>
    <ol>
        <li>Go to Chamilo <b>Administration</b> and choose the <b>Plugins</b> section.</li>
        <li>
            <p>Select the ONLYOFFICE plugin and click the <b>Enable the selected plugins</b> button.</p>
            <p>If you want more up-to-date versions of the plugin, you need to replace the pre-installed default plugin folder with the newly collected plugin:</p>
            <span class="commandline">/var/www/html/chamilo-1.11.16/plugin/onlyoffice</span>
            <p>where <b>chamilo-1.11.16</b> is your current Chamilo version.</p>
        </li>
    </ol>

    <p>If your Chamilo version is lower than 1.11.16:</p>
    <ol>
        <li>Go to Chamilo <b>Administration</b>, choose the <b>Plugins</b> section, and click the <b>Upload plugin</b> button.</li>
        <li>Upload <em>onlyoffice.zip</em> from the <b>Releases</b> section. You'll see the plugin list.</li>
        <li>Launch <em>composer install</em> from the Chamilo root folder.</li>
        <li>Return to the plugin list, select the ONLYOFFICE plugin, and click the <b>Enable the selected plugins</b> button.</li>
    </ol>


    <h2 id="configuration" class="copy-link">Configuring Chamilo ONLYOFFICE integration plugin</h2>
    <p>On the <b>Plugins</b> page, find ONLYOFFICE and click <b>Configure</b>. You'll see the <b>Settings</b> page. Enable the plugin and specify Document Server address:</p>
    <span class="commandline">https://&lt;documentserver&gt;/</span>
    <p>
        where the <b>documentserver</b> is the name of the server with <b>ONLYOFFICE Docs</b> installed.
        The address must be accessible from the user browser and from the Chamilo server.
        The Chamilo server address must also be accessible from <b>ONLYOFFICE Docs</b> for correct work.
    </p>
    <p>Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity.
        Specify your own <b>Secret key</b> on the Chamilo <b>Settings</b> page. In the ONLYOFFICE Docs <a href="/editors/signature/">config file</a>, specify the same secret key and enable the validation.</p>


    <h2 id="howitworks" class="copy-link">How it works</h2>
    <p>The ONLYOFFICE integration follows the API documented <a href="<%= Url.Action("basic") %>">here</a>.</p>
    <ol>
        <li>To create a new file, the teacher opens the necessary folder and clicks the <b>Create new</b> ONLYOFFICE icon.</li>
        <li>The user is redirected to the file creation page where they need to enter the file name and format (text document, spreadsheet, or presentation).
            The browser calls the <em>/plugin/onlyoffice/create.php</em> method. It adds a copy of an empty file to the course folder.</li>
        <li>To open an existing file, the user chooses the <b>Open with ONLYOFFICE</b> icon.</li>
        <li>
            <p>The request is sent to <em>/plugin/onlyoffice/editor.php?docId="document identificator"</em>.
            The server processes the request, generates the editor initialization configuration with the following properties:</p>
            <ul>
                <li><b>url</b> - the URL that ONLYOFFICE Docs uses to download the document;</li>
                <li><b>callbackUrl</b> - the URL that ONLYOFFICE Docs uses to inform about the status of document editing;</li>
                <li><b>documentServerUrl</b> - the URL that the client needs to respond to ONLYOFFICE Docs (can be set at the administrative settings page);</li>
                <li><b>key</b> - the etag to instruct ONLYOFFICE Docs whether to download the document again or not.</li>
            </ul>
        </li>
        <li>The server returns a page with a script to open the editor.</li>
        <li>The browser opens this page and loads the editor.</li>
        <li>The browser makes a request to ONLYOFFICE Docs and passes the document configuration to it.</li>
        <li>ONLYOFFICE Docs loads the document and the user starts editing.</li>
        <li>ONLYOFFICE Docs sends a POST request to <em>callbackUrl</em> to inform Chamilo that the user is editing the document.</li>
        <li>When all the users have finished editing, they close the editor window.</li>
        <li>After <a href="<%= Url.Action("save") %>#savedelay">10 seconds</a>, ONLYOFFICE Docs makes a POST request to <em>callbackUrl</em> with the information that editing has ended and sends a link to a new document version.</li>
        <li>Chamilo loads a new version of the document and overwrites the file.</li>
    </ol>

    <br />
    <p>Download the Chamilo ONLYOFFICE integration plugin <a href="https://github.com/ONLYOFFICE/onlyoffice-chamilo/tree/master" target="_blank">here</a>.</p>

</asp:Content>
