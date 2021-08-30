<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">How to integrate online editors into your own website on .Net (C#)</span>
</h1>

<h2>Overview</h2>
<p class="dscr">This example will help you integrate ONLYOFFICE Docs into your web application written in .Net (C#).</p>

<div class="note">
    The integration examples are used to demonstrate document editors functions and the ways to connect <b>Document Server</b> to your own application.
    <b>DO NOT USE</b> these examples on your own server without <b>PROPER CODE MODIFICATIONS</b>!
</div>

<h2 id="win-1" class="copy-link"><span class="style_step">Step 1. </span>Install ONLYOFFICE Docs</h2>
<p>Download and install <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE Docs</a> (packaged as Document Server).</p>
<p>See the detailed guide to learn how to install Document Server <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api_csharp_example">for Windows</a>, <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api_csharp_example">for Linux</a>, or <a href="https://helpcenter.onlyoffice.com/server/developer-edition/docker/docker-installation.aspx?from=api_csharp_example">for Docker</a>.</p>

<h2 id="win-2" class="copy-link"><span class="style_step">Step 2. </span>Download the .Net (C#) code for the editors integration</h2>
<p>Download the <a href="<%= Url.Action("demopreview") %>">.Net (C#) example</a> from our site.</p>
<p>
    Connect the editors to your website by specifying the path to the editors installation in the <em>settings.config</em> file:
</p>
<pre>&lt;add key="files.docservice.url.site" value="https://documentserver/" /&gt;</pre>

<p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>
<p>If you want to experiment with the editor configuration, modify the <a href="<%= Url.Action("advanced") %>">parameters</a> in the <em>DocEditor.aspx</em> file.</p>

<h2 id="win-3" class="copy-link"><span class="style_step">Step 3. </span>Install the prerequisites</h2>
<p>Check that your system meets the requirements:</p>
<ul>
    <li><b>Microsoft .NET Framework</b>: version 4.5 (download it from the <a href="https://www.microsoft.com/en-US/download/details.aspx?id=30653">official Microsoft website</a>);</li>
    <li><b>Internet Information Services</b>: version 7 or later.</li>
</ul>

<h2 id="win-4" class="copy-link"><span class="style_step">Step 4. </span>Run your website with the editors</h2>
<ol>
    <li>
        <p>Run the Internet Information Service (IIS) Manager:</p>
        <p><b>Start</b> -> <b>ControlPanel</b> -> <b>System and Security</b> -> <b>Administrative Tools</b> -> <b>Internet Information Services (IIS) Manager</b></p>
    </li>
    <li>
        <p>Add your website in the IIS Manager.</p>
        <p>On the <b>Connections</b> panel right-click the <b>Sites</b> node in the tree, then click <b>Add Website</b>.</p>
        <img alt="" src="<%= Url.Content("~/content/img/csharp/add.png") %>" />
    </li>
    <li>
        <p>In the <b>Add Website</b> dialog box specify the name of the folder with the .Net (C#) project in the <b>Site name</b> box.</p>
        <p>Specify the path to the folder with your project in the <b>Physical Path</b> box.</p>
        <p>Specify the unique value used only for this website in the <b>Port</b> box.</p>
        <img alt="" src="<%= Url.Content("~/content/img/csharp/sitename.png") %>" />
    </li>
    <li>
        <p>
            Check for the .NET platform version specified in IIS Manager for you website.
            Choose <b>v4.0.</b> version.
        </p>
        <p><b>Application Pools</b> -> right-click the platform name -> <b>Set application Pool defaults</b> -> <b>.NET CLR version</b></p>
        <img alt="" src="<%= Url.Content("~/content/img/csharp/platform.png") %>" />
    </li>
    <li>
        <p>Browse your website with the IIS Manager:</p>
        <p>Right-click the site -> <b>Manage Website</b> -> <b>Browse</b></p>
        <img alt="" src="<%= Url.Content("~/content/img/csharp/browse.png") %>" />
    </li>
</ol>

<h2 id="win-5" class="copy-link"><span class="style_step">Step 5. </span>Check accessibility</h2>
<p>
    In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of <b>documentserver</b> in the configuration files.
    Make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of <b>example.com</b> in the configuration files.
</p>

<p>If you integrated the editors successfully the result should look like the <a href="<%= Url.Action("demopreview") %>#DemoPreview">demo preview</a> on our site.</p>
