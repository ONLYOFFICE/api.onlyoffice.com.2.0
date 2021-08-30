<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">How to integrate online editors into your own website on Python</span>
</h1>

<h2>Overview</h2>
<p class="dscr">
    This example will help you integrate ONLYOFFICE Docs into your web application written in Python.
</p>

<div class="note">
    The integration examples are used to demonstrate document editors functions and the ways to connect <b>Document Server</b> to your own application.
    <b>DO NOT USE</b> these examples on your own server without <b>PROPER CODE MODIFICATIONS</b>!
</div>

<h2 id="linux-1" class="copy-link"><span class="style_step">Step 1. </span>Install ONLYOFFICE Docs</h2>
<p>Download and install <a href="<%= Url.Action("demopreview") %>">ONLYOFFICE Docs</a> (packaged as Document Server).</p>
<p>See the detailed guide to learn how to install Document Server <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api_python_example">for Windows</a>, <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api_python_example">for Linux</a>, or <a href="https://helpcenter.onlyoffice.com/server/developer-edition/docker/docker-installation.aspx?from=api_python_example">for Docker</a>.</p>

<h2 id="linux-2" class="copy-link"><span class="style_step">Step 2. </span>Install the prerequisites and run the website with the editors</h2>
<ol>
    <li>
        <b>Python</b> comes preinstalled on most Linux distributions, and is available as a package on all others.
        Python 3.9 is required. Please proceed to <a href="https://docs.python.org/3/using/unix.html">official documentation</a> if you have any troubles.
    </li>
    <li>Download the archive with the Python example and unpack the archive:
        <div class="commandline">wget "https://api.onlyoffice.com/app_data/editor/Python%20Example.zip"</div>
        <div class="commandline">unzip Python\ Example.zip</div>
    </li>
    <li>Change the current directory for the project directory:
        <div class="commandline">cd Python\ Example</div>
    </li>
    <li>Install the dependencies:
        <div class="commandline">pip install Django==3.1.3
pip install requests==2.25.0
pip install pyjwt==1.7.1
pip install python-magic</div>
    </li>
    <li>Edit the <em>config.py</em> configuration file.
        Specify the name of your local server with the ONLYOFFICE Document Server installed.
        And specify the name of the server on which example is installed.
        <div class="commandline">nano config.py</div>
        <p>Edit the following line:</p>

        <pre>
DOC_SERV_SITE_URL = 'https://documentserver/'
</pre>

        <p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>
    </li>
    <li>Run the <b>Python</b> server:
        <div class="commandline">python manage.py runserver 0.0.0.0:8000</div>
    </li>
    <li>See the result in your browser using the address:
        <div class="commandline">http://localhost</div>
    </li>
</ol>

<h2 id="linux-3" class="copy-link"><span class="style_step">Step 3. </span>Check accessibility</h2>
<p>
    In case the example and Document Server are installed on different computers, make sure that your server with the example installed has access to the Document Server with the address which you specify instead of <b>documentserver</b> in the configuration files.
    Make sure that the Document Server in its turn has access to the server with the example installed with the address which you specify instead of <b>exampleserver</b> in the configuration files.
</p>

<p>If you integrated the editors successfully the result should look like the <a href="<%= Url.Action("demopreview") %>#DemoPreview">demo preview</a> on our site.</p>
