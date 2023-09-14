<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("installation/") %>"></a>
    <span class="hdr">Adding plugins to ONLYOFFICE Cloud</span>
</h1>
<p>You can add a plugin to the <b>Cloud service</b> as an <b>extension</b>. It can be done for Google Chrome, Opera, or Microsoft Edge browsers.</p>

<h2 id="create-extensions" class="copy-link">Step 1. Creating extensions</h2>

<ol>
    <li>To create an extension, you need an account on <a href="https://github.com/" target="_blank">GitHub</a>.
        Sing in to an existing account or create a new one.</li>
    <li>
        <p>Fork the plugin marketplace repository: <a href="https://github.com/ONLYOFFICE/onlyoffice.github.io" target="_blank">https://github.com/ONLYOFFICE/onlyoffice.github.io</a>.</p>
        <p>You get a repository with the following address - <em>https://github.com/YOUR-USERNAME/ONLYOFFICE/onlyoffice.github.io</em>.</p>
    </li>
    <li>Build your own GitHub Pages site from this repository. Explore the official <a href="https://docs.github.com/en/pages/quickstart" target="_blank">GitHub documentation</a> to learn how to do it.</li>
    <li>Clone the fork to your local computer.</li>
    <li>
        <p>Add the plugin folder to <em>onlyoffice.github.io/sdkjs-plugins/content/</em> and push it to the remote repository.</p>
        <img class="screenshot max-width-832" alt="New folder" src="<%= Url.Content("~/content/img/plugins/new-folder.png") %>" />
    </li>
    <li>
        <p>Open the <em>onlyoffice.github.io/store/plugin-dev/extension/inject.js</em> file and assign the path to your plugin on GitHub Pages site to the <b>URL_TO_PLUGIN</b> variable:</p>
        <pre>
var URL_TO_PLUGIN = "https://YOUR-USERNAME.github.io/onlyoffice.github.io/sdkjs-plugins/content/helloworld/"
</pre>
    </li>
</ol>
<p>The <em>onlyoffice.github.io/store/plugin-dev/extension</em> folder is a new extension.</p>
<note>Please note that when adding an extension to <a href="https://www.onlyoffice.com/en/app-directory" target="_blank">ONLYOFFICE App Directory</a>,
the <b>Title</b> and <b>Summary</b> are filled in automatically with the <b>name</b> and <b>description</b> parameters from the <em>manifest.json</em> file.
    You cannot change them later in the store.</note>


<h2 id="upload-extensions" class="copy-link">Step 2. Uploading extensions to the browser</h2>

