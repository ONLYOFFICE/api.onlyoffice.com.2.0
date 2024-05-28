<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl"%>

<h1>
    <span class="hdr">Create file in selected folder</span>
</h1>
<p class="dscr">Create file in selected folder and open it in editors.</p>
<img class="screenshot" alt="OpenEditors" src="<%= Url.Content("~/content/img/docspace/gifs/js-sdk-create-file.gif")%>" />


<h2>Building sample</h2>

<h3>Step 1. Set HTML structure</h3>
<p>Create HTML file. Add Combobox, Text field, and a Button. HTML file should include a <em>div</em> tag where we specify DocSpace connection parameters.</p>

<div style="width: 100%;">
    <div class="jsSdkHeader">
        <div class="preContentType">
            <span style="font-family: monospace">HTML</span>
        </div>
            <div class="tooltip" >
                <div class="copyJsSdk">
                    <img  id="htmlStructure" alt="Copy" src="<%= Url.Content("~/content/img/copy-content.svg")%>" />
                    <span id="htmlStructure-hover" style="display: inline;" class="tooltiptext-hover">When you copy, you get the HTML code for the whole example.</span>
                    <span id="htmlStructure-click" style="display: none;" class="tooltiptext-click">HTML copied.</span>
                </div>
            </div>
    </div>
<pre class="jsSdkPreNoScroll" id="htmlStructurePre">
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
    &lt;style&gt;
        .holder {
            margin: auto;
            width: 800px;
        }
    &lt;/style&gt;
    &lt;head&gt;
        &lt;meta charset="UTF-8"&gt;
        &lt;title&gt;DocSpace JavaScript SDK&lt;/title&gt;
        &lt;script src="{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js"&gt;&lt;/script&gt;
        ...
    &lt;/head&gt;
    &lt;body&gt;
        &lt;div id="holder-buttons" class="holder" style="width: 400px; margin-top: 300px;"&gt;
            &lt;label for="combobox"&gt;&lt;b&gt;Folders&lt;/b&gt;&lt;/label&gt;&lt;br /&gt;
            &lt;select id="combobox" onclick="onComboboxClick()" 
            style="height: 25px; width: 405px;"&gt;&lt;/select&gt;&lt;br /&gt;
            &lt;label for="fileName"&gt;&lt;b&gt;File name&lt;/b&gt;&lt;/label&gt;&lt;br /&gt;
            &lt;input type="text" id="fileName" name="fileName" value="" style="width: 400px;"&gt;&lt;br /&gt;
            &lt;button onclick="onButtonClick()" style="margin-top: 20px;"&gt;Create File&lt;/button&gt;
        &lt;/div&gt;
        &lt;div id="holder-frame" class="holder" style="display: none;"&gt;
            &lt;div id="ds-frame"&gt;&lt;/div&gt;
        &lt;/div&gt;
        ...
    &lt;/body&gt;
&lt;/html&gt;</pre>
</div>

