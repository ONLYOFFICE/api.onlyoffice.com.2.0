<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Web Document Builder API
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Web Document Builder API</span>
    </h1>

    <p class="dscr">
        For the interaction with the <b>web document builder service</b> the POST requests are used.
        The request parameters are entered in JSON format in the request body.
        The requests are sent to the <span class="fakelink">https://documentserver/docbuilder</span> address where <b>documentserver</b> is the name of the server with the ONLYOFFICE Docs installed.
    </p>

    <h2>Parameters and their description:</h2>
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
                <td id="argument" class="copy-link">argument</td>
                <td>Defines the arguments to pass to the created document.</td>
                <td>object</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="async" class="copy-link">async</td>
                <td>Defines the type of the request to the <b>document builder service</b>: asynchronous or not.<br />
                    Supported values:
                    <ul>
                        <li><b>true</b></li>
                        <li><b>false</b></li>
                    </ul>
                    When the asynchronous request type is used, the response is formed instantly.
                    In this case to get the result it is necessary to send requests without parameter change until the document generation is finished.
                    The default value is <b>false</b>.
                </td>
                <td>boolean</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="key" class="copy-link">key</td>
                <td>Defines the request identifier used to unambiguously identify the request.
                    The key is formed on the <b>document builder service</b> side and is returned as the response to the first request.
                    When the asynchronous request is used (the <em>async</em> parameter is set to <b>true</b>) the key is not present in the first request, but must be present in all the following requests which will be send before the generation is complete.
                    When the synchronous request is used (the <em>async</em> parameter is set to <b>false</b>), this parameter is not required.
                </td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td id="token" class="copy-link">token</td>
                <td>Defines the encrypted signature added to the <b>ONLYOFFICE Docs</b> config in the form of a <a href="<%= Url.Action("signature/body") %>#builder">token</a>.</td>
                <td>string</td>
                <td>required by configuration</td>
            </tr>
            <tr class="tablerow">
                <td id="url" class="copy-link">url</td>
                <td>Defines the absolute URL to the .docbuilder file.</td>
                <td>string</td>
                <td>required</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <p>
        The <em>.docbuilder</em> file contains the script used to generate the output document file (text document, spreadsheet or presentation), specifies the output file format and name.
        Once the document generation is ready, the response with the absolute URL to the resulting file will be returned (see below).
    </p>

    <div class="note">
        Please note, that <em>.docbuilder</em> script file can contain several output files as a result.
        The URL to them all will be returned in the response to the request once the file generation is finished.
    </div>

    <p>
        You can find more information about the <em>.docbuilder</em> file syntax <a href="<%= Url.Action("integrationapi/usingdocbuilderfile", "DocBuilder") %>">here</a>.
        Please read <a href="<%= Url.Action("basic", "officeapi") %>">Office JavaScript API documentation</a> for the detailed information on what classes and methods are used to generate the documents with the help of <em>.docbuilder</em> files.
    </p>

    <div id="sample-sync-first" class="header-gray copy-link">Sample of JSON object sent to <b>document builder service</b> for the first asynchronous request</div>
    <pre>
{
    "async": true,
    "url": "https://example.com/url-to-example-script.docbuilder"
}
</pre>
    <p>
        Where <b>example.com</b> is the name of the server where <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
    </p>

    <div class="header-gray">Response format</div>
    <pre>
{
   "key": "af86C7e71Ca8",
   "end": false
}
</pre>

    <div id="sample-sync-next" class="header-gray copy-link">Sample of JSON object sent to <b>document builder service</b> for the following asynchronous requests</div>
    <pre>
{
    "async": true,
    "key": "Khirz6zTPdfd7"
}
</pre>


    <div class="header-gray">Response format</div>
    <pre>
{
   "key": "Khirz6zTPdfd7",
   "urls": {
      "SampleText.docx": "https://documentserver/SampleText.docx",
      "SampleText2.docx": "https://documentserver/SampleText2.docx"
   },
   "end": true
}
</pre>

    <div id="sample-async" class="header-gray copy-link">Sample of JSON object sent to <b>document builder service</b> for the synchronous request</div>
    <pre>
{
    "async": false,
    "url": "https://example.com/url-to-example-script.docbuilder"
}
</pre>
    <p>
        Where <b>example.com</b> is the name of the server where <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
    </p>

    <div class="header-gray">Response example</div>
    <pre>
{
   "key": "af86C7e71Ca8",
   "urls": {
      "SampleText.docx": "https://documentserver/SampleText.docx",
      "SampleText2.docx": "https://documentserver/SampleText2.docx"
   },
   "end": true
}
</pre>

    <div id="sample-builder-token" class="header-gray copy-link">Sample of JSON object contains the JSON Web Token sent to <b>document builder service</b> for the first asynchronous request</div>
    <pre>
{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhc3luYyI6dHJ1ZSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1zY3JpcHQuZG9jYnVpbGRlciJ9.dzoTbRzSMa95Fpg34CjnF3ZUPdGA2CnBedFL_qOOxAs"
}
</pre>

    <div class="header-gray">Example of the response when an error occurred</div>
    <pre>
{
    "error": -8
}
</pre>

    <div id="sample-argument" class="header-gray copy-link">Sample of JSON object contains the arguments sent to <b>document builder service</b> for the first synchronous request</div>
    <pre>
{
    "async": false,
    "url": "https://example.com/url-to-example-script.docbuilder",
    "argument": { "key": "string", "key2": "string2" }
}
</pre>
    <p>
        Where <b>example.com</b> is the name of the server where <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on ONLYOFFICE Docs service client-server interactions.
    </p>

    <div class="header-gray">Response format</div>
    <pre>
{
    "key": "af86C7e71Ca8",
    "urls": {
        "SampleText.docx": "https://documentserver/SampleText.docx",
        "SampleText2.docx": "https://documentserver/SampleText2.docx"
    },
    "end": true
}
</pre>

    <div class="header-gray">Possible error codes and their description</div>
    <table class="error-table">
        <colgroup>
            <col class="table-name" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Error code</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>-1</td>
                <td>Unknown error.</td>
            </tr>
            <tr class="tablerow">
                <td>-2</td>
                <td>Generation timeout error.</td>
            </tr>
            <tr class="tablerow">
                <td>-3</td>
                <td>Document generation error.</td>
            </tr>
            <tr class="tablerow">
                <td>-4</td>
                <td>Error while downloading the document file to be generated.</td>
            </tr>
            <tr class="tablerow">
                <td>-6</td>
                <td>Error while accessing the document generation result database.</td>
            </tr>
            <tr class="tablerow">
                <td>-8</td>
                <td>Invalid token.</td>
            </tr>
            <%--<tr class="tablerow">
                <td>-21</td>
                <td>Token signature is expired.</td>
            </tr>--%>
        </tbody>
    </table>
</asp:Content>
