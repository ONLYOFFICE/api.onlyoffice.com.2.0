<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plone ONLYOFFICE integration plugin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Plone ONLYOFFICE integration plugin</span>
    </h1>

    <p>This <a target="_blank" href="https://github.com/ONLYOFFICE/onlyoffice-plone">plugin</a> allows users to edit office documents within <a target="_blank" href="https://plone.org/">Plone</a> using ONLYOFFICE Docs.</p>

    <h2 id="features" class="copy-link">Features</h2>

    <ul>
        <li>Currently, the following document formats can be edited: DOCX, XLSX, PPTX.</li>
        <li>The following formats are available for viewing only: PDF, ODT, ODS, ODP, DOC, XLS, PPT.</li>
        <li>The plugin will create a new <b>ONLYOFFICE Edit</b> menu option within the document library for Office documents. 
            This allows multiple users to collaborate in real time and to save back those changes to Plone.</li>
    </ul>

    <h2 id="install-doc" class="copy-link">Installing ONLYOFFICE Docs</h2>

    <p>
        You will need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Plone and any end-clients. 
        If that is not the case, use the official <a href="https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx" target="_blank">ONLYOFFICE Docs documentation page</a>. 
        ONLYOFFICE Docs must also be able to POST to Plone directly.
    </p>

    <p>The easiest way to start an instance of ONLYOFFICE Docs is to use <a href="https://github.com/onlyoffice/Docker-DocumentServer" target="_blank">Docker</a>.</p>


    <h2 id="install" class="copy-link">Installing Plone ONLYOFFICE integration plugin</h2>

    <p>To start using ONLYOFFICE Docs with Plone, the following steps must be performed:</p>
    <ol>
        <li>Install plugin by adding it to your <em>buildout.cfg</em>:
            <span class="commandline">
[buildout]

...

eggs =
    onlyoffice.connector
            </span>
        </li>

        <li>Run <em>bin/buildout</em>.</li>

        <li>Go to <b>Site Setup -> Add-ons</b> and press the <b>Install</b> button to enable plugin.</li>
    </ol>

    <p>You could also install plugin via Docker:</p>
    <span class="commandline">
docker run --rm -p 8080:8080 -e ADDONS="onlyoffice.connector" plone
    </span>

    <p>Both options will automatically install plugin from <a target="_blank" href="https://pypi.org/project/onlyoffice.connector/">PyPi</a>.</p>

    <h2 id="configuration" class="copy-link">Configuring Plone ONLYOFFICE integration plugin</h2>

    <p>
        To configure plugin go to <b>Site Setup</b>.
        Scroll down to <b>Add-ons Configuration</b> section and press the <b>ONLYOFFICE Configuration</b> button.
    </p>

    <h2 id="developing" class="copy-link">Developing Plone ONLYOFFICE plugin</h2>

    <ol>
        <li>Clone repository and change directory:

            <span class="commandline">
git clone --branch deploy git@github.com:ONLYOFFICE/onlyoffice-plone.git
cd onlyoffice-plone
            </span>
        </li>
        <li>Create a <em>virtualenv</em> in the package.</li>
        <li>Install requirements with pip.</li>
        <li>Run <em>buildout</em>:
            <span class="commandline">
virtualenv .
./bin/pip install -r requirements.txt
./bin/buildout
            </span>
        </li>
        <li>Start Plone in foreground:
            <span class="commandline">
./bin/instance fg
            </span>
        </li>
    </ol>

    <p>
        If you have a working Plone instance, you can install plugin by adding the project files to the <em>scr</em> directory:
    </p>
    <ol>
        <li>In the <em>scr</em> directory create the <em>onlyoffice.connector</em> directory.</li>
        <li>Put your project files received by Git into the <em>onlyoffice.connector</em> directory.</li>
        <li>Edit the <em>buildout.cfg</em> file:
            <span class="commandline">
[buildout]

...

eggs =
    onlyoffice.connector
develop = 
    src/onlyoffice.connector
            </span>
        </li>
        <li>Rerun buildout for the changes to take effect:
            <span class="commandline">
.bin/buildout
            </span>
        </li>
        <li>Then start or restart your Plone instance.</li>
    </ol>
    <note>
        Plone is based on <b>Zope server</b> and will not run as <em>root</em> user.
        If you intend to run it as <em>root</em> user, you must supply <a target="_blank" href="https://zope.readthedocs.io/en/2.12/SETUID.html">effective-user directive</a>. In order to do so, add <em>effective-user &lt;username&gt;</em> line to <em>./parts/instance/etc/zope.conf</em>.
    </note>

    <h2 id="upgrade" class="copy-link">Upgrade Plone ONLYOFFICE integration plugin</h2>

    <ol>
        <li>If you specified a concrete plugin version in your <em>buildout.cfg</em> file (so-called <em>pinning</em>, and a recommended practice), like <em>onlyoffice.connector = 1.0.0</em>, update this reference to point to the newer version. 
            If the plugin version is not specified, then the latest version will be automatically loaded:
            <span class="commandline">
[versions]

...

onlyoffice.connector = 1.0.1
            </span>
        </li>
        <li>Run <em>bin/buildout</em>. Wait until a new version is downloaded and installed.</li>
        <li>Restart Plone. Your site may look weird, or even be inaccessible until you have performed the next step.</li>
        <li>Navigate to the <b>Add-on</b> screen (add <em>/prefs_install_products_form</em> to your site URL) and in the <b>Upgrades</b> list select <b>onlyoffice.connector</b> and click <b>Upgrade onlyoffice.connector</b>.</li>
    </ol>


    <h2 id="how-it-works" class="copy-link">How it works</h2>
    <ol>
        <li>User navigates to a document within Plone and selects the <b>ONLYOFFICE Edit</b> action.</li>
        <li>
            <p>Plone prepares a JSON object for the Document Server with the following properties:</p>
            <ul>
                <li><b>url</b>: the URL that ONLYOFFICE Docs uses to download the document;</li>
                <li><b>callbackUrl</b>: the URL that ONLYOFFICE Docs informs about status of the document editing;</li>
                <li><b>key</b>: the <em>UUID+Modified Timestamp</em> to instruct ONLYOFFICE Docs whether to download the document again or not;</li>
                <li><b>title</b>: the document title (name).</li>
            </ul>
        </li>
        <li>Plone constructs a page from the <em>.pt</em> template, filling in all of those values so that the client browser can load up the editor.</li>
        <li>The client browser makes a request to the JavaScript library from ONLYOFFICE Docs and sends ONLYOFFICE Docs the DocEditor configuration with the above properties.</li>
        <li>Then ONLYOFFICE Docs downloads the document from Plone and the user begins editing.</li>
        <li>ONLYOFFICE Docs sends a POST request to the <em>callback</em> URL to inform Plone that a user is editing the document.</li>
        <li>When all users and client browsers are done with editing, they close the editing window.</li>
        <li>After <a href="<%= Url.Action("save") %>#savedelay">10 seconds</a> of inactivity, ONLYOFFICE Docs sends a POST to the <em>callback</em> URL letting Plone know that the clients have finished editing the document and closed it.</li>
        <li>Plone downloads a new version of the document, replacing the old one.</li>
    </ol>

    <br />
    <p>Download the Plone ONLYOFFICE integration plugin <a href="https://github.com/ONLYOFFICE/onlyoffice-plone" target="_blank">here</a>.</p>

</asp:Content>
