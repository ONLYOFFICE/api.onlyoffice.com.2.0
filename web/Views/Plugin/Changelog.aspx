<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Changelog
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Changelog</span>
    </h1>

    <p class="dscr">The list of changes for ONLYOFFICE Plugins and Macros API.</p>
    <h2 id="81" class="copy-link">Version 8.1</h2>
    <ul>
        <li>Added the ability to create <a href="<%= Url.Action("variations") %>">multiple left panels</a> for plugins.</li>
        <li>Added the <a href="<%= Url.Action("events/ontoolbarmenuclick") %>">onToolbarMenuClick</a> event.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/activatewindow") %>">ActivateWindow</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/addtoolbarmenuitem") %>">AddToolbarMenuItem</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/getselectedoleobjects") %>">GetSelectedOleObjects</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/cell/getallcomments") %>">GetAllComments</a> method to <em>window.Asc.plugin.executeMethod</em> for Spreadsheet Api.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/slide/getallcomments") %>">GetAllComments</a> method to <em>window.Asc.plugin.executeMethod</em> for Presentation Api.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#OLEProperties">OLEProperties</a> type to the simple type definitions.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#ToolbarMenuItem">ToolbarMenuItem</a> type to the simple type definitions.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#ToolbarMenuMainItem">ToolbarMenuMainItem</a> type to the simple type definitions.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#ToolbarMenuTab">ToolbarMenuTab</a> type to the simple type definitions.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#ToolbarMenuItemType">ToolbarMenuItemType</a> type to the simple type definitions.</li>
        <li>Added the <em>icons</em> and <em>data</em> parameters to the <a href="<%= Url.Action("global") %>#ContextMenuItem">ContextMenuItem</a> object.</li>
        <li>Added the <a href="<%= Url.Action("config") %>#menu">menu</a> config parameter.</li>
    </ul>

    <h2 id="80" class="copy-link">Version 8.0</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("executemethod/slide/endslideshow") %>">EndSlideShow</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/slide/gotonextslideinslideshow") %>">GoToNextSlideInSlideShow</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/slide/gotopreviousslideinslideshow") %>">GoToPreviousSlideInSlideShow</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/slide/gotoslideinslideshow") %>">GoToSlideInSlideShow</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/slide/pauseslideshow") %>">PauseSlideShow</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/slide/resumeslideshow") %>">ResumeSlideShow</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/slide/startslideshow") %>">StartSlideShow</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
    </ul>

    <h2 id="75" class="copy-link">Version 7.5</h2>
    <ul>
        <li>Added the <em>align</em> parameter to the <a href="<%= Url.Action("executemethod/common/showbutton") %>">ShowButton</a> method of <em>window.Asc.plugin.executeMethod</em>.</li>
    </ul>

    <h2 id="74" class="copy-link">Version 7.4</h2>
    <ul>
        <li>Added the ability to download ready-to-use plugins from <a href="<%= Url.Action("installation/desktop") %>#plugin-manager">ONLYOFFICE Plugin Marketplace</a> in ONLYOFFICE Desktop Editors.</li>
        <li>Added the <a href="<%= Url.Action("sendtoplugin") %>">sendToPlugin</a> method to the <em>Plugin</em> object.</li>
        <li>Added the <a href="<%= Url.Action("events/oncontextmenuclick") %>">onContextMenuClick</a> event.</li>
        <li>Added the <a href="<%= Url.Action("events/oncontextmenushow") %>">onContextMenuShow</a> event.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/addcontextmenuitem") %>">AddContextMenuItem</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/closewindow") %>">CloseWindow</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/getcurrentsentence") %>">GetCurrentSentence</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/getcurrentword") %>">GetCurrentWord</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/getdocumentlang") %>">GetDocumentLang</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/installdeveloperplugin") %>">InstallDeveloperPlugin</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/mousemovewindow") %>">MouseMoveWindow</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/mouseupwindow") %>">MouseUpWindow</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/replacecurrentsentence") %>">ReplaceCurrentSentence</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/replacecurrentword") %>">ReplaceCurrentWord</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/resizewindow") %>">ResizeWindow</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/sendtowindow") %>">SendToWindow</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/showwindow") %>">ShowWindow</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/updatecontextmenuitem") %>">UpdateContextMenuItem</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <em>backup</em> parameter to the <a href="<%= Url.Action("executemethod/common/removeplugin") %>">RemovePlugin</a> method of <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <em>NewLineSeparator</em> parameter to the <a href="<%= Url.Action("executemethod/common/getselectedtext") %>">GetSelectedText</a> method of <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <em>replaceMode</em> parameter to the <a href="<%= Url.Action("global") %>#ImageData">ImageData</a> object.</li>
    </ul>

    <h2 id="73" class="copy-link">Version 7.3</h2>
    <ul>
        <li>Added the <em>sign</em> type to the <a href="<%= Url.Action("config") %>#initDataType">initDataType</a> config parameter.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/addaddinfield") %>">AddAddinField</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/getalladdinfields") %>">GetAllAddinFields</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/getvbamacros") %>">GetVBAMacros</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/ondropevent") %>">OnDropEvent</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/removefieldwrapper") %>">RemoveFieldWrapper</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/seteditingrestrictions") %>">SetEditingRestrictions</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/updateaddinfields") %>">UpdateAddinFields</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/cell") %>">Spreadsheet Api</a> methods to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/slide") %>">Presentation Api</a> methods to <em>window.Asc.plugin.executeMethod</em>.</li>
    </ul>

    <h2 id="72" class="copy-link">Version 7.2</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("events/onAddComment") %>">onAddComment</a> event.</li>
        <li>Added the <a href="<%= Url.Action("events/onChangeCommentData") %>">onChangeCommentData</a> event.</li>
        <li>Added the <a href="<%= Url.Action("events/onRemoveComment") %>">onRemoveComment</a> event.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/acceptreviewchanges") %>">AcceptReviewChanges</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/movetonextreviewchange") %>">MoveToNextReviewChange</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/rejectreviewchanges") %>">RejectReviewChanges</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Changed the plugin <a href="<%= Url.Action("localization") %>">localization</a> scheme.</li>
        <li>Added the <a href="<%= Url.Action("installation/onpremises") %>#plugin-manager">ONLYOFFICE Plugin Marketplace</a>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/text/changeoleobject") %>">ChangeOleObject</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/form/getallforms") %>">GetAllForms</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/getfiletodownload") %>">GetFileToDownload</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/form/getformsbytag") %>">GetFormsByTag</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/form/getformvalue") %>">GetFormValue</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/getimagedatafromselection") %>">GetImageDataFromSelection</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/getinstalledplugins") %>">GetInstalledPlugins</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/installplugin") %>">InstallPlugin</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/putimagedatatoselection") %>">PutImageDataToSelection</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/removeplugin") %>">RemovePlugin</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/form/setformvalue") %>">SetFormValue</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/showbutton") %>">ShowButton</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("executemethod/common/updateplugin") %>">UpdatePlugin</a> method to <em>window.Asc.plugin.executeMethod</em>.</li>
        <li>Added the <a href="<%= Url.Action("events/onBlurContentControl") %>">onBlurContentControl</a> event.</li>
        <li>Added the <a href="<%= Url.Action("events/onChangeContentControl") %>">onChangeContentControl</a> event.</li>
        <li>Added the <a href="<%= Url.Action("events/onFocusContentControl") %>">onFocusContentControl</a> event.</li>
    </ul>

</asp:Content>
