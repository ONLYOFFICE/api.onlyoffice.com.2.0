<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <a class="up" href="<%= Url.Action("addingdms/encryption") %>"></a>
   <span class="hdr">Key generation</span>
</h1>

<p>To check if the desktop app supports encryption, call the following command:</p>
<pre>
typeof window.AscDesktopEditor.cloudCryptoCommand === "function"
</pre>
<p>The steps below explain the process of document encryption in ONLYOFFICE.</p>

<ol>
    <li>
        <p>Log in to the cloud and pass the <b>Encryption</b> plugin ID:</p>
        <pre>
window.AscDesktopEditor.execCommand("portal:login", JSON.stringify({
    "encryptionKeys": {
        "cryptoEngineId": "{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}"
    },
    ...
}));
</pre>
    </li>
    <li>
        <p>To monitor the password from the login page, send the desktop editors the <em>portal:checkpwd</em> command through the <a href="<%= Url.Action("addingdms/loginlogout") %>">execCommand</a> method.
            Parameters are specified in the format of a string with the serialized <em>json</em> as follows:</p>
        <pre>
{
    "domain": "domain name",
    "emailInput": "user@email.addr",
    "pwdInput": "pwd"
}
</pre>
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
                    <td id="domain" class="copy-link">domain</td>
                    <td>
                        Defines the cloud name and the cloud entry point.
                    </td>
                    <td>string</td>
                    <td>"https://exampledomain.com"</td>
                </tr>
                <tr class="tablerow">
                    <td id="emailInput" class="copy-link">emailInput</td>
                    <td>
                        Defines the user email entered on the login page.
                    </td>
                    <td>string</td>
                    <td>"john@example.com"</td>
                </tr>
                <tr class="tablerow">
                    <td id="pwdInput" class="copy-link">pwdInput</td>
                    <td>
                        Defines the password entered on the login page.
                    </td>
                    <td>string</td>
                    <td>"123456"</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>

        <div class="header-gray">Example</div>
        <pre>
window.AscDesktopEditor.execCommand("portal:checkpwd", JSON.stringify({
    "domain": "https://exampledomain.com",
    "emailInput": "john@example.com",
    "pwdInput": "123456"
}));
</pre>
        <p>When the command is sent, the DMS provider transfers the information about the password from the login page to the desktop app.
            ONLYOFFICE Desktop Editors remembers the password and uses it for the key encryption and decryption.</p>
    </li>
    <li>
        <p>Pass the encrypted private and public keys with the login from the DMS provider to the desktop application with the following parameters:</p>
        <pre>
"encryptionKeys": {
    "cryptoEngineId": "guid",
    "privateKeyEnc": "private key",
    "publicKey": "public key"
}
</pre>
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
                    <td id="privateKeyEnc" class="copy-link">privateKeyEnc</td>
                    <td>
                        Defines the encrypted private key.
                    </td>
                    <td>string</td>
                    <td>"xxx"</td>
                </tr>
                <tr class="tablerow">
                    <td id="publicKey" class="copy-link">publicKey</td>
                    <td>
                        Defines the public key.
                    </td>
                    <td>string</td>
                    <td>"yyy"</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>

        <div class="header-gray">Example</div>
        <pre>
window.AscDesktopEditor.execCommand("portal:login", JSON.stringify({
    "encryptionKeys": {
        "cryptoEngineId": "{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}",
        "privateKeyEnc": "xxx",
        "publicKey": "yyy"
    },
    ...
}));
</pre>

        <p>You can also do it in the editor initialization config:</p>
        <pre>
new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "encryptionKeys": {
            "cryptoEngineId": "{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}",
            "privateKeyEnc": "xxx",
            "publicKey": "yyy"
        },
        ...
    },
    ...
});
</pre>
    </li>
    <li>
        <p>Send the generated keys to the cloud through the <em>cloudCryptoCommand</em> method with the <em>encryptionKeys</em> type:</p>
        <pre>
window.AscDesktopEditor.cloudCryptoCommand(
    "encryptionKeys",
    {
        "cryptoEngineId": "{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}",
        "privateKeyEnc": "xxx",
        "publicKey": "yyy"
    },
callback)
</pre>
    </li>
</ol>