<p>The API JavaScript file can normally be found in the following DocSpace URL:
<b>{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js</b><br />
<b>{PORTAL_SRC}</b> is the name of the server with the ONLYOFFICE DocSpace installed.</p>

<h3>Step 2. Initialize "Manager" mode</h3>

<ol>
    <li>
        <p>Add a script to initialize the <a href="<%= Url.Action("jssdk/initmodes/manager")%>">Manager</a>. First, let's add an event handler for <a href="<%= Url.Action("jssdk/events")%>#onAppReady">onAppReady</a>, which runs when initialization is successful.</p>
            <div style="width: 100%;">
                <div class="jsSdkHeader">
                    <div class="preContentType">
                        <span style="font-family: monospace">JS</span>
                    </div>
                        <div class="tooltip" >
                            <div class="copyJsSdk">
                                <img  id="onApp" alt="Copy" src="<%= Url.Content("~/content/img/copy-content.svg")%>" />
                                <span id="onApp-hover" style="display: inline;" class="tooltiptext-hover">When you copy, you get code for the whole example.</span>
                                <span id="onApp-click" style="display: none;" class="tooltiptext-click">Code copied.</span>
                            </div>
                        </div>
                </div>
<pre class="jsSdkPreNoScroll" id="onAppPre">
var onAppReady = function (e) {
    var frame = DocSpace.SDK.frames["ds-frame"];
}</pre>
</div>
    </li>
        
    <li>
        <p>Create a configuration for the <b>Manager</b>. For this we create a variable as shown below. In the <a href="<%= Url.Action("jssdk/config")%>#rootPath">rootPath</a> section, specify the section whose directories you want to display.</p>
            <div style="width: 100%;">
                <div class="jsSdkHeader">
                    <div class="preContentType">
                        <span style="font-family: monospace">JS</span>
                    </div>
                        <div class="tooltip" >
                            <div class="copyJsSdk">
                                <img  id="jsConfig" alt="Copy" src="<%= Url.Content("~/content/img/copy-content.svg")%>" />
                                <span id="config-hover" style="display: inline;" class="tooltiptext-hover">When you copy, you get code for the whole example.</span>
                                <span id="config-click" style="display: none;" class="tooltiptext-click">Code copied.</span>
                            </div>
                        </div>
                </div>
<pre class="jsSdkPreNoScroll" id="jsConfigPre">
const config = {
    "events": {
        "onAppReady": onAppReady,
    },
    "rootPath": "/rooms/personal/",
    "height": "700px"
};</pre>
</div> 
    </li>
    <li>
        <p>Initialize the <b>Manager</b> as shown below.</p>
            <div style="width: 100%; margin:0;">
                <div class="jsSdkHeader">
                    <div class="preContentType">
                        <span style="font-family: monospace">JS</span>
                    </div>
                        <div class="tooltip" >
                            <div class="copyJsSdk">
                                <img  id="init" alt="Copy" src="<%= Url.Content("~/content/img/copy-content.svg")%>" />
                                <span id="init-hover" style="display: inline;" class="tooltiptext-hover">When you copy, you get code for the whole example.</span>
                                <span id="init-click" style="display: none;" class="tooltiptext-click">Code copied.</span>
                            </div>
                        </div>
                </div>
<pre class="jsSdkPreNoScroll" id="initPre" >
var docSpace = DocSpace.SDK.initManager(config);</pre>
</div> 
    </li>
</ol>

<h3>Step 3. Load folders list to Combobox</h3>
<p>Add an <b>onComboboxClick()</b> event handler for the Combobox. Using the <a href="<%= Url.Action("jssdk/events")%>#getFolders">getFolders()</a> method, we load the list into the Combobox.</p>

<div style="width: 100%;">
    <div class="jsSdkHeader">
        <div class="preContentType">
            <span style="font-family: monospace">JS</span>
        </div>
            <div class="tooltip" >
                <div class="copyJsSdk">
                    <img  id="htmlStructure" alt="Copy" src="<%= Url.Content("~/content/img/copy-content.svg")%>" />
                    <span id="htmlStructure-hover" style="display: inline;" class="tooltiptext-hover">When you copy, you get the HTML code for the whole example.</span>
                    <span id="htmlStructure-click" style="display: none;" class="tooltiptext-click">HTML copied.</span>
                </div>
            </div>
    </div>
<pre class="jsSdkPreNoScroll" id="htmlStructurePre">
const combobox = document.getElementById("combobox");
var onComboboxClick = async function (e) {
    var data = await frame.getFolders();
    data.forEach(item => {
        const option = document.createElement("option");
        option.value = item.id;
        option.textContent = item.title;
        combobox.appendChild(option);
    });
}</pre>
</div>

<h3>Step 4. Add method to create file</h3>
<p>Add an <b>onButtonClick()</b> event handler for the button. Using the <a href="<%= Url.Action("jssdk/events")%>#createFile">createFile()</a> method, create file in selected folder.</p>

<div style="width: 100%;">
    <div class="jsSdkHeader">
        <div class="preContentType">
            <span style="font-family: monospace">JS</span>
        </div>
            <div class="tooltip" >
                <div class="copyJsSdk">
                    <img  id="htmlStructure" alt="Copy" src="<%= Url.Content("~/content/img/copy-content.svg")%>" />
                    <span id="htmlStructure-hover" style="display: inline;" class="tooltiptext-hover">When you copy, you get the HTML code for the whole example.</span>
                    <span id="htmlStructure-click" style="display: none;" class="tooltiptext-click">HTML copied.</span>
                </div>
            </div>
    </div>
<pre class="jsSdkPreNoScroll" id="htmlStructurePre">
var onButtonClick = async function (e) {
    var frame = DocSpace.SDK.frames["ds-frame"];
    var selectedFolder = document.getElementById("combobox").value;
    var fileName = document.getElementById("fileName").value;
    frame.createFile(selectedFolder, fileName).then(
        res => {
            docSpace = DocSpace.SDK.initEditor({
                "id": res.id,
                "height": "700px"
            });
            document.getElementById("holder-buttons").style.display = "none";
            document.getElementById("holder-frame").style.display = "block";
    });
}</pre>
</div>

<h3>Step 5. Run sample</h3>
<p>Run our HTML file and make sure everything works.</p>
<h2>Example</h2>

<div style="width: 100%;">
    <div class="jsSdkHeader">
        <div class="preContentType">
            <span style="font-family: monospace">HTML</span>
        </div>
            <div class="tooltip" >
                <div class="copyJsSdk">
                    <img  id="example" alt="Copy" src="<%= Url.Content("~/content/img/copy-content.svg")%>" />
                    <span id="example-hover" style="display: inline;" class="tooltiptext-hover">When you copy, you get the HTML code for the whole example.</span>
                    <span id="example-click" style="display: none;" class="tooltiptext-click">HTML copied.</span>
                </div>
            </div>
    </div>
<pre class="jsSdkPreNoScroll" id="examplePre">
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
    &lt;style&gt;
        .holder {
            margin: auto;
            width: 800px;
        }
    &lt;/style&gt;
    &lt;head&gt;
        &lt;meta charset="UTF-8"&gt;
        &lt;title&gt;DocSpace JavaScript SDK&lt;/title&gt;
        &lt;script src="https://{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js"&gt;&lt;/script&gt;
        ...
    &lt;/head&gt;
    &lt;body&gt;
        &lt;div id="holder-buttons" class="holder" style="width: 400px; margin-top: 300px;"&gt;
            &lt;label for="combobox"&gt;&lt;b&gt;Folders&lt;/b&gt;&lt;/label&gt;&lt;br /&gt;
            &lt;select id="combobox" onclick="onComboboxClick()" 
            style="height: 25px; width: 405px;"&gt;&lt;/select&gt;&lt;br /&gt;
            &lt;label for="fileName"&gt;&lt;b&gt;File name&lt;/b&gt;&lt;/label&gt;&lt;br /&gt;
            &lt;input type="text" id="fileName" name="fileName" value="" style="width: 400px;"&gt;&lt;br /&gt;
            &lt;button onclick="onButtonClick()" style="margin-top: 20px;"&gt;Create File&lt;/button&gt;
        &lt;/div&gt;
        &lt;div id="holder-frame" class="holder" style="display: none;"&gt;
            &lt;div id="ds-frame"&gt;&lt;/div&gt;
        &lt;/div&gt;
        ...
    &lt;/body&gt;
    &lt;script&gt;
        var onAppReady = async function (e) {
            var frame = DocSpace.SDK.frames["ds-frame"];

        }
        const config = {
            "events": {
                "onAppReady": onAppReady,
            },
            "rootPath": "/rooms/personal/",
            "height": "700px"
        };
        const combobox = document.getElementById("combobox");
        var onComboboxClick = async function (e) {
            var data = await frame.getFolders();
            data.forEach(item => {
                const option = document.createElement("option");
                option.value = item.id;
                option.textContent = item.title;
                combobox.appendChild(option);
            });
        }
        var onButtonClick = async function (e) {
            var frame = DocSpace.SDK.frames["ds-frame"];
            var selectedFolder = document.getElementById("Combobox").value;
            var fileName = document.getElementById("fileName").value;
            frame.createFile(selectedFolder, fileName).then(
                res => {
                    docSpace = DocSpace.SDK.initEditor({
                        "id": res.id,
                        "height": "700px"
                    });
                    document.getElementById("holder-buttons").style.display = "none";
                    document.getElementById("holder-frame").style.display = "block";
            });
        }
        var docSpace = DocSpace.SDK.initManager(config);   
    &lt;/script&gt;
&lt;/html&gt;</pre>
</div>  

<h2>Getting help</h2>
<p>To get help, please create issues on <a href="https://github.com/ONLYOFFICE/DocSpace/issues" target="_blank">GitHub</a>.</p>


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
