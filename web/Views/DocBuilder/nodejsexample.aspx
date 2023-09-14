<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    How to integrate ONLYOFFICE Document Builder into your application on Node.js
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">How to integrate ONLYOFFICE Document Builder into your application on Node.js</span>
    </h1>

    <h2 id="introduction">Introduction</h2>
    <p class="dscr">To integrate <b>ONLYOFFICE Document Builder</b> into your own application on <b>Node.js</b> you need to download and install <b>ONLYOFFICE Document Builder</b> to your computer and use the <a href="<%= Url.Action("integratingdocumentbuilder") %>">Node.js example</a> for the integration. We will show how to run the Node.js example on <a href="#Windows">Window OS</a> and on <a href="#Linux">Linux OS</a>.</p>

    <h2 id="Windows">Running the example on Windows OS</h2>

    <h2 id="win-1"><span class="style_step">Step 1. </span>Download and install ONLYOFFICE Document Builder</h2>
    <p>First, download <a target="_blank" href="https://www.onlyoffice.com/document-builder.aspx"><b>ONLYOFFICE Document Builder</b></a> and install it to your computer.</p>

    <h2 id="win-2"><span class="style_step">Step 2. </span>Download the Node.js code for the editors integration</h2>
    <p>Download the <a href="<%= Url.Action("integratingdocumentbuilder") %>">Node.js Example</a> from our site.</p>
    <p>You need to connnect the ONLYOFFICE Document Builder to your web site. For that specify the path in the <em>config/default.js</em> file:</p>
    <pre class="commandline">
"builderPath": "C:\\ONLYOFFICE\\DocumentBuilder\\docbuilder.exe"
</pre>

    <h2 id="win-3"><span class="style_step">Step 3. </span>System requirements</h2>
    <p>Download and install the <b>node.js</b> enviroment which is going to be used to run the Node.js project. Please follow the link at the oficial website: <a href="https://nodejs.org/en/download/">https://nodejs.org/en/download/</a>, choosing the correct version for your Windows OS (32-bit or 64-bit).</p>

    <h2 id="win-4"><span class="style_step">Step 4. </span>Running the Node.js code</h2>
    <p>We will run the code in Node.js runtime environment and will interact with it using the command line interface (cmd).</p>

    <ol>
        <li>Launch the <b>Command Prompt</b> and switch to the folder with the Node.js project code, for example:
        <div class="commandline">cd  /d C:\nodejs</div>
        </li>
        <li>Node.js comes with a package manager, <b>node package manager (npm)</b>, which is automatically installed along with Node.js. To run the Node.js code install the project modules using the following npm command:
        <div class="commandline">npm install</div>
            <p>A new <em>node_modules</em> folder will be created in the project folder.</p>
        </li>
        <li>Run the project using the <b>Command Prompt</b>:
        <div class="commandline">node bin/www</div>
        </li>
        <li>See the result in your browser using the address:
        <div class="commandline">http://localhost:3000</div>
        </li>
    </ol>



    <h2 id="Linux">Running the example on Linux OS</h2>

    <h2 id="linux-1"><span class="style_step">Step 1. </span>Download and install ONLYOFFICE Document Builder</h2>
    <p>First, download <a target="_blank" href="https://www.onlyoffice.com/document-builder.aspx"><b>ONLYOFFICE Document Builder</b></a> and install it to your computer.</p>

    <h2 id="linux-2"><span class="style_step">Step 2. </span>Install the prerequisites and run the application</h2>
    <ol>
        <li>Install <b>Node.js</b>:
        <div class="commandline">curl -sL https://deb.nodesource.com/setup_4.x | sudo bash -</div>
            <div class="commandline">apt-get install nodejs</div>
        </li>
        <li>Download the archive with the Node.js Example and unpack the archive:
        <div class="commandline">wget https://github.com/ONLYOFFICE/document-builder-integration/releases/latest/download/Node.js.Example.zip</div>
            <div class="commandline">unzip Node.js\ Example.zip</div>
        </li>
        <li>Change the current directory for the project directory:
        <div class="commandline">cd ~/Node.js\ Example/</div>
        </li>
        <li>Install the dependencies:
        <div class="commandline">npm install</div>
        </li>
        <li>Edit the <em>config/default.js</em> configuration file. Specify the path to the ONLYOFFICE Document Builder.
        <div class="commandline">nano config/default.js</div>
            <p>Edit the following lines:</p>

            <pre>
"builderPath": "/usr/bin/docbuilder"
</pre>
        </li>
        <li>Run the project with Node.js:
        <div class="commandline">nodejs bin/www</div>
        </li>
        <li>See the result in your browser using the address:
        <div class="commandline">http://localhost</div>
        </li>
    </ol>

    <p>Now you will be able to see the result in your browser using the <em>http://localhost</em> address or using the computer address in your local network.</p>
</asp:Content>
