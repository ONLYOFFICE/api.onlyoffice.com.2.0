<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
        <a class="up" href="<%= Url.Action("plugin") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod (name, [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method used to execute certain editor methods using the plugin.</p>

<p>The <em>callback</em> is the result that the method returns. It is an optional parameter. In case it is missing, the 
    <a href="<%= Url.Action("events") %>#onMethodReturn">window.Asc.plugin.onMethodReturn</a> function will be used to return the result of the method execution.</p>

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
                <td>name</td>
                <td>The name of the specific method that must be executed</td>
                <td>string</td>
            </tr>
            <tr class="tablerow">
                <td>args</td>
                <td>The arguments that the method in use has (if it has any).</td>
                <td>array</td>
            </tr>
            <tr class="tablerow">
                <td>callback</td>
                <td>The result that the method returns.</td>
                <td>function</td>
            </tr>
        </tbody>
    </table>


<p>See the available <em>window.Asc.plugin.executeMethod</em> methods below to find more about them.</p>

<div class="header-gray">Methods and properties</div>

<table class="table">
    <colgroup>
            <col style="width: 200px;" />
            <col />
            <col style="width: 200px;" />
        </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/addcomment") %>">AddComment</a></td>
            <td>This method allows to add a comment to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/addcontentcontrol") %>">AddContentControl</a></td>
            <td>This method allows to add an empty content control to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/addoleobject") %>">AddOleObject</a></td>
            <td>This method allows to add an OLE object to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/changecomment") %>">ChangeComment</a></td>
            <td>This method allows to change the specified comment.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/editoleobject") %>">EditOleObject</a></td>
            <td>This method allows to edit an OLE object in the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/endaction") %>">EndAction</a></td>
            <td>This method allows to specify the end action for long operations.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getallcomments") %>">GetAllComments</a></td>
            <td>This method allows to get all the comments from the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getallcontentcontrols") %>">GetAllContentControls</a></td>
            <td>This method allows to get information about all the content controls that have been added to the page.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getcurrentcontentcontrol") %>">GetCurrentContentControl</a></td>
            <td>This method allows to get the identifier of the selected content control.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getcurrentcontentcontrolpr") %>">GetCurrentContentControlPr</a></td>
            <td>This method allows to get current content control properties.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getfields") %>">GetFields</a></td>
            <td>This method allows to open file with fields.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getfilehtml") %>">GetFileHTML</a></td>
            <td>This method allows to get file content in the HTML format.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getfontlist") %>">GetFontList</a></td>
            <td>This method allows to get the fonts list.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getmacros") %>">GetMacros</a></td>
            <td>This method allows to get the document macros.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getselectedtext") %>">GetSelectedText</a></td>
            <td>This method allows to get the selected text from the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getselectiontype") %>">GetSelectionType</a></td>
            <td>This method allows to get the type of the current selection.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/getversion") %>">GetVersion</a></td>
            <td>This method allows to get the editor version.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/inputtext") %>">InputText</a></td>
            <td>This method allows to insert text into the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/insertandreplacecontentcontrols") %>">InsertAndReplaceContentControls</a></td>
            <td>This method allows to insert a content control that contains data.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/movecursortocontentcontrol") %>">MoveCursorToContentControl</a></td>
            <td>This method allows to move the cursor to the specified content control.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/movecursortoend") %>">MoveCursorToEnd</a></td>
            <td>This method allows to move the cursor to the end position.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/movecursortostart") %>">MoveCursorToStart</a></td>
            <td>This method allows to move the cursor to the start position.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/movetocomment") %>">MoveToComment</a></td>
            <td>This method allows to move the cursor to the specified comment.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/onencryption") %>">OnEncryption</a></td>
            <td>This method allows to encrypt the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/openfile") %>">OpenFile</a></td>
            <td>This method allows to open file with fields.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/pastehtml") %>">PasteHtml</a></td>
            <td>This method allows to paste text in the <em>html</em> format into the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/pastetext") %>">PasteText</a></td>
            <td>This method allows to paste text into the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/removecomments") %>">RemoveComments</a></td>
            <td>This method allows to remove the specified comments.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/removecontentcontrol") %>">RemoveContentControl</a></td>
            <td>This method allows to remove a content control, but leave all its contents.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/removecontentcontrols") %>">RemoveContentControls</a></td>
            <td>This method allows to remove several content controls.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/removeselectedcontent") %>">RemoveSelectedContent</a></td>
            <td>This method allows to remove the selected content from the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/searchandreplace") %>">SearchAndReplace</a></td>
            <td>This method allows to find and replace the text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/selectcontentcontrol") %>">SelectContentControl</a></td>
            <td>This method allows to select the specified content control.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/setmacros") %>">SetMacros</a></td>
            <td>This method allows to set macros to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/setproperties") %>">SetProperties</a></td>
            <td>This method allows to set the properties to the document.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/showinputhelper") %>">ShowInputHelper</a></td>
            <td>This method allows to show the input helper.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/startaction") %>">StartAction</a></td>
            <td>This method allows to specify the start action for long operations.</td>
        </tr>       
        <tr class="tablerow">
            <td><a href="<%= Url.Action("executemethod/unshowinputhelper") %>">UnShowInputHelper</a></td>
            <td>This method allows to unshow the input helper.</td>
        </tr>
    </tbody>
</table>

<div class="note">For the plugin to work correctly, it is necessary to wait until the current method is executed before executing the next method.</div>
