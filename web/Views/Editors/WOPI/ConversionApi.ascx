<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <span class="hdr">Conversion API</span>
    </h1>

    <p class="dscr">In order to convert different file formats in the online office, the POST request should be used.
    These requests are sent to the <em>/cool/convert-to/&lt;format&gt;&&lt;lang=xx-XX&gt;</em> or <em>/lool/convert-to/&lt;format&gt;&&lt;lang=xx-XX&gt;</em> endpoints.</p>

    <h2 id="request" class="copy-link">Request parameters and their description</h2>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Parameter</td>
                <td>Description</td>
                <td>Type</td>
                <td>Presence</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td id="format" class="copy-link">format</td>
                <td>The output file format.</td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td id="PDFVer" class="copy-link">PDFVer</td>
                <td>The pdf version for the respective type of PDF to be used for the output file (PDF/A-1b, PDF/A-2b, etc.).</td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="FullSheetPreview" class="copy-link">FullSheetPreview</td>
                <td>Specifies if the full sheet previews will be available or not.</td>
                <td>bollean</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="file" class="copy-link">file</td>
                <td>A file to convert in the payload.</td>
                <td>object</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td id="lang" class="copy-link">lang</td>
                <td>The default format language. It is used for the date type cells. If the language is specified, it determines the display/output format.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div id="sample-curl" class="copy-link header-gray">Sample of conversion request</div>
    <pre>
curl -F "data=sample.txt" https://documentserver/cool/convert-to/docx > result.docx
</pre>
    <p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Docs installed.</p>

    <div id="sample-html" class="copy-link header-gray">Sample of conversion request in the HTML format</div>
    <pre>
&lt;form action="https://documentserver/cool/convert-to/docx" enctype="multipart/form-data" method="post"&gt;
    File: &lt;input type="file" name="data"&gt;&lt;br/&gt;
    &lt;input type="submit" value="Convert to DOCX"&gt;
&lt;/form&gt;
</pre>
    <p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Docs installed.</p>

    <div id="sample-curl-format" class="copy-link header-gray">Sample of conversion request with the <em>format</em> parameter</div>
    <pre>
curl -F "data=sample.odt" -F "format=pdf" "PDFVer=PDF/A-2b" https://documentserver/cool/convert-to > result.pdf
</pre>
    <p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Docs installed.</p>

    <div id="sample-html-format" class="copy-link header-gray">Sample of conversion request with the <em>format</em> parameter in the HTML format</div>
    <pre>
&lt;form action="https://documentserver/cool/convert-to" enctype="multipart/form-data" method="post"&gt;
    File: &lt;input type="file" name="data"&gt;&lt;br/&gt;
    Format: &lt;input type="text" name="format"&gt;&lt;br/&gt;
    &lt;input type="submit" value="Convert"&gt;
&lt;/form&gt;
</pre>
    <p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Docs installed.</p>
