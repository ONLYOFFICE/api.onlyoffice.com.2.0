<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Saving File
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Saving file</span>
    </h1>
    <p class="dscr">The reference figure and the steps below explain the process of saving a document in ONLYOFFICE Document Server.</p>
    <img alt="Opening File" src="<%= Url.Content("~/content/img/editor/saving.jpg") %>" />
    <ol>
        <li>The user edits the document in the <b>document editor</b>.</li>
        <li>The <b>document editor</b> sends the changes to the <b>document editing service</b>.</li>
        <li>The user closes the <b>document editor</b>.</li>
        <li>The <b>document editing service</b> watches the end of work with the document and collects the changes sent from the <b>document editor</b> into one document.</li>
        <li>
            The <b>document editing service</b> informs the <b>document storage service</b> about the end of the document editing using the <em>callbackUrl</em> from <a href="<%= Url.Action("basic") %>">JavaScript API</a> and returns the link to the modified document.
            <div class="note">
                Please note that since version 5.5, <a href="<%= Url.Action("config/editor") %>#callbackUrl">callbackUrl</a> is selected based on <a href="<%= Url.Action("callback") %>#status">status</a> of the request.
                Starting from version 4.4 to version 5.5, <em>callbackUrl</em> is used from the last user who joined the co-editing.
                Prior to version 4.4, when co-editing, <em>callbackUrl</em> is used from the user who first opened the file for editing.
            </div>
        </li>
        <li>The <b>document storage service</b> downloads the document file with all the saved changes from the <b>document editing service</b> and stores it.</li>
    </ol>

    <h2 id="apply" class="copy-link">How this can be done in practice</h2>
    <ol>
        <li>Create a <a href="<%= Url.Action("callback") %>">callback handler</a> to save the document from <b>document editing service</b>.</li>
        <li>Create an <em>html</em> file to <a href="<%= Url.Action("open") %>#apply">Open the document</a>.</li>
        <li>In the configuration script for Document Editor initialization specify the URL to the file with the <em>Callback handler</em> in the <a href="<%= Url.Action("config/editor") %>#callbackUrl">parameter line</a>.
            Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links. Otherwise, an error will occur.
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "callbackUrl": "https://example.com/url-to-callback.ashx"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50IFRpdGxlLmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCIsImVkaXRvckNvbmZpZyI6eyJjYWxsYmFja1VybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWNhbGxiYWNrLmFzaHgifX0.vbezS2aM8Xf8qFzIAsO-jrIsi7VLxjRYkIkwh5jLTJU"
});
</pre>
            Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        </li>
        <li>Open your <em>html</em> file in the browser and edit your document.</li>
        <li>
            Close the <b>Document Editor</b>.
            Check out your document in about 10 seconds.
            All changes should be saved, meaning the configuration is correct.
        </li>
    </ol>


    <h2 id="savedelay" class="copy-link">Save delay</h2>
    <p>
        Once the document editing is finished, the <b>document editing service</b> informs the <b>document storage service</b> about it.
        The time before this is done is calculated using the conversion time of the edited file into the Office Open XML format (which depends on the file size, complexity and the computer power, and can be performed rather a long time), and conversion start delay time (which is equal to 5 seconds by default).
        In most common cases the time is about 10 seconds after the editing is finished.
    </p>
    <p>
        The conversion start delay is necessary to allow to return to the file editing session without the file saving, e.g. when reloading the browser page with the file opened for editing.
        The default conversion start delay time is defined with the <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#services-CoAuthoring-server-savetimeoutdelay" target="_blank">services.CoAuthoring.server.savetimeoutdelay</a> parameter in <b>Document Server</b> configuration file, which can be found at the following path:
    </p>
    <div>For Linux - <em>/etc/onlyoffice/documentserver/<b>default.json</b></em>.</div>
    <div>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\config\<b>default.json</b></em>.</div>
    <p>
        If you want to change it, you can use the <em>local.json</em> file, where all the edited parameters should be stored.
        This file is located in the same directory as the <em>default.json</em> file and the <b>whole object structure</b> for the necessary parameter <b>must be retained</b> (see the examples below).
    </p>
    <div class="note">
        Please do not edit the contents of the <em>default.json</em> file directly.
        The default values will be restored each time you restart Docker container or upgrade <b>Document Server</b> to a new version and all your changes will be lost.
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
                <td>services.CoAuthoring.server.savetimeoutdelay</td>
                <td>Defines the conversion start delay time (measured in milliseconds) after the edited file is closed.</td>
                <td>integer</td>
                <td>5000</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Sample local.json configuration</div>
    <pre>
{
    "services": {
        "CoAuthoring": {
            "server": {
                "savetimeoutdelay": 5000
            }
        }
    }
}
</pre>


    <h2 id="forcesave" class="copy-link">Force saving</h2>

    <p>
        <b>Document editing service</b> allows to get the current document state before the editing is finished.
        The process is called <em>forcesave</em> in ONLYOFFICE Document Server.
        When forcesave is initiated, <b>document editing service</b> performs request to the <a href="<%= Url.Action("callback") %>">callback handler</a> with the link to the document as the <em>url</em> parameter and with the <b>6</b> value for the <em>status</em> parameter.
        The forcesave process can be initiated the following ways:
    </p>
    <ul>
        <li>By the request to the <a href="<%= Url.Action("command") %>">document command service</a> with the <a href="<%= Url.Action("command/forcesave") %>">forcesave</a> value in the <em>c</em> parameter.
            The <em>forcesavetype</em> parameter will have the <b>0</b> value when sending the request to the <b>callback handler</b>.</li>
        <li>Enable the <a href="<%= Url.Action("config/editor/customization") %>#forcesave">editorConfig.customization.forcesave</a> mode setting it to <b>true</b> in the editor initialization configuration.
            In this case each time the user clicks the <b>Save</b> button, the forcesave will be done, and the <em>forcesavetype</em> parameter will have the <b>1</b> value when sending the request to the <b>callback handler</b>.</li>
        <li>You can enable <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#AutoAssembly" target="_blank">the repeating forcesave start</a> in the <b>Document Server</b> additional configuration file, which can be either found at (in case you have already created it) or placed to the following path:
            <div>For Linux - <em>/etc/onlyoffice/documentserver/<b>local.json</b></em>.</div>
            <div>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\config\<b>local.json</b></em>.</div>

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
                        <td>services.CoAuthoring.autoAssembly.enable</td>
                        <td>
                            Defines if the automatic forcesaving is enabled or not.
                            The default value is <b>false</b>.
                        </td>
                        <td>boolean</td>
                        <td>false</td>
                    </tr>
                    <tr class="tablerow">
                        <td>services.CoAuthoring.autoAssembly.interval</td>
                        <td>Defines the interval time in minutes for initiating the automatic forcesaving.</td>
                        <td>string</td>
                        <td>5m</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>

            <div class="header-gray">Sample local.json configuration</div>
            <pre>
{
    "services": {
        "CoAuthoring": {
            "autoAssembly": {
                "enable": true,
                "interval": "5m"
            }
        }
    }
}
</pre>
        The <em>forcesavetype</em> parameter will have the <b>2</b> value when sending the request to the <b>callback handler</b>.</li>
    </ul>
    <note>Please note that you cannot see the document versions created with the force saving option in the document history.
        The reason is that ONLYOFFICE Docs <a href="<%= Url.Action("history") %>#apply-changes">highlights the changes</a> made from the beginning of the current document session, not from the beginning of the document version.
        And even if several document versions are created during one session, all changes from this session will be highlighted.</note>


    <h2 id="assemblyFormatAsOrigin" class="copy-link">Saving in original format</h2>

    <p>
        Starting from version 7.0, the <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#services-CoAuthoring-server-assemblyFormatAsOrigin" target="_blank">assemblyFormatAsOrigin</a> server setting is enabled by default to save the assembled file in its original format.
        It is used to change the file format from OOXML to ODF or to save files with macros.
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
                <td>Parameter</td>
                <td>Description</td>
                <td>Type</td>
                <td>Example</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>services.CoAuthoring.server.assemblyFormatAsOrigin</td>
                <td>
                    Defines if the assembled file is saved in its original format or not.
                    The default value is <b>true</b>.
                </td>
                <td>boolean</td>
                <td>true</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Sample local.json configuration</div>
    <pre>
{
    "services": {
        "CoAuthoring": {
            "server": {
                "assemblyFormatAsOrigin": true
            }
        }
    }
}
</pre>
    <note>
        Remember that this setting can crash some integrators which open the documents without prior conversion (for example, in the <em>.doc</em> format which is unavailable for saving in ONLYOFFICE Docs).
        Disable this setting if necessary.
    </note>

</asp:Content>
