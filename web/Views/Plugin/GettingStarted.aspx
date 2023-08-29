<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Getting started with plugins
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Getting started with plugins</span>
    </h1>

    <p>Here are some fundamental concepts for building plugins step by step:</p>
    <ol>
        <li>Preparing</li>
        <li>Coding</li>
        <li>Adjusting the plugin style</li>
        <li>Localizing</li>
        <li>Preparing the plugin for publication</li>
        <li>Testing</li>
        <li>Publishing</li>
    </ol>


    <h2>Step 1. Preparing</h2>

    <ol>
        <li>To create a plugin and publish it in the <b>ONLYOFFICE Plugin Marketplace</b>, you need an account on <a href="https://github.com/" target="_blank">GitHub</a>.
            Sing in to an existing account or create a new one.</li>
        <li>
            <p>Fork the plugin marketplace repository: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io" target="_blank">https://github.com/ONLYOFFICE/onlyoffice.github.io</a>.</p>
            <p>You get a repository with the following address - <em>https://github.com/YOUR-USERNAME/ONLYOFFICE/onlyoffice.github.io</em>.</p>
        </li>
        <li>Build your own GitHub Pages site from this repository to test your plugin in the web version later.
            Explore the official <a href="https://docs.github.com/en/pages/quickstart" target="_blank">GitHub documentation</a> to learn how to do it.</li>
        <li>Clone the fork to your local computer.</li>
        <li>
            <p>Add a folder for your plugin to <em>onlyoffice.github.io/sdkjs-plugins/content/</em>.</p>
            <img class="screenshot-width-832" alt="New folder" src="<%= Url.Content("~/content/img/plugins/new-folder.png") %>" />
        </li>
    </ol>


    <h2>Step 2. Coding</h2>

    <p>Develop a plugin. Follow the plugin structure described <a href="<%= Url.Action("structure") %>">here</a>.
        The plugin folder must contain three files required for the plugin to work: <a href="<%= Url.Action("config") %>">config.json</a>,
        <a href="<%= Url.Action("indexhtml") %>">index.html</a>, <a href="<%= Url.Action("code") %>">pluginCode.js</a>.</p>
    <img class="screenshot-width-832" alt="Structure" src="<%= Url.Content("~/content/img/plugins/plugins-structure.png") %>" />
    <p>Use plugin <a href="<%= Url.Action("plugin") %>">methods</a> and <a href="<%= Url.Action("events") %>">events</a> while writing the plugin code.</p>


    <h2>Step 3. Adjusting the plugin style</h2>

    <p>Add the ONLYOFFICE <a href="<%= Url.Action("styles") %>">style sheet</a> to the <em>index.html</em> file to adjust your plugin to the ONLYOFFICE editor style:</p>
    <pre>
&lt;link rel="stylesheet" href="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.css"&gt;
</pre>
    <img alt="Controls" src="<%= Url.Content("~/content/img/plugins/controls.png") %>" />


    <h2>Step 4. Localizing</h2>

    <p>Create the <em>translations</em> folder in the plugin directory with <em>.json</em> files for each language you want to add the translation for. 
        Follow the instructions <a href="<%= Url.Action("localization") %>">here</a> to localize and apply the translations.</p>
    


    <h2>Step 5. Preparing the plugin for publication</h2>

    <ol>
        <li>Create an informative <b>About</b> window for your plugin. Add a short description and the plugin version, the company developer name and link to its website. 
            Follow the instructions <a href="<%= Url.Action("variations") %>">here</a> to create an <b>About</b> variation in the <em>config.json</em> file.</li>
        <img alt="About window" src="<%= Url.Content("~/content/img/plugins/about-variation.png") %>" />
        <li>
            <p>Prepare icons for the plugin and put them into the <em>resources</em> folder. Follow the instructions <a href="<%= Url.Action("icons") %>">here</a> to specify icon parameters in the <em>config.json</em> file.</p>
            <note>Please note that you need to prepare 8 icons for the plugin to display correctly in the plugin marketplace: 4 icon scaling types (125%, 150%, 175%, 200%) for both light and dark themes.</note>
        </li>
        <li>Don&#8217;t forget about the <em>readme</em> file where you can add a detailed plugin description, installation and usage instructions, known issues, etc. 
            Put this file into the main plugin folder.</li>
    </ol>


    <h2>Step 6. Testing</h2>

    <p>Put all the prepared files to the plugin folder and push it to the remote repository. That&#8217;s it! Now you can connect it to the desktop or web versions of ONLYOFFICE editors and test.</p>
    <ol>
        <li>
            <p>Test the plugin in the <a href="<%= Url.Action("installation/desktop") %>">ONLYOFFICE Desktop Editors</a>.</p>
            <p>You can run this app in the debug mode with the <em>--ascdesktop-support-debug-info</em> flag. To do this,
                follow the instructions <a href="<%= Url.Action("debugging", "desktop") %>">here</a> depending on the operating system you use.</p>
            <img alt="Hello world gif" width="750" height="500" src="<%= Url.Content("~/content/img/plugins/hello-world.gif")  %>" />
        </li>
        <li>
            <p>Test the plugin in the web version.</p>
            <p>To create an extension, open the <em>onlyoffice.github.io/store/plugin-dev/extension/inject.js</em> file and assign the path to your plugin on GitHub Pages site
                to the <b>URL_TO_PLUGIN</b> variable:</p>
            <pre>
var URL_TO_PLUGIN = "https://YOUR-USERNAME.github.io/onlyoffice.github.io/sdkjs-plugins/content/helloworld/"
</pre>
            <p>The <em>onlyoffice.github.io/store/plugin-dev/extension</em> folder is a new extension. Upload it to the <a href="<%= Url.Action("installation/cloud") %>#upload-extensions">browser</a>,
                run your ONLYOFFICE Document Server and find the plugin in the <a href="<%= Url.Action("installation/onpremises") %>#plugin-manager">Plugin Manager</a>.</p>
            <note>Please note that this is important to open your plugin in the <b>Plugin Manager</b> and check how it looks like in the <b>My Plugins</b> tab both in the light and dark themes.
                Improve the plugin display if necessary.</note>
            <img class="screenshot-width-832" alt="Plugin manager" src="<%= Url.Content("~/content/img/plugins/plugin-manager.png") %>" />
        </li>
    </ol>


    <h2>Step 7. Publishing</h2>

    <p>If you want your plugin to be available to other users in the <b>ONLYOFFICE Plugin Marketplace</b>, suggest it for publishing
        by creating a <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/pulls" target="_blank">pull request</a> from your fork to <em>https://github.com/ONLYOFFICE/onlyoffice.github.io</em>.
        If your plugin works properly, your pull request will be approved and the plugin will appear in the marketplace.</p>

    <br />
    <p>You can discuss plugin development, request a feature, or report a bug by posting an issue in the <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io/issues" target="_blank">marketplace repository</a>.</p>

</asp:Content>