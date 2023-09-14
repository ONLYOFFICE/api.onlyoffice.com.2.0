<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    info object
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("objects") %>"></a>
        <span class="hdr">info object</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr">Defines the auxiliary <em>window.Asc.plugin.info</em> object which is available when the plugin works. 
        It stores all the information about the editor that uses the plugin (the used <a href="#editorType">editorType</a> - 
        text documents, spreadsheets, presentations) and additional settings for OLE objects (their width, height, millimeter to pixel ratio for the OLE objects vector drawing 
        and some other OLE object parameters).</p>
    
    <p>This object is used to change the object data and to send additional parameters when executing the 
        <a href="<%= Url.Action("executecommand") %>">window.Asc.plugin.executeCommand</a> method. For example, if the document content is changed and recalculation is needed, 
        the parameter <a href="#recalculate">recalculate</a> must be set to <em>true</em>. 
        This action is necessary because the recalculation process is asynchronous. Moreover, some other data might need to be uploaded (e.g. a font or something else).</p>
    
    <p>See the available <em>window.Asc.plugin.info</em> object parameters below to find out more about them.</p>
    
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
                <td id="data" class="copy-link">data</td>
                <td>The OLE object data which need to be sent to the <em>window.Asc.plugin.info</em> object and used by the plugin.</td>
                <td>string</td>
                <td>"{data}"</td>
            </tr>
            <tr class="tablerow">
                <td id="editorType" class="copy-link">editorType</td>
                <td>The editor type where the plugin is currently running.</td>
                <td>string</td>
                <td>"word"</td>
            </tr>
            <tr class="tablerow">
                <td id="guid" class="copy-link">guid</td>
                <td>The OLE object GUID in the current document.</td>
                <td>string</td>
                <td>"asc.{UUID}"</td>
            </tr>
            <tr class="tablerow">
                <td id="height" class="copy-link">height</td>
                <td>The OLE object height measured in millimeters.</td>
                <td>number</td>
                <td>70</td>
            </tr>
            <tr class="tablerow">
                <td id="imgSrc" class="copy-link">imgSrc</td>
                <td>The link to the image (its visual representation) stored in the OLE object and used by the plugin.</td>
                <td>string</td>
                <td>"./resources/image.png"</td>
            </tr>
            <tr class="tablerow">
                <td id="mmToPx" class="copy-link">mmToPx</td>
                <td>Millimeter to pixel conversion ratio for the OLE object vector draw.</td>
                <td>number</td>
                <td>3</td>
            </tr>
            <tr class="tablerow">
                <td id="objectId" class="copy-link">objectId</td>
                <td>The OLE object identifier in the current document.</td>
                <td>string</td>
                <td>1</td>
            </tr>
            <tr class="tablerow">
                <td id="recalculate" class="copy-link">recalculate</td>
                <td>Forces the document to recalculate its content data.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="resize" class="copy-link">resize</td>
                <td>Checks if the OLE object size has been changed.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="width" class="copy-link">width</td>
                <td>The OLE object width measured in millimeters.</td>
                <td>number</td>
                <td>70</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Example for the <em>data</em>, <em>height</em>, <em>imgSrc</em>, <em>mmToPx</em>, <em>objectId</em> and <em>width</em> parameters</div>

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

    <div class="header-gray">Example for the <em>editorType</em> parameter</div>

    <pre>
function createScriptFromArray (aSelected) {
    var sScript = '';
    if (aSelected.length > 0) {
        switch (window.Asc.plugin.info.editorType) {
            case 'word': {
                sScript += 'var oDocument = Api.GetDocument();';
                sScript += '\noDocument.CreateNewHistoryPoint();';
                sScript += '\nvar oParagraph, oRun, arrInsertResult = [], oImage;';
                sScript += '\noDocument.InsertContent(arrInsertResult);';
                break;
            }
        }
    }
    return sScript;
}
</pre>

    <div class="header-gray">Example for the <em>guid</em> parameter</div>

    <pre>
window.Asc.plugin.init = function () {
    var plugin_uuid = window.Asc.plugin.info.guid;
};
</pre>

    <div class="header-gray">Example for the <em>recalculate</em> parameter</div>

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

    <div class="header-gray">Example for the <em>resize</em> parameter</div>

    <pre>
if (window.Asc.plugin.info.resize === true) {
    return window.Asc.plugin.button(0);
}
</pre>

</asp:Content>
