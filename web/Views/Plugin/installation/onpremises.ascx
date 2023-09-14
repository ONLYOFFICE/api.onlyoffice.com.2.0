<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("installation/") %>"></a>
    <span class="hdr">Adding plugins to ONLYOFFICE Docs on-premises</span>
</h1>

<div class="video-link" title="Show video">
    <img src="<%= Url.Content("~/content/img/video/install-plugins.png") %>" alt="Show video" />

    <div class="popap-dialog">
        <div class="popap-container">
            <div class="popap-header">Install plugins in self-hosted ONLYOFFICE Docs</div>
            <iframe src="https://www.youtube.com/embed/R7gvhLvGL44?wmode=transparent" class="video-frame" frameborder="0" allowfullscreen></iframe>
            <a class="button-close button">Close</a>
        </div>
        <div class="button-close popap-close" title="Close">&times;</div>
    </div>
</div>

<p>There are three ways to add plugins: through the <em>sdkjs-plugins</em> folder, through the <em>config.json</em> file or through the plugin manager.</p>

<h2 id="plugin-folder" class="copy-link">Adding plugins through the sdkjs-plugins folder</h2>

<p>Put the folder with the plugin code to the <b>ONLYOFFICE Docs</b> folder. The path to the folder depends on the operating system you use:</p>
<ul style="list-style: none;">
    <li>For Linux - <em>/var/www/onlyoffice/documentserver/sdkjs-plugins/</em></li>
    <li>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\sdkjs-plugins\</em></li>
</ul>
<p>The plugins will be available to all the users of <b>ONLYOFFICE Docs on-premises</b>. 
<a href="https://nodejs.org/docs/latest/api/fs.html#fs_availability" target="_blank">In some cases</a>, service restart is required.</p>
<p>For debugging, start ONLYOFFICE Docs together with the shared <em>sdkjs-plugins</em> folder:</p>
<pre>
docker run -itd -p 80:80 -v /absolutly_path_to_work_dir:/var/www/onlyoffice/documentserver/sdkjs-plugins/plugin onlyoffice/documentserver-ee:latest
</pre>

<h2 id="config" class="copy-link">Adding plugins through the config.json file</h2>

<p>In <a href="<%= Url.Action("config/editor/plugins", "editors") %>">ONLYOFFICE Docs config</a>, add the relative path 
to the <em>config.json</em> file of the created plugin to the <em>plugins.pluginsData</em> parameter:</p>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "plugins": {
            "autostart": [
                "asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}",
                "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
                ...
            ],
            "pluginsData": [
                "https://example.com/plugin1/config.json",
                "https://example.com/plugin2/config.json",
                ...
            ]
        },
        ...
    },
    ...
});
</pre>
<p>Where</p>
<p><b>example.com</b> is the name of the server where document manager and document storage service are installed and the plugins are placed. 
    See the <a href="<%= Url.Action("howitworks", "editors") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.</p>
<p><em>https://example.com/plugin1/config.json</em> is the path to the plugin.</p>
<p>If there is already a test example in the config, replace the following line <em>/etc/onlyoffice/documentserver-example/local.json</em> 
    with the path to the necessary plugin config.</p>
<p>See the <a href="<%= Url.Action("config/editor/plugins", "editors") %>">ONLYOFFICE Docs API</a> documentation for more information on where to find the config 
    and what and how can be changed there.</p>

<note>
    <ul>
        <li><p>In the <em>index.html</em> file there is always a default link to 
        the <a href="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.js" target="_blank">plugins.js</a> file. 
        Don&#8217;t forget to add it to the plugin folder.</p></li>
        <li><p>If the plugins placed into the folder and the plugins specified in the config coincide, the latter will be used.</p></li>
        <li>
            <p>If you want to upload the plugin to the S3 or Nginx servers, you need to allow cross-domain requests from the address of your document server. 
            Or you can just let everyone use your plugin:</p>
            <pre>
add_header 'Access-Control-Allow-Origin' '*';  
add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
</pre>
        </li>
    </ul>
</note>


<h2 id="plugin-manager" class="copy-link">Adding plugins through the plugin manager</h2>

<p>Starting from version 7.2, you can download ready-to-use plugins from <b>ONLYOFFICE Plugin Marketplace</b>.</p>

<p>Follow the steps below to add the plugins to the editor using plugin manager:</p>
<ol>
    <li>Open the <b>Plugins</b> tab.</li>
    <li>Click <b>Plugin Manager</b>.</li>
    <li>Find the plugin you need and click <b>Install</b>.</li>
</ol>
<img class="screenshot max-width-832" alt="Plugins manager" src="<%= Url.Content("~/content/img/plugins/plugin-manager.png") %>" />
<p>The plugin will be added to the opened editors and all the editors you will open afterwords and displayed within the <b>Plugins</b> tab.</p>
<p>Starting from version 7.4, the <b>pluginsmanager</b> utility can be used to manage the plugins in ONLYOFFICE Docs on-premises.
The commands for installing, removing, restoring, updating, etc. are available. For example:</p>
<ul>
    <li>
        <p>For <b>Docker, DEB, and RPM</b>, the commands are as follows:</p>
        <pre>
