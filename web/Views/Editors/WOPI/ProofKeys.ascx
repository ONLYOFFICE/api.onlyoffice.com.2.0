<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <span class="hdr">Proof keys</span>
    </h1>

    <p class="dscr">To restrict public access to your data, a secure exchange of requests between an online office and an integrator must be configured.</p>

    <p>The integrator must check that the request is received from ONLYOFFICE Docs. It uses <a href="https://docs.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/online/scenarios/proofkeys" target="_blank">proof keys</a> for this purpose. 
        Document Server signs the request with a private key. The corresponding public key is written in the proof-key element in the <a href="<%= Url.Action("wopi/discovery") %>">WOPI discovery XML</a>. 
        The integrator checks the private key with the public key. The signature is sent with every request in the <b>X-WOPI-Proof</b> and <b>X-WOPI-ProofOld</b> HTTP headers. 
        Private and public keys are set up via the following config parameters:</p>


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
                <td>wopi.publicKey</td>
                <td>Defines the public key that the integrator uses to check the private key.</td>
                <td>string</td>
                <td>"public key example"</td>
            </tr>
            <tr>
                <td>wopi.modulus</td>
                <td>Defines the RSA modulus in the Base64-encoded format that is used to retrieve the public key.</td>
                <td>string</td>
                <td>"modulus example"</td>
            </tr>
            <tr>
                <td>wopi.exponent</td>
                <td>Defines the RSA exponent in the Base64-encoded format that is used to retrieve the public key.</td>
                <td>string</td>
                <td>"AQAB"</td>
            </tr>
            <tr>
                <td>wopi.privateKey</td>
                <td>Defines the private key that signs the Document Server request.</td>
                <td>string</td>
                <td>"private key example"</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Example</div>
    <pre>
{
    "wopi": {
        "publicKey": "public key example",
        "modulus": "modulus example",
        "exponent": "AQAB",
        "privateKey": "private key example"
    }
}
</pre>

    <note>By default, proof keys are already set. They are not generated, i.e. the same keys are used for all installations.</note>
