<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/editor") %>"></a>
    <span class="hdr">Embedded</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">
    The embedded section is for the <b>embedded</b> document type only (see the <a href="<%= Url.Action("config/") %>#type">config</a> section to find out how to define the <b>embedded</b> document type).
    It allows to change the settings which define the behavior of the buttons in the embedded mode.
</p>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="embedUrl" class="copy-link">embedUrl</td>
            <td>Defines the absolute URL to the document serving as a source file for the document embedded into the web page.</td>
            <td>string</td>
            <td>"https://example.com/embedded?doc=exampledocument1.docx"</td>
        </tr>
        <tr class="tablerow">
            <td id="fullscreenUrl" class="copy-link">fullscreenUrl</td>
            <td>Defines the absolute URL to the document which will open in full screen mode.</td>
            <td>string</td>
            <td>"https://example.com/embedded?doc=exampledocument1.docx#fullscreen"</td>
        </tr>
        <tr class="tablerow">
            <td id="saveUrl" class="copy-link">saveUrl</td>
            <td>Defines the absolute URL that will allow the document to be saved onto the user personal computer.</td>
            <td>string</td>
            <td>"https://example.com/download?doc=exampledocument1.docx"</td>
        </tr>
        <tr class="tablerow">
            <td id="shareUrl" class="copy-link">shareUrl</td>
            <td>Defines the absolute URL that will allow other users to share this document.</td>
            <td>string</td>
            <td>"https://example.com/view?doc=exampledocument1.docx"</td>
        </tr>
        <tr class="tablerow">
            <td id="toolbarDocked" class="copy-link">toolbarDocked</td>
            <td>Defines the place for the embedded viewer toolbar, can be either <b>top</b> or <b>bottom</b>.</td>
            <td>string</td>
            <td>"top"</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/embedded.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "embedded": {
            "embedUrl": "https://example.com/embedded?doc=exampledocument1.docx",
            "fullscreenUrl": "https://example.com/embedded?doc=exampledocument1.docx#fullscreen",
            "saveUrl": "https://example.com/download?doc=exampledocument1.docx",
            "shareUrl": "https://example.com/view?doc=exampledocument1.docx",
            "toolbarDocked": "top"
        },
        ...
    },
    ...
});
</pre>
<p>
    Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
    See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
</p>
