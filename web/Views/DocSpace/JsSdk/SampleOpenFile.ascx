<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Open file in ONLYOFFICE editors</span>
</h1>
<p class="dscr">Open a file in <a href="https://api.onlyoffice.com/docspace/jssdk/initmodes/editor" target="_blank">ONLYOFFICE editors</a> 
using <a href="https://api.onlyoffice.com/docspace/jssdk/initmodes/fileselector" target="_blank">FileSelector</a>.</p>
<img class="screenshot" alt="OpenEditors" src="<%= Url.Content("~/content/img/docspace/gifs/open-editors.gif") %>" />
<h2>Before you start</h2>

<ol>
    <li>For the JavaScript SDK to work correctly, it must be launched on the server. Note that running the HTML file directly will not work. 
    Please make sure you are using a server environment.</li>
    <li>You need to add the URL of your server's root directory to the <b>Developer Tools</b> section of DocSpace. For this:</li>
        <ul>
            <li><p>Go to your DocSpace workspace settings.</p></li>
            <li><p>Navigate to the Developer Tools section.</p></li>
            <li><p>In the <b>JavaScript SDK</b> tab, in <b>"Enter the address of DocSpace to embed"</b> add the URL of your server's root directory.</p></li>
        </ul>
</ol>
<img class="screenshot max-width-832" alt="Chart" src="<%= Url.Content("~/content/img/docspace/add-in-js-sdk-root-url.png") %>" />

<h2>Building sample</h2>


<h3>Step 1. Set HTML structure</h3>
<p>Create HTML file. It should include a <em>div</em> tag where we specify DocSpace connection parameters.</p>

<div style="width: 100%;">
    <div id="jsSdkHeader" class="jsSdkHeader">
        <div class="preContentType">
            <span style="font-family: monospace">HTML</span>
        </div>
            <div class="tooltip" >
                <div class="copyJsSdk">
                    <img  id="htmlStructure" alt="Copy" src="<%= Url.Content("~/content/img/copy-content.svg") %>" />
                    <span id="htmlStructure-hover" style="display: inline;" class="tooltiptext-hover">When you copy, you get the HTML code for the whole example.</span>
                    <span id="htmlStructure-click" style="display: none;" class="tooltiptext-click">HTML copied.</span>
                </div>
            </div>
    </div>
<pre class="jsSdkPre" id="htmlStructurePre">
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
    &lt;head&gt;
        &lt;meta charset="UTF-8"&gt;
        &lt;title&gt;DocSpace JavaScript SDK&lt;/title&gt;
        &lt;script src="https://{PORTAL_SRC}/static/scripts/api.js"&gt;&lt;/script&gt;
        ...
    &lt;/head&gt;
    &lt;body&gt;
         &lt;div id="ds-frame"&gt;&lt;/div&gt;
        ...
    &lt;/body&gt;
&lt;/html&gt;</pre>
</div>  

<p>The API JavaScript file can normally be found in the following DocSpace URL:</p>
<p><b>https://{PORTAL_SRC}/static/scripts/api.js</b></p>
<p>where <b>{PORTAL_SRC}</b> is the name of the server with the ONLYOFFICE DocSpace installed.</p>


<h3>Step 2. Add File Selector</h3>
<p>Add a script to initialize the File Selector. First, let's add an event handler for <a href="https://api.onlyoffice.com/docspace/jssdk/events#onAppReady" target="_blank">onAppReady</a>, which runs when initialization is successful.</p>

<div style="width: 100%;">
    <div id="jsSdkHeader" class="jsSdkHeader">
        <div class="preContentType">
            <span style="font-family: monospace">JS</span>
        </div>
            <div class="tooltip" >
                <div class="copyJsSdk">
                    <img  id="onApp" alt="Copy" src="<%= Url.Content("~/content/img/copy-content.svg") %>" />
                    <span id="onApp-hover" style="display: inline;" class="tooltiptext-hover">When you copy, you get code for the whole example.</span>
                    <span id="onApp-click" style="display: none;" class="tooltiptext-click">Code copied.</span>
                </div>
            </div>
    </div>
<pre class="jsSdkPre" id="onAppPre">
var onAppReady = function (e) {
    var frame = DocSpace.SDK.frames["ds-frame"];
}</pre>
</div>  


<h3>Step 3. Add event handler for onSelectCallback</h3>
<p>Add an event handler for <a href="https://api.onlyoffice.com/docspace/jssdk/events#onSelectCallback" target="_blank">onSelectCallback</a>. Here we initialize <b>ONLYOFFICE editors</b> after the user selects a file. 
To do this, we pass the ID of the file selected in the <b>File Selector</b> to the <a href="https://api.onlyoffice.com/docspace/jssdk/methods#initEditor" target="_blank">initEditor</a> method.</p>

<div style="width: 100%;">
    <div id="jsSdkHeader" class="jsSdkHeader">
        <div class="preContentType">
            <span style="font-family: monospace">JS</span>
        </div>
            <div class="tooltip" >
                <div class="copyJsSdk">
                    <img  id="onSelect" alt="Copy" src="<%= Url.Content("~/content/img/copy-content.svg") %>" />
                    <span id="onSelect-hover" style="display: inline;" class="tooltiptext-hover">When you copy, you get code for the whole example.</span>
                    <span id="onSelect-click" style="display: none;" class="tooltiptext-click">Code copied.</span>
                </div>
            </div>
    </div>
