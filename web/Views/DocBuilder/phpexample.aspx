<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    How to integrate ONLYOFFICE Document Builder into your application on PHP
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">How to integrate ONLYOFFICE Document Builder into your own web site on PHP</span>
    </h1>

    <h2>Introduction</h2>
    <p class="dscr">
        To integrate <b>ONLYOFFICE Document Builder</b> into your own website on <b>PHP</b> you need to download and install <b>ONLYOFFICE Document Builder</b> on your local server and use the <a href="<%= Url.Action("demopreview") %>">PHP Example</a> for their integration.
        We guide will show you how to run the PHP example on <a href="#Windows">Windows OS</a>.
    </p>

    <h2 id="Windows" class="copy-link">Running the example on Windows OS</h2>
    <h2 id="win-1" class="copy-link"><span class="style_step">Step 1. </span>Download and install ONLYOFFICE Document Builder</h2>
    <p>First, download <a target="_blank" href="https://www.onlyoffice.com/document-builder.aspx"><b>ONLYOFFICE Document Builder</b></a> and install it to your computer.</p>

    <h2 id="win-2" class="copy-link"><span class="style_step">Step 2. </span>Download the PHP example code for the builder integration</h2>
    <p>Download the <a href="<%= Url.Action("integratingdocumentbuilder") %>">PHP Example</a> from our site and unpack it somewhere to your computer.</p>
    <p>You need to connnect the builder to your web site. For that specify the path to the builder installation in the <em>config.php</em> file:</p>
    <pre>$GLOBALS['builder_path'] = "C:\\ONLYOFFICE\\DocumentBuilder\\docbuilder.exe";</pre>

    <h2 id="win-3" class="copy-link"><span class="style_step">Step 3. </span>Install the prerequisites</h2>
    <p>
        You can use any web server capable of runnig PHP code to run the sample. We will demonstrate how to run the PHP sample using <b>Internet Information Services (IIS)</b> web server.
        To set up and configure PHP on IIS <b>PHP Manager for IIS</b> will be used.
    </p>

    <ul>
        <li><b>IIS: version 7</b> or later (refer to <a href="https://www.iis.net/learn/application-frameworks/scenario-build-a-php-website-on-iis/configuring-step-1-install-iis-and-php">Microsoft official website</a> to learn how to install <b>IIS</b>);</li>
        <li><b>PHP</b> (download it from the <a href="https://php.net/downloads.php">php.net</a> site);</li>
        <li><b>PHP Manager for IIS</b> (download it from the <a href="https://phpmanager.codeplex.com/releases/view/69115">Microsoft open source site</a>).</li>
    </ul>

    <h2 id="win-4" class="copy-link"><span class="style_step">Step 4. </span>IIS configuration</h2>
    <ol>
        <li>
            <p><b>PHP Manager for IIS</b> configuration:</p>
            <p>After <b>PHP Manager for IIS</b> installation is complete launch the <b>IIS Manager:</b></p>
            <p>Start -> ControlPanel -> System and Security -> Administrative Tools -> Internet Information Services (IIS) Manager </p>
            <p>and find the <b>PHP Manager</b> feature in the <b>Features View</b> in <b>IIS</b>.</p>
            <img class="screenshot" src="<%= Url.Content("~/content/img/php/manager.png") %>" alt="">

            <p>You need to register the installed PHP version in <b>IIS</b> using <b>PHP Manager</b>.</p>

            <p>Double-click <b>PHP Manager</b> to open it, click the <b>Register new PHP version</b> task and specify the full path to the main PHP executable file location. For example: C:\Program Files\PHP\php-cgi.exe.</p>
            <img class="screenshot" src="<%= Url.Content("~/content/img/php/php-version-1.jpg") %>" alt="" />

            <p>After clicking <b>OK</b> the new <b>PHP version</b> will be registered with IIS and will become active.</p>
            <img class="screenshot" src="<%= Url.Content("~/content/img/php/php-version-2.jpg") %>" alt="" />
        </li>
        <li>
            <p>Configure IIS to handle PHP requests:</p>
            <p>For IIS to host PHP applications, you must add handler mapping that tells IIS to pass all PHP-specific requests to the PHP application framework by using the FastCGI protocol.</p>
            <p>Double-click the <b>Handler Mappings</b> feature:</p>
            <img class="screenshot" src="<%= Url.Content("~/content/img/php/handlerclick.png") %>" alt="" />

            <p>In the <b>Action</b> panel, click <b>Add Module Mapping</b>. In the <b>Add Module Mapping</b> dialog box, specify the configuration settings as follows:</p>
            <ul>
                <li>Request path: <b>*.php</b>,</li>
                <li>Module: <b>FastCgiModule</b>,</li>
                <li>Executable: <b>"C:\[Path to your PHP installation]\php-cgi.exe"</b>,</li>
                <li>
                    <p>Name: <b>PHP via FastCGI</b>,</p>
                    <p>click <b>OK</b>.</p>
                </li>
            </ul>
            <img class="screenshot" src="<%= Url.Content("~/content/img/php/handler-add.png") %>" alt="" />
        </li>
    </ol>
    <p>After IIS manager configuration is complete everything is ready for running the <b>PHP</b> example.</p>

    <h2 id="win-5" class="copy-link"><span class="style_step">Step 5. </span>Running your web site with the editors</h2>
    <ol>
        <li>
            <p>Add your web site in the IIS Manager:</p>
            <p>On the <b>Connections</b> panel right-click the <b>Sites</b> node in the tree, then click <b>Add Website</b>.</p>
            <img class="screenshot" alt="" src="<%= Url.Content("~/content/img/csharp/add.png") %>" />
        </li>
        <li>
            <p>In the <b>Add Website</b> dialog box specify the name of the folder with the PHP project in the <b>Site name</b> box.</p>
            <p>Specify the path to the folder with your project in the <b>Physical Path</b> box.</p>
            <p>Specify the unique value used only for this website in the <b>Port</b> box.</p>
            <img class="screenshot" alt="" src="<%= Url.Content("~/content/img/docbuilder/php-add.png") %>" />
        </li>
        <li>
            <p>Browse your web site with the IIS manager:</p>
            <p>Right-click the site -> <b>Manage Website</b> -> <b>Browse</b></p>
            <img class="screenshot" alt="" src="<%= Url.Content("~/content/img/php/browse.png") %>" />
        </li>
    </ol>

</asp:Content>
