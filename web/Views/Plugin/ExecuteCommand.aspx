<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    executeCommand
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("plugin") %>"></a>
        <span class="hdr">window.Asc.plugin.executeCommand (type, data, callback)</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr">Defines the method used to send the data back to the editor.</p>
    <div class="note">This method is deprecated, please use the <a href="<%= Url.Action("callcommand") %>">callCommand</a> method which runs the code from the <em>data</em> string parameter.</div>

    <p>Now this method is mainly used to work with the OLE objects or close the plugin without any other commands.
        It is also retained for using with text so that the previous versions of the plugin remain compatible.</p>
    <p>The <em>callback</em> is the result that the command returns. It is an optional parameter. In case it is missing, the 
        <a href="<%= Url.Action("events") %>#onCommandCallback">window.Asc.plugin.onCommandCallback</a> function will be used to return the result of the command execution.</p>

    <p>The second parameter is the JavaScript code for working with <b>ONLYOFFICE Document Builder</b> <a href="<%= Url.Action("basic", "docbuilder") %>">API</a> that allows the plugin to send structured data inserted to the resulting document file (formatted paragraphs, tables, text parts and separate words, etc.).</p>

    <div class="note"><b>ONLYOFFICE Document Builder</b> commands can be only used to create content and insert it to the document editor (using the <em>Api.GetDocument().InsertContent(...))</em>. This limitation exists due to the co-editing feature in the online editors. If it is necessary to create a plugin for the desktop editors to work with local files, no such limitation is applied.</div>

    <div class="header-gray">Parameters</div>
    <table class="table">
        <colgroup>
            <col style="width: 100px;" />
            <col />
            <col style="width: 100px;" />
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
                <td>type</td>
                <td>Defines the type of the command. The <em>close</em> is used to close the plugin window after executing the function in the <em>data</em> parameter. The <em>command</em> is used to execute the command and leave the window open waiting for the next command.</td>
                <td>string</td>
            </tr>
            <tr class="tablerow">
                <td>data</td>
                <td>Defines the command written in JavaScript code which purpose is to form the structured data which can be inserted to the resulting document file (formatted paragraphs, tables, text parts and separate words, etc.). Then the data is sent to the editors. The command must be compatible with <a href="<%= Url.Action("basic", "docbuilder") %>">ONLYOFFICE Document Builder</a> syntax.</td>
                <td>string</td>
            </tr>
            <tr class="tablerow">
                <td>callback</td>
                <td>The result that the method returns.</td>
                <td>function</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <p>When creating/editing OLE objects, two extensions are used to work with them:</p>

    <ul>
        <li><em>Api.asc_addOleObject (window.Asc.plugin.info)</em> - used to create an OLE object in the document;</li>
        <li><em>Api.asc_editOleObject (window.Asc.plugin.info)</em> - used to edit the created OLE object.</li>
    </ul>

    <p>When creating/editing the objects, their properties can be passed to the <a href="<%= Url.Action("info") %>">window.Asc.plugin.info</a> object that defines how the object should look.</p>

    <div class="header-gray">Example OLE object</div>

    <pre>
window.Asc.plugin.button = function (id) {
    var _info = window.Asc.plugin.info;
    var _method = (_info.objectId === undefined) ? "asc_addOleObject" : "asc_editOleObject";
    _info.width = _info.width ? _info.width : 70;
    _info.height = _info.height ? _info.height : 70;
    _info.widthPix = (_info.mmToPx * _info.width) >> 0;
    _info.heightPix = (_info.mmToPx * _info.height) >> 0;
    _info.imgSrc = window.g_board.getResult(_info.widthPix, _info.heightPix).image;
    _info.data = window.g_board.getData();
    var _code = "Api." + _method + "(" + JSON.stringify(_info) + ");";
    this.executeCommand("close", _code);
};
</pre>

    <div class="header-gray">Example text (not used but retained for compatibility reason)</div>

    <pre>
window.Asc.plugin.init = function () {
    var sScript = 'var oDocument = Api.GetDocument();';
    sScript += 'oDocument.CreateNewHistoryPoint();';
    sScript += 'oParagraph = Api.CreateParagraph();';
    sScript += 'oParagraph.AddText(\'Hello word!\');';
    sScript += 'oDocument.InsertContent([oParagraph]);';
    window.Asc.plugin.info.recalculate = true;
    this.executeCommand("close", sScript);
};
</pre>

</asp:Content>