<pre class="jsSdkPre" id="onSelectPre">
var onSelectCallback = function (e) {
    docSpace = DocSpace.SDK.initEditor({
        "id": e.id,
        "height": "1000px"
    });
}</pre>
</div>  


<h3>Step 4. Set configuration parameters</h3>
<p>Create a configuration for the <b>File Selector</b>. For this we create a variable as shown below.</p>

<div style="width: 100%;">
    <div id="jsSdkHeader" class="jsSdkHeader">
        <div class="preContentType">
            <span style="font-family: monospace">JS</span>
        </div>
            <div class="tooltip" >
                <div class="copyJsSdk">
                    <img  id="config" alt="Copy" src="<%= Url.Content("~/content/img/copy-content.svg") %>" />
                    <span id="config-hover" style="display: inline;" class="tooltiptext-hover">When you copy, you get code for the whole example.</span>
                    <span id="config-click" style="display: none;" class="tooltiptext-click">Code copied.</span>
                </div>
            </div>
    </div>
<pre class="jsSdkPre" id="configPre">
const config = {
    "events": {
        "onSelectCallback": onSelectCallback,
        "onAppReady": onAppReady
    },
    "height": "700px",
    "width": "100%"
}</pre>
</div> 


<h3>Step 5. Initialize File Selector</h3>
<p>Initialize the <b>File Selector</b> as shown below.</p>

<div style="width: 100%;">
    <div id="jsSdkHeader" class="jsSdkHeader">
        <div class="preContentType">
            <span style="font-family: monospace">JS</span>
        </div>
            <div class="tooltip" >
                <div class="copyJsSdk">
                    <img  id="init" alt="Copy" src="<%= Url.Content("~/content/img/copy-content.svg") %>" />
                    <span id="init-hover" style="display: inline;" class="tooltiptext-hover">When you copy, you get code for the whole example.</span>
                    <span id="init-click" style="display: none;" class="tooltiptext-click">Code copied.</span>
                </div>
            </div>
    </div>
<pre class="jsSdkPre" id="initPre">
var docSpace = DocSpace.SDK.initFileSelector(config);</pre>
</div> 


<h3>Step 6. Initialize File Selector</h3>

<p>Run our HTML file and make sure everything works.</p>

<h2>Example</h2>

<div style="width: 100%;">
    <div id="jsSdkHeader" class="jsSdkHeader">
        <div class="preContentType">
            <span style="font-family: monospace">HTML</span>
        </div>
            <div class="tooltip" >
                <div class="copyJsSdk">
                    <img  id="example" alt="Copy" src="<%= Url.Content("~/content/img/copy-content.svg") %>" />
                    <span id="example-hover" style="display: inline;" class="tooltiptext-hover">When you copy, you get the HTML code for the whole example.</span>
                    <span id="example-click" style="display: none;" class="tooltiptext-click">HTML copied.</span>
                </div>
            </div>
    </div>
<pre class="jsSdkPre" id="examplePre">
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
    &lt;head&gt;
        &lt;meta charset="UTF-8"&gt;
        &lt;title&gt;DocSpace JavaScript SDK&lt;/title&gt;
        &lt;script src="https://{PORTAL_SRC}/static/scripts/api.js"&gt;&lt;/script&gt;
        ...
    &lt;/head&gt;
    &lt;body&gt;
        &lt;div id="ds-frame"&gt;&lt;/div&gt;
        ...
    &lt;/body&gt;
    &lt;script&gt;
        var onSelectCallback = function (e) {
            docSpace = DocSpace.SDK.initEditor({
            "id": e.id,
            "height": "1000px"
        });}
        var onAppReady = function (e) {
            var frame = DocSpace.SDK.frames["ds-frame"];
        }
        const config = {
            "events": {
                "onSelectCallback": onSelectCallback,
                "onAppReady": onAppReady,
            },
            "height": "700px",
            "width": "100%"
        }
        var docSpace = DocSpace.SDK.initFileSelector(config);
    &lt;/script&gt;
&lt;/html&gt;</pre>
</div>  

<h2>Getting help</h2>
<p>To get help, please create issues on <a href="https://github.com/ONLYOFFICE/sdkjs" target="_blank">GitHub</a>.</p>


<script>
    $(".copyJsSdk").click(function (e) {
        var currentId = e.target.id;
        var hoverElementId = $(this).find('.tooltiptext-hover').attr('id');
        var clickElementId = $(this).find('.tooltiptext-click').attr('id');
        var html = createJsSdkHTML(currentId);
        copyJsSdkToClipboard(html,hoverElementId,clickElementId);
    })

    $(".tooltip").mouseleave(function() {
    var hoverElementId = $(this).find('.tooltiptext-hover').attr('id');
    var clickElementId = $(this).find('.tooltiptext-click').attr('id');
    copyJsSdkMouseLeave(hoverElementId, clickElementId);
});
</script>