cd /var/www/onlyoffice/documentserver/server/tools/
./pluginsmanager --directory="/var/www/onlyoffice/documentserver/sdkjs-plugins" --install="zotero"
</pre>
    </li>
    <li>
        <p>For <b>Windows</b>, the commands are as follows:</p>
        <pre>
cd C:\Program Files\ONLYOFFICE\DocumentServer\bin
documentserver-pluginsmanager.bat --install="zotero"
</pre>
    </li>
</ul>
<p>The paths in the examples are default ones, please change them if necessary.</p>
<p>A full list of server commands can be found <a href="https://helpcenter.onlyoffice.com/ONLYOFFICE-Editors/Editors-User-Guides/AllEditors/Plugin-manager.aspx#servercommands" target="_blank">here</a>.</p>


<h2 id="remove" class="copy-link">Removing plugins from ONLYOFFICE Docs on-premises</h2>

<p>You can uninstall plugins in four ways:</p>
<p><b>Option 1.</b> Starting from version 7.4, you can use the <b>pluginsmanager</b> utility:</p>
<ul>
    <li>
        <p>For <b>Docker, DEB, and RPM</b>, the commands are as follows:</p>
        <pre>
cd /var/www/onlyoffice/documentserver/server/tools/
./pluginsmanager --directory="/var/www/onlyoffice/documentserver/sdkjs-plugins" --remove="zotero"
</pre>
    </li>
    <li>
        <p>For <b>Windows</b>, the commands are as follows:</p>
        <pre>
cd C:\Program Files\ONLYOFFICE\DocumentServer\bin
documentserver-pluginsmanager.bat --remove="zotero"
</pre>
    </li>
</ul>
<p>The paths in the examples are default ones, please change them if necessary.</p>
<p><b>Option 2.</b> Go to the <em>sdkjs-plugins</em> folder and remove the corresponding plugin folder from this directory.</p>
<p>The path to the folder depends on the operating system you use:</p>
<ul style="list-style: none;">
    <li>For Linux - <em>/var/www/onlyoffice/documentserver/sdkjs-plugins/</em></li>
    <li>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\sdkjs-plugins\</em></li>
</ul>
<p><b>Option 3.</b> Edit the <a href="<%= Url.Action("config/editor/plugins", "editors") %>">ONLYOFFICE Docs config</a> by removing the corresponding plugin. 
The plugin will become unavailable for all portal users upon the editor next start:</p>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "plugins": {
            "autostart": [
                <strike>"asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}"</strike>,
                "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
                ...
            ],
            "pluginsData": [
                <strike>"https://example.com/plugin1/config.json"</strike>,
                "https://example.com/plugin2/config.json",
                ...
            ]
        },
        ...
    },
    ...
});                
</pre>
<p>The plugins will be removed for all the users. 
<a href="https://nodejs.org/docs/latest/api/fs.html#fs_availability" target="_blank">In some cases</a>, service restart is required.</p>

<p>The table below contains default plugins guids to make it easier for you to find them:</p>
 
<h2>Default plugins guid&#8217;s</h2>
<table class="try-now-table">
    <tbody>
        <tr>
            <td>Highlight code</td>
            <td>{BE5CBF95-C0AD-4842-B157-AC40FEDD9841}</td>
        </tr>
        <tr>
            <td>Mendeley</td>
            <td>{BE5CBF95-C0AD-4842-B157-AC40FEDD9441}</td>
        </tr>
        <tr>
            <td>OCR</td>
            <td>{440EBF13-9B19-4BD8-8621-05200E58140B}</td>
        </tr>
        <tr>
            <td>Photo editor</td>
            <td>{07FD8DFA-DFE0-4089-AL24-0730933CC80A}</td>
        </tr>
        <tr>
            <td>Speech</td>
            <td>{D71C2EF0-F15B-47C7-80E9-86D671F9C595}</td>
        </tr>
        <tr>
            <td>Thesaurus</td>
            <td>{BE5CBF95-C0AD-4842-B157-AC40FEDD9840}</td>
        </tr>
        <tr>
            <td>Translator</td>
            <td>{7327FC95-16DA-41D9-9AF2-0E7F449F6800}</td>
        </tr>
        <tr>
            <td>YouTube</td>
            <td>{38E022EA-AD92-45FC-B22B-49DF39746DB4}</td>
        </tr>
        <tr>
            <td>Zotero</td>
            <td>{BFC5D5C6-89DE-4168-9565-ABD8D1E48711}</td>
        </tr>
    </tbody>
</table>
<note>Please note that after app updating the default plugins will appear again and you will need to uninstall them.</note>

<p><b>Option 4.</b> To uninstall the newly added plugin, proceed in the following way:</p>
<ol>
    <li>Open the <b>Plugins</b> tab.</li>
    <li>Go to the <b>Plugin Manager</b>.</li>
    <li>Click the <b>Remove</b> button under the corresponding plugin.</li>
</ol>
