<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Inserting external data
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Inserting external data</span>
    </h1>
    <p class="dscr">The steps below explain the process of inserting data into the spreadsheet by an external link in ONLYOFFICE Document Server.</p>
    <img alt="Inserting external data" src="<%= Url.Content("~/content/img/editor/insert-external-data.svg") %>" />
    <ol>
        <li>The user copies the cell value to the clipboard from the <b>document editor</b> of the source spreadsheet. At the same time, the special data is also copied.</li>
        <li>The user inserts the copied data into the <b>document editor</b> of the destination spreadsheet.</li>
        <li>The <b>document editor</b> requests a link to the source file by sending the data to the <b>document manager</b>.</li>
        <li>The <b>document manager</b> sends the source spreadsheet link to the <b>document editor</b>.</li>
        <li>The <b>document editor</b> sends a request to the <b>document editing service</b> for spreadsheet downloading.</li>
        <li>The <b>document editing service</b> downloads the source spreadsheet from the <b>document storage service</b>.</li>
        <li>The <b>document editing service</b> sends all the necessary data to display in the <b>document editor</b> of the destination spreadsheet.</li>
    </ol>

    <h2 id="apply" class="copy-link">How this can be done in practice</h2>
    <ol>
        <li>Create a source spreadsheet from where the data will be copied.</li>
        <li>
            <p>Specify the <a href="<%= Url.Action("config/document") %>#referenceData">document.referenceData</a> parameter in the initialization config of the source spreadsheet:</p>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "referenceData": {
            "fileKey": "BCFA2CED",
            "instanceId": "https://example.com"
        },
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>When the user copies the data from the source spreadsheet, the clipboard receives a list of the following values:</p>
            <ul>
                <li>the sheet name and the range from where the data was copied which will be used later to refresh the copied data;</li>
                <li>the <a href="<%= Url.Action("config/document") %>#referenceData">document.referenceData</a> object which will be used to check the availability of insering data into the destination spreadsheet by the external link;</li>
                <li>the file name which will be used to display a formula in the editor.</li>
            </ul>
        </li>
        <li>Create a destination spreadsheet where the external data will be inserted.</li>
        <li>
            <p>Specify the <a href="<%= Url.Action("config/events") %>#onRequestReferenceData">onRequestReferenceData</a> event handler in the initialization config of the destination spreadsheet
                for the <em>Paste link</em> and <em>Update values</em> buttons to be displayed:
            </p>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestReferenceData": onRequestReferenceData,
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>If the clipboard has the source spreadsheet data specified in step 3, and the destination spreadsheet has the <em>onRequestReferenceData</em> event handler
                in the initialization config, then the <em>Paste link</em> button is displayed in the dialog box.</p>
            <img class="screenshot-width-550" alt="Paste link" src="<%= Url.Content("~/content/img/editor/paste-link.png") %>" />
        </li>
        <li>
            <p>When the user clicks the <em>Paste link</em> button, the formula is inserted into the current cell, and the <em>referenceData</em> object is saved to the destination file.
                The inserted formula is displayed as follows:</p>
            <pre>
='[fileName]sheetName'!cell
</pre>
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
                        <td>cell</td>
                        <td>The cell from where the data was copied.</td>
                        <td>string</td>
                        <td>E5</td>
                    </tr>
                    <tr class="tablerow">
                        <td>fileName</td>
                        <td>The file name from where the data was copied.</td>
                        <td>string</td>
                        <td>new.xlsx</td>
                    </tr>
                    <tr class="tablerow">
                        <td>sheetName</td>
                        <td>The sheet name from where the data was copied.</td>
                        <td>string</td>
                        <td>Sheet1</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <p>The data update request to the file will be sent to the file URL.</p>
            <note>Please note that you can enter a formula of the specified format in the cell, and the data from the extrenal file will be inserted as well.
                But in this case, the <em>onRequestReferenceData</em> event will be executed only with the <em>path</em> parameter.</note>
        </li>
        <li>
            <p>When the user is trying to refresh data from the source file by clicking the <em>Update values</em> button in the <em>External links</em> dialog box of the <em>Data</em> tab,
                the <a href="<%= Url.Action("config/events") %>#onRequestReferenceData">onRequestReferenceData</a> event is called. An object with the unique file data received
                from the source file and the file path or name are sent in the <em>data</em> parameter.</p>
            <note>To send the data to the <em>setReferenceData</em> method, it is recommended to search for the file by the <em>referenceData</em> parameter first.
                If there is no such a field or a file cannot be found, then the <em>path</em> parameter is used.</note>
            <pre>
var onRequestReferenceData = function (event) {
    var referenceData = event.data.referenceData;
    var path = event.data.path;
    ...
};
</pre>
            <img class="screenshot-width-700" alt="Update values" src="<%= Url.Content("~/content/img/editor/update-values.png") %>" />
        </li>
        <li>
            <p>In order to refresh the data from the source file, the <a href="<%= Url.Action("methods") %>#setReferenceData">setReferenceData</a> method must be called:</p>
            <note>Please note that this method is executed only when the user has permissions to the source file.</note>
            <pre>
docEditor.setReferenceData({
    "fileType": "xlsx",
    "path": "sample.xlsx",
    "referenceData": {
        "fileKey": "BCFA2CED",
        "instanceId": "https://example.com"
    },
    "url": "https://example.com/url-to-example-document.xlsx"
});
</pre>
            <p>
                Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
                See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
            </p>
        </li>
    </ol>

</asp:Content>
