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
        <li>Coding</li>
        <li>Adjusting the plugin style</li>
        <li>Localizing</li>
        <li>Preparing the plugin for publication</li>
        <li>Testing</li>
        <li>Publishing</li>
    </ol>


    <h2>Step 1. Coding</h2>

    <p>Create a plugin folder with the following files: <a href="<%= Url.Action("config") %>">config.json</a>,
        <a href="<%= Url.Action("indexhtml") %>">index.html</a>, <a href="<%= Url.Action("code") %>">pluginCode.js</a>.</p>
    <img alt="Structure" src="<%= Url.Content("~/content/img/plugins/plugins-structure.png") %>" />
    <p>Use plugin methods and events while writing the plugin code.</p>


    <h2>Step 2. Adjusting the plugin style</h2>

    <p>Add the ONLYOFFICE <a href="<%= Url.Action("styles") %>">style sheet</a> to the <em>index.html</em> file to adjust your plugin to the ONLYOFFICE editor style:</p>
    <pre>
&lt;link rel="stylesheet" href="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.css"&gt;
</pre>
    <img alt="Controls" src="<%= Url.Content("~/content/img/plugins/controls.png") %>" />


    <h2>Step 3. Localizing</h2>

    <p>Create the <em>translations</em> folder in the plugin directory with <em>.json</em> files for each language you want to add the translation for. 
        Follow the instructions <a href="<%= Url.Action("localization") %>">here</a> to localize and apply the translations.</p>
    


    <h2>Step 4. Preparing the plugin for publication</h2>

    <ol>
        <li>Create an informative <b>About</b> window for your plugin. Add a short description and the plugin version, the company developer name and link to its website. 
            Follow the instructions <a href="<%= Url.Action("variations") %>">here</a> to create an <b>About</b> variation in the <em>config.json</em> file.</li>
        <img alt="About window" src="<%= Url.Content("~/content/img/plugins/about-variation.png") %>" />
        <li>
            <p>Prepare icons for the plugin and put them into the main plugin folder. Follow the instructions <a href="<%= Url.Action("icons") %>">here</a> to specify icon parameters in the <em>config.json</em> file.</p>
        </li>
        <li>Don&#8217;t forget about the <em>readme</em> file where you can add a detailed plugin description, installation and usage instructions, known issues, etc. 
            Put this file into the main plugin folder.</li>
    </ol>


    <h2>Step 5. Testing</h2>

    <p>Put all the prepared files to the plugin folder. That&#8217;s it! 
        Now you can connect it to the <a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a> 
        or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> versions of ONLYOFFICE editors and test.</p>
    <img alt="Hello world gif" width="750" height="500" src="<%= Url.Content("~/content/img/plugins/hello-world.gif")  %>" />


    <h2>Step 6. Publishing</h2>

    <p>If you want your plugin to be available to other users on <a href="https://www.onlyoffice.com/en/app-directory" target="_blank">ONLYOFFICE App Directory</a>, 
        suggest it for publishing by contacting us at <a href="mailto:marketing@onlyoffice.com" target="_blank">marketing@onlyoffice.com</a>.</p>
    </br >
    <p>Code samples are available at <a href="https://github.com/ONLYOFFICE/sdkjs-plugins" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins</a>.</p>
    <p>If you are looking for ready-to-use plugins, please visit <a href="https://www.onlyoffice.com/en/app-directory" target="_blank">ONLYOFFICE App Directory</a>.</p>

</asp:Content>