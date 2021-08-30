<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE SharePoint integration solution
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ONLYOFFICE SharePoint integration solution</span>
    </h1>

    <p class="dscr">
        This <a href="https://github.com/ONLYOFFICE/onlyoffice-sharepoint" target="_blank">solution</a> enables users to edit office documents from SharePoint using ONLYOFFICE Docs.
    </p>

    <h2 id="features" class="copy-link">Features</h2>

    <ul>
        <li>Currently, the following document formats can be edited: DOCX, XLSX, PPTX.</li>
        <li>The following formats are available for viewing only: PDF, DJVU, TXT, CSV, ODT, ODS, ODP, DOC, XLS, PPT, PPS, EPUB, RTF, HTML, HTM, MHT, XPS.</li>
        <li>The plugin will create a new <b>Edit in ONLYOFFICE</b> menu option within the context menu of the file and the ribbon for Office documents. 
            This allows multiple users to collaborate in real time and to save back those changes to SharePoint.</li>
    </ul>

    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>
    <p>
        You will need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from SharePoint and any end clients.
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>.
        ONLYOFFICE Docs must also be able to POST to SharePoint directly.
    </p>
    <p>The easiest way to start an instance of ONLYOFFICE Docs is to use <a href="https://github.com/ONLYOFFICE/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2>Installing ONLYOFFICE SharePoint integration solution</h2>
    <p>To start using ONLYOFFICE Docs with SharePoint, the following steps must be performed:</p>
    <ol>
        <li>Click <b>Start</b>, point to <b>All Programs</b>, then choose <b>Administrative Tools</b> and click <b>Services</b>. Make sure that <b>SharePoint Administration</b> service is started.</li>
        <li>Click <b>Start -> SharePoint Management Shell</b>, go to the directory with the <em>.wsp</em> file.</li>
        <li>Run the <em>Install.ps1</em> script:
            <span class="commandline">PS> .\Install.ps1</span>
        </li>
        <li>
            <p>Enter your SharePoint site address:</p>
            <span class="commandline">https://&lt;yoursharepointsite&gt;</span>
            <div class="note">Alternatively to steps <b>3</b> and <b>4</b> you can type the following command:
                <span class="commandline">Add-SPSolution -LiteralPath&lt;solutionpath&gt;/onlyoffice.wsp</span>
                On the <b>SharePoint Central Administration</b> home page, click <b>System Settings -> Farm Management -> Manage farm solutions</b>.
                On the <b>Solution Management</b> page, click <b>onlyoffice.wsp -> Deploy Solution</b>.
            </div>
        </li>
        <li>On the <b>SharePoint Central Administration</b> home page, under <b>Application Management</b>, click <b>Manage web applications</b>.</li>
        <li>Make sure you select your site and click the <b>Authentication Providers</b> icon.</li>
        <li>In the <b>Authentication Providers</b> pop-up window, click <b>Default zone</b>.</li>
        <li>Under <b>Edit Authentication</b>, check <b>Enable anonymous access</b> and click <b>Save</b>.</li>
        <li>Go back to <b>Web Application Management</b> and click the <b>Anonymous Policy</b> icon.</li>
        <li>Under <b>Anonymous Access Restrictions</b>, select your <b>Zone</b>, set the <b>Permissions</b> to <em>None – No policy</em> and click <b>Save</b>.</li>
    </ol>

    <h2 id="configure" class="copy-link">Configuring SharePoint ONLYOFFICE integration solution</h2>
    <p>
        In SharePoint open the <em>/_layouts/15/Onlyoffice/Settings.aspx</em> page with administrative settings.
        Enter the following address to connect ONLYOFFICE Docs:
    </p>

    <span class="commandline">https://&lt;documentserver&gt;/</span>

    <p>
        where the <b>documentserver</b> is the name of the server with the <b>ONLYOFFICE Docs</b> installed.
        The address must be accessible for the user browser and from the SharePoint server.
        The SharePoint server address must also be accessible from <b>ONLYOFFICE Docs</b> for correct work.
    </p>

    <div class="note">
        Please note, that if you have subsites set up with SharePoint, you will need to additionally configure ONLYOFFICE Docs connection with each of them, in order for it to work properly.
        Go to each subsite settings and enter the Document Server address to the proper field.
    </div>


    <h2>Compiling ONLYOFFICE SharePoint integration solution</h2>
    <p>There are two ways to compile ONLYOFFICE SharePoint integration solution:</p>
    <ol style="list-style-type: lower-alpha;">
        <li>Using <b>MS Visual Studio</b>:
            <ol>
                <li>Enter the SharePoint server and open this project in Visual Studio.</li>
                <li>In <b>Solution Explorer</b>, open the shortcut menu for the project and then choose <b>Publish</b>.</li>
                <li>In the <b>Publish</b> dialog box, choose the <b>Publish to File System</b> option button.</li>
                <li>
                    Click the <b>Publish</b> button.
                    When the publishing process is finished, the solution <em>.wsp</em> file will be created.
                </li>
                <li>Copy the resulting file to the folder with the <em>Install.ps1</em> file (<b>BuildAndInstall</b> folder by default).</li>
            </ol>
        </li>
        <li>With the help of the <em>build.bat</em> file provided:
            <ol>
                <li>Go to the <b>BuildAndInstall</b> folder.</li>
                <li>Run the <em>build.bat</em> file.</li>
                <li>The resulting solution <em>.wsp</em> file will be created and placed to the <b>BuildAndInstall</b> folder.</li>
            </ol>
        </li>
    </ol>


    <h2 id="howitworks" class="copy-link">How it works</h2>
    <ol>
        <li>User navigates to a document within SharePoint and selects the <b>Edit in ONLYOFFICE</b> action on context menu or ribbon.</li>
        <li>SharePoint makes a request to the editor page (URL of the form: <em>/_layouts/15/Onlyoffice/editorPage.aspx?SPListItemId={SelectedItemId}&SPListId={SelectedListId}&SPSource={Source}&SPListURLDir={ListUrlDir}</em>).</li>
        <li>
            <p>SharePoint prepares a JSON object with the following properties:</p>
            <ul>
                <li><b>url</b> - the URL that ONLYOFFICE Docs uses to download the document;</li>
                <li><b>callbackUrl</b> - the URL that ONLYOFFICE Docs informs about status of the document editing;</li>
                <li><b>key</b> - the file identifier from SharePoint;</li>
                <li><b>title</b> - the document title (name);</li>
                <li><b>id</b> - the user identifier;</li>
                <li><b>name</b> - the user name.</li>
            </ul>
        </li>
        <li>SharePoint constructs a page, filling in all of those values so that the client browser can load up the editor.</li>
        <li>The client browser makes a request to the JavaScript library from ONLYOFFICE Docs and sends ONLYOFFICE Docs the DocEditor configuration with the above properties.</li>
        <li>Then ONLYOFFICE Docs downloads the document from SharePoint and the user begins editing.</li>
        <li>When all users and client browsers are done with editing, they close the editing window.</li>
        <li>After <a href="<%= Url.Action("save") %>#savedelay">10 seconds</a> of inactivity, ONLYOFFICE Docs sends a POST to the callback URL letting SharePoint ONLYOFFICE solution know that the clients have finished editing the document and closed it.</li>
        <li>SharePoint downloads a new version of the document, replacing the old one.</li>
    </ol>

    <br />
    <p>Download the ONLYOFFICE SharePoint integration solution <a href="https://github.com/ONLYOFFICE/onlyoffice-sharepoint" target="_blank">here</a>.</p>

</asp:Content>
