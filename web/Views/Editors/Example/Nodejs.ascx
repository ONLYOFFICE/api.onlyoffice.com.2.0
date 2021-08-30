<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">How to integrate online editors into your own website on Node.js</span>
</h1>

<h2>Overview</h2>
<p class="dscr">
    This example will help you integrate ONLYOFFICE Docs into your web application on Node.js.
</p>

<div class="note">
    The integration examples are used to demonstrate document editors functions and the ways to connect <b>Document Server</b> to your own application.
    <b>DO NOT USE</b> these examples on your own server without <b>PROPER CODE MODIFICATIONS</b>!
</div>

<h2 id="Windows" class="copy-link">For Windows</h2>
<h2 id="win-1" class="copy-link"><span class="style_step">Step 1. </span>Install ONLYOFFICE Docs</h2>
<p>Download and install <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE Docs</a> (packaged as Document Server).</p>
<p>See the detailed guide to learn how to <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api_nodejs_example">install Document Server for Windows</a>.</p>

<h2 id="win-2" class="copy-link"><span class="style_step">Step 2. </span>Download the Node.js code for the editors integration<span class="copy-link" title="Click to get link"></span></h2>
<p>Download the <a href="<%= Url.Action("demopreview") %>">Node.js example</a> from our site.</p>
<p>
    You need to connect the editors to your website.
    Specify the path to the editors installation in the <em>config/default.json</em> file:
</p>
<pre class="commandline">
"siteUrl": "https://documentserver/"
</pre>

<p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>
<p>If you want to experiment with the editor configuration, modify the <a href="<%= Url.Action("advanced") %>">parameters</a> in the <em>\views\editor.ejs</em> file.</p>

<h2 id="win-3" class="copy-link"><span class="style_step">Step 3. </span>Install Node.js environment</h2>
<p>
    Install the <b>node.js</b> environment which is going to be used to run the Node.js project.
    Please follow the link at the <a href="https://nodejs.org/en/download/">official website</a> choosing the correct version for your Windows OS (32-bit or 64-bit).
</p>

<h2 id="win-4" class="copy-link"><span class="style_step">Step 4. </span>Run the Node.js code</h2>
<p>We will run the code in Node.js runtime environment and will interact with it using the <b>command line interface (cmd)</b>.</p>

<ol>
    <li>Launch the <b>Command Prompt</b> and switch to the folder with the Node.js project code, for example:
        <div class="commandline">cd /d "C:\Node.js Example"</div>
    </li>
    <li>Node.js comes with a package manager, <b>node package manager (npm)</b>, which is automatically installed along with Node.js.
        To run the Node.js code, install the project modules using the following <em>npm</em> command:
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

<h2 id="win-5" class="copy-link"><span class="style_step">Step 5. </span>Check accessibility</h2>
<p>
    In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of <b>documentserver</b> in the configuration files.
    Make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of <b>example.com</b> in the configuration files.
</p>

<p>If you integrated the editors successfully the result should look like the <a href="<%= Url.Action("demopreview") %>#DemoPreview">demo preview</a> on our site.</p>

<h2 id="Linux" class="copy-link">For Linux</h2>
<h2 id="linux-1" class="copy-link"><span class="style_step">Step 1. </span>Install ONLYOFFICE Docs</h2>
<p>Download and install <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE Docs</a> (packaged as Document Server).</p>
<p>See the detailed guide to learn how to <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api_nodejs_example">install Document Server for Linux</a>.</p>

<h2 id="linux-2" class="copy-link"><span class="style_step">Step 2. </span>Install the prerequisites and run the website with the editors</h2>
<ol>
    <li>Install <b>Node.js</b>:
        <div class="commandline">curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -</div>
        <div class="commandline">sudo apt-get install -y nodejs</div>
    </li>
    <li>Download the archive with the Node.js example and unpack the archive:
        <div class="commandline">wget https://api.onlyoffice.com/app_data/editor/Node.js%20Example.zip</div>
        <div class="commandline">unzip Node.js\ Example.zip</div>
    </li>
    <li>Change the current directory for the project directory:
        <div class="commandline">cd Node.js\ Example/</div>
    </li>
    <li>Install the dependencies:
        <div class="commandline">npm install</div>
    </li>
    <li>Edit the <em>default.json</em> configuration file.
        Specify the name of your local server with the ONLYOFFICE Document Server installed.
        <div class="commandline">nano config/default.json</div>
        <p>Edit the following line:</p>

        <pre>
"siteUrl": "https://documentserver/"
</pre>

        <p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>
    </li>
    <li>Run the project with Node.js:
        <div class="commandline">node bin/www</div>
    </li>
    <li>See the result in your browser using the address:
        <div class="commandline">http://localhost:3000</div>
    </li>
</ol>

<h2 id="linux-3" class="copy-link"><span class="style_step">Step 3. </span>Check accessibility</h2>
<p>
    In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of <b>documentserver</b> in the configuration files.
    Make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of <b>example.com</b> in the configuration files.
</p>

<p>If you integrated the editors successfully the result should look like the <a href="<%= Url.Action("demopreview") %>#DemoPreview">demo preview</a> on our site.</p>
