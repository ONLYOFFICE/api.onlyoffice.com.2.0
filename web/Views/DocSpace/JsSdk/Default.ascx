<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Basic concepts</span>
</h1>

<p class="dscr">
    The ONLYOFFICE DocSpace SDK based on JavaScript allows developers to use all the DocSpace possibilities with <em>api.js</em>.
    You can integrate ONLYOFFICE DocSpace into your own web application, allowing users to create and submit documents directly from your website.
</p>
<p>You don't need to be an experienced JavaScript developer to use the DocSpace JavaScript SDK because we provide you with all the basics.
You only need a few lines of JavaScript to set up a fully functional integration.</p>
<p>Follow the steps below to connect DocSpace as a frame to your website.</p>

<h2>Step 1. Creating the HTML file</h2>
<p>Create the target HTML file which must include a placeholder <em>div</em> tag, where all the information about DocSpace parameters will be passed:</p>
<pre>
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
    &lt;head&gt;
        &lt;meta charset="UTF-8"&gt;
        &lt;title&gt;DocSpace JavaScript SDK&lt;/title&gt;
        &lt;script src="{PORTAL_SRC}/static/scripts/api.js"&gt;&lt;/script&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;div id="ds-frame"&gt;&lt;/div&gt;
    &lt;/body&gt;
&lt;/html&gt;
</pre>
        <p>The API JavaScript file can normally be found in the following DocSpace folder:</p>
        <p><b>{PORTAL_SRC}/static/scripts/api.js</b></p>
        <p>where <b>{PORTAL_SRC}</b> is the name of the server with the ONLYOFFICE DocSpace installed.</p>

<h2>Step 2. Getting the base class</h2>
<p>When the API JavaScript is connected to the page, get the base class that provides all the basic functionality of <em>api.js</em>:</p>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Class</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td class="copy-link">DocSpace.SDK</td>
            <td>Defines the DocSpace document manager and allows you to perform operations with rooms, folders, and documents within the DocSpace portal.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Step 3. Authorizing</h2>
<p><em>api.js</em> uses the active DocSpace application sessions to authenticate users.
If the user is logged in to the DocSpace portal that the SDK will connect to, then <em>api.js</em> recognizes and uses that active session.</p>
<p>If the users are not authenticated, they will see a page asking them to sign in to DocSpace the first time they use it.
Authentication is also possible through the SDK <a href="<%= Url.Action("jssdk/methods") %>#login">methods</a>.</p>

<h2>Step 4. Initializing</h2>
<note>Please note that when working via HTTPS, it is necessary to set the <b>"SameSite": "none"</b> parameter in <em>appsettings.json</em> to avoid blocking the work with cookies during cross-domain requests.</note>
<p>Initialize DocSpace frame using the <a href="<%= Url.Action("jssdk/methods") %>#initFrame">initFrame</a> method with the SDK config passed to it:</p>
<pre>
var docSpace = DocSpace.SDK.initFrame({
    frameId: "frameId",
    showMenu: true
});
</pre>
<p>You can use other available <a href="<%= Url.Action("jssdk/methods") %>">methods</a> to initialize DocSpace.</p>
<p>The full list of <a href="<%= Url.Action("jssdk/config") %>">config parameters</a> can be found here.</p>

<h2>Step 5. Using</h2>
<p>After initialization, the current SDK instance can be accessed by using its <a href="<%= Url.Action("jssdk/config") %>#frameId">frameId</a>.
The list of current SDK instances is available in the <em>DocSpace.SDK.frames</em> array. To get the specific SDK instance, use the following string:</p>
<pre>
DocSpace.SDK.frames[frameId]
</pre>
