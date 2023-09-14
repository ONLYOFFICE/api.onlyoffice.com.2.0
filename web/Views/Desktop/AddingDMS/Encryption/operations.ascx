<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <a class="up" href="<%= Url.Action("addingdms/encryption") %>"></a>
   <span class="hdr">Operations with encrypted files</span>
</h1>

<p>
    To perform operations with encrypted files, including file encryption, decryption, creation, editing and sharing, ONLYOFFICE uses the individual credentials of users (RSA key pair) and a document password (document encryption key).
    The processes of uploading and sharing encrypted files are described here.
</p>


<p id="uploading" class="copy-link"><b>Uploading encrypted documents</b></p>
<p>To upload encrypted files in the desktop app, replace the standard <em>input type = file</em> call with the <em>cloudCryptoCommand</em> function with the <em>upload</em> type.
    The <em>params</em> object has the following values:</p>

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
            <td id="cryptoEngineId" class="copy-link">cryptoEngineId</td>
            <td>
                Defines the <b>Encryption</b> plugin ID.
            </td>
            <td>string</td>
            <td>"{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}"</td>
        </tr>
        <tr>
            <td id="filter" class="copy-link">filter</td>
            <td>
                Defines the document types that can be encrypted.
            </td>
            <td>string</td>
            <td>"*.docx *.xlsx *.pptx"</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Currently, it is possible to encrypt only OOXML formats, which are DOCX, XLSX, and PPTX.</div>
            </td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
window.AscDesktopEditor.cloudCryptoCommand("upload", {
    "cryptoEngineId": "{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}",
    "filter": "*.docx *.xlsx *.pptx"
},
callback)
</pre>

<p>After the user chooses the files, they will be encrypted in a loop and transferred to <em>callback</em>:</p>
<pre>
callback({
    "bytes": [...],
    "name": "Example Document Title.docx",
    "isCrypto": true
})
</pre>


<p id="sharing" class="copy-link"><b>Sharing encrypted documents</b></p>
<p>To share the encrypted document, call the <em>cloudCryptoCommand</em> function with the <em>share</em> type. The <em>params</em> object has the following values:</p>

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
            <td id="cryptoEngineId" class="copy-link">cryptoEngineId</td>
            <td>
                Defines the <b>Encryption</b> plugin ID.
            </td>
            <td>string</td>
            <td>"{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}"</td>
        </tr>
        <tr class="tablerow">
            <td id="file" class="copy-link">file</td>
            <td>
                Defines the absolute url to the document.
            </td>
            <td>string</td>
            <td>"https://example.com/url-to-example-document.docx"</td>
        </tr>
        <tr class="tablerow">
            <td id="keys" class="copy-link">keys</td>
            <td>
                Defines the pairs of user ids and associated public keys.
            </td>
            <td>array</td>
            <td>[{"userId":"78e1e841","publicKey":"yyy"}, ...]</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
window.AscDesktopEditor.cloudCryptoCommand("share",
{
    "cryptoEngineId": "{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}",
    "file": ["https://example.com/url-to-example-document.docx" ],
    "keys":[{"userId":"78e1e841","publicKey":"yyy"}, ...]
}, 
callback)
</pre>

<p>The file is uploaded by the desktop app and encrypted. The access rights to the file are transferred to it with keys. After that, it is transmitted to <em>callback</em>:</p>
<pre>
callback({
    "bytes": [...],
    "isCrypto": true
})
</pre>
