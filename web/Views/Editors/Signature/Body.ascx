<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("signature/") %>"></a>
    <span class="hdr">Request with token in body</span>
</h1>

<p class="dscr">
    When performing the HTTP requests from ONLYOFFICE Document Server the <em>token</em> is added to the parameters to validate the data.
    When performing the HTTP requests to ONLYOFFICE Document Server the <em>token</em> must be added to the parameters to validate the data.
</p>

<p>
    Starting from version 5.2, it is possible to use the token in body parameters with <b>Document Server</b>.
    To enable it set the <em>services.CoAuthoring.token.inbox.inBody</em> and <em>services.CoAuthoring.token.outbox.inBody</em> in configuration file to <b>true</b>.
</p>
<p>
    Starting from version 7.1, these parameters are deprecated.
    Now the incoming requests use the token in body if it exists.
    Otherwise, the header token is taken.
    To specify what is used next to validate the data, <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#services-CoAuthoring-server-tokenRequiredParams" target="_blank">services.CoAuthoring.server.tokenRequiredParams</a> must be added to the <em>local.json</em> configuration file. If it is <b>true</b>, only the token data is used.
    Otherwise, the opened request part is merged with the token data.
</p>
<p>
    The outgoing requests use both the token in body and token in header. They can be different.
    For example, the information about version history can be removed from the header token because of the size limit of the token in header.
</p>

<div class="note">
    Token in body is used for POST requests only.
    For the GET requests <a href="<%= Url.Action("signature/request") %>">token in header</a> is used.
</div>

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
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.inbox.inBody</td>
            <td>
                Specifies the enabling the token validation in the request body to the <b>document command service</b>, <b>document conversion service</b> and <b>document builder service</b>.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.outbox.inBody</td>
            <td>
                Specifies the enabling the token generation for the request body by <b>document editing service</b> to <b>document storage service</b>.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<p>The <em>payload</em> for the JSON Web Token contains the request body parameters.</p>

<h2>Incoming request</h2>

<ul>
    <li>
        <p><b id="command" class="copy-link">Request to receive the status of the edited document</b></p>
        <p>Validation is performed for incoming requests with the commands from the <b>document storage service</b> to the <a href="<%= Url.Action("command") %>">document command service</a>.</p>

        <div class="header-gray">Sample parameters of request to receive the status of the edited document</div>
        <pre>
{
    "c": "info",
    "key": "Khirz6zTPdfd7"
}
</pre>

        <p>These parameters must be encoded into the token so that the request looked like this:</p>

        <div class="header-gray">Sample of request to receive the status of the edited document</div>
        <pre>
POST coauthoring/CommandService.ashx HTTP/1.1
Host: documentserver
Content-Type: application/json

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjIjoiaW5mbyIsImtleSI6IktoaXJ6NnpUUGRmZDcifQ.r_6sThjFABsHMNHhkVdHDSz4jwkbXRQNYdvawkBGJgg"
}
</pre>

        <p>As you can see there is no need to include the above parameters into the request body, as all of them are already encoded into the token and sent within it.</p>
    </li>
    <li>
        <p><b id="conversion" class="copy-link">Request to convert the document</b></p>
        <p>Validation is performed for incoming requests with the commands from the <b>document storage service</b> to the <a href="<%= Url.Action("conversionapi") %>">document conversion service</a>.</p>

        <div class="header-gray">Sample parameters of request to convert the document</div>
        <pre>
{
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "pdf",
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
        <p>
            Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
        </p>
        <div class="header-gray">Sample of request to convert the document</div>
        <pre>
POST ConvertService.ashx HTTP/1.1
Host: documentserver
Content-Type: application/json

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxldHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3Iiwib3V0cHV0dHlwZSI6InBkZiIsInRpdGxlIjoiRXhhbXBsZSBEb2N1bWVudCBUaXRsZS5kb2N4IiwidXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.U-YAfuuy7clWjn-xOncfJ-sxVG5DlcYn0AOzJYkoR0M"
}
</pre>
        <p>
            Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
        </p>
    </li>
    <li>
        <p><b id="builder" class="copy-link">Request to document builder service</b></p>
        <p>Validation is performed for incoming requests with the commands from the <b>document storage service</b> to the <a href="<%= Url.Action("documentbuilderapi") %>">document builder service</a>.</p>

        <div class="header-gray">Sample parameters of request to document builder service</div>
        <pre>
{
    "async": true,
    "url": "https://example.com/url-to-example-script.docbuilder"
}
</pre>
        <p>
            Where the <b>example.com</b> is the name of the server where <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
        </p>
        <div class="header-gray">Sample of request to document builder service</div>
        <pre>
POST docbuilder HTTP/1.1
Host: documentserver
Content-Type: application/json

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhc3luYyI6dHJ1ZSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1zY3JpcHQuZG9jYnVpbGRlciJ9.dzoTbRzSMa95Fpg34CjnF3ZUPdGA2CnBedFL_qOOxAs"
}
</pre>
        <p>
            Where the <b>example.com</b> is the name of the server where <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
        </p>
    </li>
</ul>

<h2>Outgoing requests</h2>

<ul>
    <li>
        <p><b id="callbackUrl" class="copy-link">Request to "callbackUrl" address by document editing service when the last user closed the document for editing without changes</b></p>
        <p>Validation is performed for outgoing requests to "<a href="<%= Url.Action("config/editor") %>#callbackUrl">callbackUrl</a>" address by <b>document editing service</b>.</p>

        <div class="header-gray">Sample parameters of request to "callbackUrl" address by document editing service when the last user closed the document for editing without changes</div>
        <pre>
{
    "key": "Khirz6zTPdfd7",
    "status": 4
}
</pre>
        <div class="header-gray">Sample of request to "callbackUrl" address by document editing service when the last user closed the document for editing without changes</div>
        <pre>
POST url-to-callback.ashx HTTP/1.1
Host: example.com
Content-Type: application/json

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJLaGlyejZ6VFBkZmQ3Iiwic3RhdHVzIjo0fQ.gCyNKPpg6ISAnhvFQmRiY6BRqG6WPcEGgnK79hREdkU"
}
</pre>
        <p>
            Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
        </p>

        <p>When performing the GET requests from ONLYOFFICE Document Server an <a href="<%= Url.Action("signature/request") %>">authorization header</a> with the token is added.</p>
    </li>
</ul>