<p>After your extension is ready, upload it to the browser. Follow the instructions below for the browser you use.</p>
<div class="container">
    <ul class="browser">
        <li class="browser tab active">Google Chrome</li>
        <li class="browser tab">Opera</li>
        <li class="browser tab">Microsoft Edge</li>
    </ul>
    <div class="content active">
        <p><b>Installing extensions to Google Chrome</b></p>
        <ol>
            <li>Launch your Chrome browser and go to <em>chrome://extensions/</em>.</li>
            <li>
                <p>Turn on the <b>Developer mode</b> and click the <b>Load unpacked</b> button:</p>
                <img class="screenshot max-width-832" alt="Chrome developer mode" src="<%= Url.Content("~/content/img/plugins/chrome-developer-mode.png") %>" />
            </li>
            <li>
                <p>Select the created main extension folder:</p>
                <img class="screenshot max-width-832" alt="Chrome extension folder" src="<%= Url.Content("~/content/img/plugins/chrome-extension-folder.png") %>" />
            </li>
            <li>
                <p>The new extension is now available in your browser:</p>
                <img class="screenshot max-width-832" alt="Chrome extension" src="<%= Url.Content("~/content/img/plugins/chrome-extension.png") %>" />
            </li>
            <li>
                <p>Launch ONLYOFFICE Cloud and open any document to check if the new plugin is available in the editors:</p>
                <img class="screenshot max-width-832" alt="Hello world icon" src="<%= Url.Content("~/content/img/plugins/helloworld_icon.png") %>" />
            </li>
        </ol>
        <br />
        <p><b>Removing extensions from Google Chrome</b></p>
        <p>Click the <b>Remove</b> button on the extension tab and, in the opened window, confirm your action:</p>
        <img class="screenshot max-width-832" alt="Chrome removing extension" src="<%= Url.Content("~/content/img/plugins/chrome-removing-extension.png") %>" />
        <p>The plugin will be removed from ONLYOFFICE Cloud after page reload.</p>
    </div>
    <div class="content">
        <p><b>Installing extensions to Opera</b></p>
        <ol>
            <li>Launch your Opera browser.</li>
            <li>
                <p>Click the extensions icon in the top right corner of the browser window and, in the opened <b>Extensions</b> window, click <b>Manage extensions</b>:</p>
                <img class="screenshot max-width-832" alt="Opera extensions" src="<%= Url.Content("~/content/img/plugins/opera-extensions.png") %>" />
            </li>
            <li>
                <p>Turn on the <b>Developer mode</b> and click the <b>Load unpacked</b> button:</p>
                <img class="screenshot max-width-832" alt="Opera develoer mode" src="<%= Url.Content("~/content/img/plugins/opera-developer-mode.png") %>" />
            </li>
            <li>
                <p>Select the created main extension folder:</p>
                <img class="screenshot max-width-832" alt="Opera extension folder" src="<%= Url.Content("~/content/img/plugins/opera-extension-folder.png") %>" />
            </li>
            <li>
                <p>The new extension is now available in your browser:</p>
                <img class="screenshot max-width-832" alt="Opera extension" src="<%= Url.Content("~/content/img/plugins/opera-extension.png") %>" />
            </li>
            <li>
                <p>Launch ONLYOFFICE Cloud and open any document to check if the new plugin is available in the editors:</p>
                <img class="screenshot max-width-832" alt="Hello world icon" src="<%= Url.Content("~/content/img/plugins/helloworld_icon.png") %>" />
            </li>
        </ol>
        <br />
        <p><b>Removing plugins from Opera</b></p>
        <p>To remove the plugin from the <b>Plugins</b> tab in ONLYOFFICE editors, click the <b>Disable</b> button on the extension tab or turn off the switcher.
        You can enable the extension again at any time.</p>
        <img class="screenshot max-width-832" alt="Opera disabling extension" src="<%= Url.Content("~/content/img/plugins/opera-disabling-extension.png") %>" />
        <p>To remove the extension completely from the Opera browser:</p>
        <ol>
            <li>Click the <b>Remove</b> button on the extension tab.</li>
            <li>
                <p>In the opened window confirm your action:</p>
                <img class="screenshot max-width-832" alt="Opera removing extension" src="<%= Url.Content("~/content/img/plugins/opera-removing-extension.png") %>" />
            </li>
        </ol>
        <p>The plugin will be removed from ONLYOFFICE Cloud after page reload.</p>
    </div>
    <div class="content">
        <p><b>Installing extensions to Microsoft Edge</b></p>
        <ol>
            <li>Launch your Microsoft Edge browser and go to <em>edge://extensions/</em>.</li>
            <li>
                <p>Go to the <b>Extensions</b> tab, turn on the <b>Developer mode</b> and click the <b>Load unpacked</b> button:</p>
                <img class="screenshot max-width-832" alt="Edge developer mode" src="<%= Url.Content("~/content/img/plugins/edge-developer-mode.png") %>" />
            </li>
            <li>
                <p>Select the created main extension folder:</p>
                <img class="screenshot max-width-832" alt="Edge extension folder" src="<%= Url.Content("~/content/img/plugins/edge-extension-folder.png") %>" />
            </li>
            <li>
                <p>The new extension is now available in your browser:</p>
                <img class="screenshot max-width-832" alt="Edge extension" src="<%= Url.Content("~/content/img/plugins/edge-extension.png") %>" />
            </li>
            <li>
                <p>Launch ONLYOFFICE Cloud and open any document to check if the new plugin is available in the editors:</p>
                <img class="screenshot max-width-832" lt="Hello world icon" src="<%= Url.Content("~/content/img/plugins/helloworld_icon.png") %>" />
            </li>
        </ol>
        <br />
        <p><b>Removing plugins from Microsoft Edge</b></p>
        <p>To remove the plugin from the <b>Plugins</b> tab in ONLYOFFICE editors, disable it by turning off the switcher. You can enable the extension again at any time.</p>
        <p>To remove the extension completely from the Microsoft Edge browser, click the <b>Remove</b> button on the extension tab and, in the opened window, confirm your action:</p>
        <img class="screenshot max-width-832" alt="Edge removing extension" src="<%= Url.Content("~/content/img/plugins/edge-removing-extension.png") %>" />
        <p>The plugin will be removed from ONLYOFFICE Cloud after page reload.</p>
    </div>
</div>

<script type="text/javascript">
    $('ul.browser').on('click', 'li:not(.browser tab active)', function() {
        $(this)
          .addClass('active').siblings().removeClass('active')
          .closest('div.container').find('div.content').removeClass('active').eq($(this).index()).addClass('active');
    });
</script>
