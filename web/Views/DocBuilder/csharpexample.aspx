<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    How to integrate ONLYOFFICE Document Builder into your application on .Net (C#)
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">How to integrate ONLYOFFICE Document Builder into your application on .Net (C#)</span>
    </h1>
    <h2 id="introduction">Introduction</h2>
            <p class="dscr">To integrate <b>ONLYOFFICE Document Builder</b> into your own application on <b>.Net (C#)</b> you need to download and install <b>ONLYOFFICE Document Builder</b> to your computer and use the <a href="<%= Url.Action("integratingdocumentbuilder") %>">.Net (C#) example</a> for the integration. This guide will show you the sequence of actions to integrate <b>ONLYOFFICE Document Builder</b> successfully.</p>
            <h2 id="CSharp1"><span class="style_step">Step 1. </span>Download and install ONLYOFFICE Document Builder</h2>
            <p>First, download <a target="_blank" href="https://www.onlyoffice.com/document-builder.aspx"><b>ONLYOFFICE Document Builder</b></a> and install it to your computer.</p>
            <h2 id="CSharp2"><span class="style_step">Step 2. </span>Install the prerequisites</h2>
            <p>To run your website with the <b>ONLYOFFICE Document Builder</b> successfully, check if your system meets the necessary system requirements. It has got to have the following components installed:</p>
            <div class="builder_description">
                <ul>
                    <li>Microsoft .NET Framework: version 4.0 or later (download it from the <a target="_blank" href="https://www.microsoft.com/en-US/download/details.aspx?id=30653">official Microsoft website</a>);</li>
                    <li>Internet Information Services: version 7 or later;</li>
                    <li>Microsoft Visual Studio (download the latest version from the <a target="_blank" href="https://www.visualstudio.com/downloads/download-visual-studio-vs">official Visual Studio website</a>).</li>
                </ul>
            </div>
            <h2 id="CSharp3"><span class="style_step">Step 3. </span>Download the .Net (C#) example code and build your application</h2>
            <p><a href="<%= Url.Action("integratingdocumentbuilder") %>">Download</a> the .Net (C#) or .Net (C# MVC) example from our site and unpack it somewhere to your computer.</p>
            <p>Open the <b>DocumentBuilder.sln</b> solution file from the unpacked project folder using the <b>Visual Studio</b> application. Wait while the project loads.</p>
            <p>Once the project is completely loaded, go to the <b>Visual Studio</b> top menu and choose <b>Project</b> -&gt; <b>Rebuild Solution</b>. The project will be rebuilt, after that you can run it in your browser using the green triangle button with the browser name at the top panel.</p>
            <h2 id="CSharp4"><span class="style_step">Step 4. </span>Running your website with the ONLYOFFICE Document Builder</h2>
            <p>If you want to run the example application using the Microsoft <b>IIS</b> service, you will need to follow the additional steps below.</p>
            <ol>
                <li>
                    <h4>Enable ASP.NET 4.6 IIS features</h4>
                    <p>Go to <b>Start</b> -&gt; <b>Control Panel</b> -&gt; <b>Programs and Features</b> and click the <b>Turn Windows features on or off</b> left menu option.</p>
                    <p>There select <b>Internet Information Services</b> -&gt; <b>World Wide Web Services</b> -&gt; <b>Application Development Features</b> and enable all the options for <b>.NET 4.6</b> (these include <b>.NET Extensibility 4.6</b> and <b>ASP.NET 4.6</b> options):</p>
                    <img class="screenshot-width-550" alt="How to integrate ONLYOFFICE Document Builder into your application on .Net (C#)" src="<%= Url.Content("~/content/img/docbuilder/csharp/net46.png") %>">
                    <p>Please make sure that the <b>.NET Framework 4.6 Advanced Services</b> -&gt; <b>ASP.NET 4.6</b> is also enabled.</p>
                </li>
                <li>
                    <h4>Run the Internet Information Service (IIS) manager</h4>
                    <p>To do that go to <b>Start</b> -&gt; <b>Control Panel</b> -&gt; <b>Administrative Tools</b> and run the <b>Internet Information Services (IIS) Manager</b>.</p>
                </li>
                <li>
                    <h4>Add your website in the IIS Manager</h4>
                    <p>On the <b>Connections</b> panel right-click the <b>Sites</b> node in the tree, then click <b>Add Website...</b>:</p>
                    <img class="screenshot-width-300" alt="How to integrate ONLYOFFICE Document Builder into your application on .Net (C#)" src="<%= Url.Content("~/content/img/docbuilder/csharp/add.png") %>">
                </li>
                <li>
                    <h4>Configure your website</h4>
                    <p>In the <b>Add Website</b> dialog box specify the name of the folder with the .Net (C#) project in the <b>Site name</b> box.</p>
                    <p>Specify the path to the folder with your project in the <b>Physical path</b> box.</p>
                    <p>Specify the unique value used only for this website in the <b>Port</b> box:</p>
                    <img class="screenshot-width-550" alt="How to integrate ONLYOFFICE Document Builder into your application on .Net (C#)" src="<%= Url.Content("~/content/img/docbuilder/csharp/sitename.png") %>">
                </li>
                <li>
                    <h4>Check for the .NET platform version specified in IIS manager for you website</h4>
                    <p>Choose the <b>v4.0.</b> version for <b>.NET CLR Version</b> clicking the <b>Application Pool</b> then right-clicking the platform name select the <b>Set application pool defaults</b> and finally set the necessary <b>.NET CLR version</b>:</p>
                    <img class="screenshot-width-550" alt="How to integrate ONLYOFFICE Document Builder into your application on .Net (C#)" src="<%= Url.Content("~/content/img/docbuilder/csharp/platform.png") %>">
                </li>
                <li>
                    <h4>Browse your website with the IIS manager</h4>
                    <p>Right-click the site, select the <b>Manage Website</b> contextual menu option, then use <b>Browse</b>:</p>
                    <img class="screenshot-width-832" alt="How to integrate ONLYOFFICE Document Builder into your application on .Net (C#)" src="<%= Url.Content("~/content/img/docbuilder/csharp/browse.png") %>">
                </li>
            </ol>
            <p>If you want to experiment with the code changes, you can find the main application code in the <em>\DocumentBuilder\Controllers\</em> control. The path to the <b>ONLYOFFICE Document Builder</b> executable can be changed in the <b>web.config</b> file in the following line:</p>
<pre>&lt;configuration>
&lt;appSettings>
&lt;add key="builder-path" value="C:\ONLYOFFICE\DocumentBuilder\docbuilder.exe" />
&lt;/appSettings>
&lt;/configuration>
</pre>
            <p>Set it to the actual path of the <b>ONLYOFFICE Document Builder</b> on your computer.</p>
</asp:Content>
