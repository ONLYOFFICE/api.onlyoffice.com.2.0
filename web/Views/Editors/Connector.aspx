<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Automation API
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Automation API</span>
    </h1>

    <p class="dscr"><b>Connector</b> is a class that allows editing text documents, spreadsheets, presentations, and fillable forms from an external source.
        The examples of using Automation API can be found <a href="<%= Url.Action("interactingoutside") %>">here</a>.
    </p>
    <p>To create the connector, use the <a href="<%= Url.Action("methods") %>#createConnector">createConnector</a> method of the <b>document editor</b> object:</p>
    <pre>
var connector = docEditor.createConnector()
</pre>
    <note>
        <p>Please note that the connector is available only for <b>ONLYOFFICE Developer Edition</b>.</p>
        <p>This class is an additional feature which is available at extra cost. If you have any questions, please contact our sales team at <a href="mailto:sales@onlyoffice.com" target="_blank">sales@onlyoffice.com</a>.</p>
    </note>
    <p>The connector has the same interface as plugins. Below you can find methods that are available for this class.</p>

    <ul>
        <li><a href="#attachEvent">attachEvent</a> - add an event listener.</li>
        <li><a href="#callCommand">callCommand</a> - send the data back to the editor.</li>
        <li><a href="#connect">connect</a> - connect the connector to the editor.</li>
        <li><a href="#detachEvent">detachEvent</a> - remove an event listener.</li>
        <li><a href="#disconnect">disconnect</a> - disconnect the connector from the editor.</li>
        <li><a href="#executeMethod">executeMethod</a> - execute certain editor methods using the connector.</li>
    </ul>

    <h2>Methods and their description:</h2>
    <ul>
        <li>
            <p><b id="attachEvent" class="copy-link">attachEvent</b> - the function called to add an event listener, a function that will be called whenever the specified event is delivered to the target.
                The list of all the available events is the same as for the plugins. It can be found <a href="<%= Url.Action("events", "plugin") %>">here</a>.</p>
            <div class="header-gray">Parameters</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>name</td>
                        <td>The event name.</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>callback</td>
                        <td>The event listener.</td>
                        <td>function</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <div class="header-gray">Example</div>
            <pre>
connector.attachEvent("onChangeContentControl", function()
{
    console.log("event: onChangeContentControl");
});
</pre>
        </li>

        <li>
            <p><b id="callCommand" class="copy-link">callCommand</b> - the function called to send the data back to the editor.
                It allows the connector to send structured data that can be inserted into the resulting document file
                (formatted paragraphs, tables, text parts, and separate words, etc.).</p>
            <note><b>ONLYOFFICE Document Builder</b> commands can be only used to create content and insert it into the document editor
                (using the <em>Api.GetDocument().InsertContent(...))</em>. This limitation exists due to the co-editing feature in the online editors.</note>
            <div class="header-gray">Parameters</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>command</td>
                        <td>Defines the command written in JavaScript which purpose is to form structured data which can be inserted into the resulting document file
                            (formatted paragraphs, tables, text parts, and separate words, etc.). Then the data is sent to the editors.
                            The command must be compatible with <a href="<%= Url.Action("basic", "officeapi") %>">Office JavaScript API</a> syntax.</td>
                        <td>function</td>
                    </tr>
                    <tr class="tablerow">
                        <td>callback</td>
                        <td>The result that the method returns. It is an optional parameter.</td>
                        <td>function</td>
                    </tr>
                    <tr class="tablerow">
                        <td>isNoCalc</td>
                        <td>Defines whether the document will be recalculated or not. The <b>true</b> value is used to recalculate the document
                            after executing the function in the <em>command</em> parameter. The <b>false</b> value will not recalculate the document
                            (use it only when your edits surely will not require document recalculation). The default value is <b>false</b>.</td>
                        <td>boolean</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <p>This method is executed in its context isolated from other JavaScript data. If some parameters or other data need to be passed to this method, use <a href="<%= Url.Action("scope", "plugin") %>">Asc.scope</a> object.</p>
            <div class="header-gray">Example</div>
            <pre>
Asc.scope.text = "Hello world!"; 

connector.callCommand(function() {

    var oDocument = Api.GetDocument();
    var oParagraph = Api.CreateParagraph();
    oParagraph.AddText(Asc.scope.text);
    oDocument.InsertContent([oParagraph]);

}, function() { console.log("callback command"); });
</pre>
        </li>

        <li>
            <p><b id="connect" class="copy-link">connect</b> - the function called to connect the connector to the editor.</p>
            <note>Please note that this method should only be called if you have disconnected the connector with the <a href="#disconnect">disconnect</a> method
                and need to connect it to the editor again. When creating a connector, you do not need to use the <em>connect</em> method,
                as it is called automatically along with the <a href="<%= Url.Action("methods") %>#createConnector">createConnector</a> method.</note>
            <div class="header-gray">Example</div>
            <pre>
connector.connect()
</pre>
        </li>

        <li>
            <p><b id="detachEvent" class="copy-link">detachEvent</b> - the function called to remove an event listener.</p>
            <div class="header-gray">Parameters</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>name</td>
                        <td>The event name.</td>
                        <td>string</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <div class="header-gray">Example</div>
            <pre>
connector.detachEvent("onChangeContentControl");
</pre>
        </li>

        <li>
            <p><b id="disconnect" class="copy-link">disconnect</b> - the function called to disconnect the connector from the editor.</p>
            <div class="header-gray">Example</div>
            <pre>
connector.disconnect()
</pre>
        </li>

        <li>
            <p><b id="executeMethod" class="copy-link">executeMethod</b> - the function called to execute certain editor methods using the connector.
                The full list of these methods is the same as for the plugins. It can be found <a href="<%= Url.Action("executemethod/", "plugin") %>">here</a>.</p>
            <div class="header-gray">Parameters</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>name</td>
                        <td>The name of the specific method that must be executed.</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>args</td>
                        <td>The arguments that the method in use has (if it has any).</td>
                        <td>array</td>
                    </tr>
                    <tr class="tablerow">
                        <td>callback</td>
                        <td>The result that the method returns. It is an optional parameter.</td>
                        <td>function</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <div class="header-gray">Example</div>
            <pre>
connector.executeMethod("SetFormValue",[forms[i]["InternalId"],"OnlyOffice BANK"],null);
</pre>
        </li>
    </ul>

</asp:Content> 