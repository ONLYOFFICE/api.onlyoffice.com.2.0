<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Config</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The config base section allows to change the platform type used, document display size (width and height) and type of the document opened.</p>

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
        <tr>
            <td id="documentType" class="copy-link">documentType</td>
            <td>Defines the document type to be opened:
                <ul>
                    <li><b>word</b> - text document (<em>.djvu, .doc, .docm, .docx, .docxf, .dot, .dotm, .dotx, .epub, .fb2, .fodt, .htm, .html, .mht, .mhtml, .odt, .oform, .ott, .oxps, .pdf, .rtf, .stw, .sxw, .txt, .wps, .wpt, .xml, .xps</em>),</li>
                    <li><b>cell</b> - spreadsheet (<em>.csv, .et, .ett, .fods, .ods, .ots, .sxc, .xls, .xlsb, .xlsm, .xlsx, .xlt, .xltm, .xltx, .xml</em>),</li>
                    <li><b>slide</b> - presentation (<em>.dps, .dpt, .fodp, .odp, .otp, .pot, .potm, .potx, .pps, .ppsm, .ppsx, .ppt, .pptm, .pptx, .sxi</em>).</li>
                </ul>
            </td>
            <td>string</td>
            <td>"cell"</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">
                    <b>text</b>, <b>spreadsheet</b> and <b>presentation</b> values are deprecated since version 6.1.
                    Please use new values instead.
                </div>
            </td>
        </tr>
        <tr class="tablerow">
            <td id="height" class="copy-link">height</td>
            <td>Defines the document height (<b>100%</b> by default) in the browser window.</td>
            <td>string</td>
            <td>"100%"</td>
        </tr>
        <tr class="tablerow">
            <td id="token" class="copy-link">token</td>
            <td>Defines the encrypted signature added to the <b>Document Server</b> config in the form of a <a href="<%= Url.Action("signature/browser") %>#config">token</a>.</td>
            <td>string</td>
            <td>"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.LwimMJA3puF3ioGeS-tfczR3370GXBZMIL-bdpu4hOU"</td>
        </tr>
        <tr class="tablerow">
            <td id="type" class="copy-link">type</td>
            <td>
                Defines the platform type used to access the document.
                Can be:
                <em>optimized to access the document from a desktop or laptop computer</em> - <b>desktop</b>,
                <em>optimized to access the document from a tablet or a smartphone</em> - <b>mobile</b>,
                <em>specifically formed to be easily embedded into a web page</em> - <b>embedded</b>.
                The default value is <b>"desktop"</b>.
            </td>
            <td>string</td>
            <td>"desktop"</td>
        </tr>
        <tr class="tablerow">
            <td id="width" class="copy-link">width</td>
            <td>Defines the document width (<b>100%</b> by default) in the browser window.</td>
            <td>string</td>
            <td>"100%"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "documentType": "word",
    "height": "100%",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.LwimMJA3puF3ioGeS-tfczR3370GXBZMIL-bdpu4hOU",
    "type": "desktop",
    "width": "100%",
    ...
});
</pre>
