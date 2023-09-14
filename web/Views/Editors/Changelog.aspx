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

    <p class="dscr">The list of changes of ONLYOFFICE Document Server API.</p>
    <h2 id="74" class="copy-link">Version 7.4</h2>
    <ul>
        <li>Added opening for <a href="<%= Url.Action("config/") %>#documentType">dps, dpt, et, ett, mhtml, stw, sxc, sxi, sxw, wps, wpt</a> formats.</li>
        <li>Added the <em>users.id</em> field to the <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> method.</li>
        <li>Added the <em>c</em> parameter to the <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> method and <a href="<%= Url.Action("config/events") %>#onRequestUsers">events.onRequestUsers</a> event.</li>
    </ul>

    <h2 id="73" class="copy-link">Version 7.3</h2>
    <ul>
        <li>Added the WOPI <a href="<%= Url.Action("wopi/conversionapi") %>">Conversion API</a>.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#setReferenceData">setReferenceData</a> method.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestReferenceData">events.onRequestReferenceData</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/document") %>#referenceData">document.referenceData</a> parameter.</li>
        <li>Added the <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#UserCanNotWriteRelative">UserCanNotWriteRelative</a> property to the <em>CheckFileInfo</em> WOPI operation.</li>
        <li>Added a scheme for <a href="<%= Url.Action("wopi/editingbinary") %>">editing binary document formats</a>.</li>
        <li>Added the <a href="<%= Url.Action("wopi/discovery") %>#convert">convert</a> action to the WOPI discovery.</li>
        <li>Added the <a href="<%= Url.Action("wopi/restapi/putrelativefile") %>">PutRelativeFile</a> WOPI operation.</li>
    </ul>

    <h2 id="72" class="copy-link">Version 7.2</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#integrationMode">editorConfig.customization.integrationMode</a> parameter.</li>
        <li>Added the <a href="<%= Url.Action("connector") %>">Connector</a> class to interact with text documents, spreadsheets, presentations, and fillable forms from the outside.</li>
        <li>Added the <em>theme-contrast-dark</em> theme id to the <a href="<%= Url.Action("config/editor/customization") %>#uiTheme">editorConfig.customization.uiTheme</a> parameter.</li>
        <li>Added the <em>phone</em> field to the <a href="<%= Url.Action("config/editor/customization") %>#customer">editorConfig.customization.customer</a> parameter.</li>
        <li>Added the <a href="<%= Url.Action("command/license") %>#license">connections_view</a>, <a href="<%= Url.Action("command/license") %>#license">users_view_count</a> and <a href="<%= Url.Action("command/license") %>#quota">users_view</a> parameters to the license response.</li>
        <li>Added the <a href="<%= Url.Action("viewing") %>">live viewer</a> mode to the text document, spreadsheet and presentation editors.</li>
        <li>Added the <a href="<%= Url.Action("wopi/discovery") %>#embedview">embedview</a> action to the WOPI discovery.</li>
        <li>The <a href="<%= Url.Action("signature/") %>#services.CoAuthoring.secret.browser.string">services.CoAuthoring.secret.browser.string</a> parameter is deprecated, please use the <a href="<%= Url.Action("signature/") %>#services.CoAuthoring.secret.inbox.string">services.CoAuthoring.secret.inbox.string</a> parameter instead.</li>
    </ul>

    <h2 id="71" class="copy-link">Version 7.1</h2>
    <ul>
        <li>The <em>services.CoAuthoring.token.inbox.inBody</em> and <em>services.CoAuthoring.token.outbox.inBody</em> parameters for enabling <a href="<%= Url.Action("signature/body") %>">token in body</a> are deprecated.</li>
        <li>Added the <em>X-LOOL-WOPI-IsModifiedByUser</em>, <em>X-LOOL-WOPI-IsAutosave</em> and <em>X-LOOL-WOPI-IsExitSave</em> request headers to the <a href="<%= Url.Action("wopi/restapi/putfile") %>">PutFile</a> WOPI operation to distinguish between the type of document saving.</li>
        <li>The <a href="<%= Url.Action("config/editor/customization") %>#chat">editorConfig.customization.chat</a> parameter is deprecated, please use the <a href="<%= Url.Action("config/document/permissions") %>#chat">document.permissions.chat</a> parameter instead.</li>
        <li>Added conversion from <a href="<%= Url.Action("conversionapi") %>#text-matrix">dps, dpt, et, ett, htm, mhtml, stw, sxc, sxi, sxw, wps, wpt, xlsb, xml</a> format.</li>
        <li>Added opening for <a href="<%= Url.Action("config/") %>#documentType">xlsb</a> format.</li>
        <li>The parameter list in the initialization config <a href="<%= Url.Action("signature/browser") %>#open">signature</a> has become strictly regulated.</li>
        <li>The <a href="<%= Url.Action("config/editor/customization") %>#spellcheck">editorConfig.customization.spellcheck</a> field is deprecated, please use the <a href="<%= Url.Action("config/editor/customization") %>#features">editorConfig.customization.features.spellcheck</a> field instead.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#features">editorConfig.customization.features</a> parameter section.</li>
        <li>Added the <a href="<%= Url.Action("conversionapi") %>#documentLayout">documentLayout</a> parameter to the conversion request.</li>
        <li>Added the <a href="<%= Url.Action("conversionapi") %>#documentRenderer">documentRenderer</a> parameter to the conversion request.</li>
        <li>Added conversion from <a href="<%= Url.Action("conversionapi") %>#text-matrix">pdf/xps/oxps</a> formats to <em>docx</em>.</li>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#userInfoGroups">document.permissions.userInfoGroups</a> parameter.</li>
        <li>Added conversion from <a href="<%= Url.Action("conversionapi") %>#text-matrix">djvu</a> format to <em>pdf</em>.</li>
        <li>Added conversion to <a href="<%= Url.Action("conversionapi") %>#presentation-matrix">ppsm, ppsx</a> formats.</li>
    </ul>

    <h2 id="70" class="copy-link">Version 7.0</h2>
    <ul>
        <li>Added the <em>.docxf</em> and <em>.oform</em> <a href="<%= Url.Action("config/") %>#documentType">document formats</a>.</li>
        <li>Added conversion to and from <a href="<%= Url.Action("conversionapi") %>#text-matrix">docxf</a> format.</li>
        <li>The <a href="<%= Url.Action("callback") %>#used-callbackUrl">callbackUrl</a> is used from the last tab of the same user.</li>
        <li>Added the <em>logoDark</em> field to the <a href="<%= Url.Action("config/editor/customization") %>#customer">editorConfig.customization.customer</a> parameter.</li>
        <li>Added the <em>imageDark</em> field to the <a href="<%= Url.Action("config/editor/customization") %>#logo">editorConfig.customization.logo</a> parameter.</li>
        <li>The <em>imageEmbedded</em> field of the <a href="<%= Url.Action("config/editor/customization") %>#logo">editorConfig.customization.logo</a> parameter is deprecated, please use the <em>image</em> field instead.</li>
        <li>Added a signature to the request for file changes specified with the <em>changesUrl</em> parameter of the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method</a>.
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#protect">document.permissions.protect</a> field.</li>
        <li>Added the <em>fileType</em> parameter to the <a href="<%= Url.Action("config/events") %>#onDownloadAs">onDownloadAs</a>, <a href="<%= Url.Action("config/events") %>#onRequestRestore">onRequestRestore</a> and <a href="<%= Url.Action("config/events") %>#onRequestSaveAs">onRequestSaveAs</a> events.</li>
        <li>Added the possibility to insert several images via the <a href="<%= Url.Action("methods") %>#insertImage">insertImage</a> method.</li>
        <li>The <a href="<%= Url.Action("save") %>#assemblyFormatAsOrigin">assemblyFormatAsOrigin</a> server setting is enabled by default.</li>
        <li>Added the <em>ooxml</em> and <em>odf</em> values to the <a href="<%= Url.Action("conversionapi") %>#outputtype">outputtype</a> parameter of the conversion request.</li>
        <li>Added the <em>fileType</em> and <em>previous.fileType</em> parameters to the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method.</li>
        <li>Added the <a href="<%= Url.Action("callback") %>#filetype">filetype</a> parameter to the <em>Callback handler</em>.</li>
        <li>Added the <a href="<%= Url.Action("conversionapi") %>#fileType">fileType</a> field to the conversion response.</li>
        <li>Added conversion to <a href="<%= Url.Action("conversionapi") %>#text-matrix">docm, dotm, xlsm, xltm, pptm, potm</a> formats.</li>
        <li>The <a href="<%= Url.Action("config/editor/customization") %>#reviewDisplay">editorConfig.customization.reviewDisplay</a>, <a href="<%= Url.Action("config/editor/customization") %>#showReviewChanges">editorConfig.customization.showReviewChanges</a>, <a href="<%= Url.Action("config/editor/customization") %>#trackChanges">editorConfig.customization.trackChanges</a> parameters are deprecated, please use the <a href="<%= Url.Action("config/editor/customization") %>#review">editorConfig.customization.review</a> parameter instead.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#review">editorConfig.customization.review.hideReviewDisplay</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#review">editorConfig.customization.review.hoverMode</a> field.</li>
        <li>Added the possibility to view the <a href="<%= Url.Action("history") %>">document history</a> of the spreadsheet files.</li>
        <li>Added the <a href="<%= Url.Action("wopi/postmessage") %>#UI_InsertGraphic">UI_InsertGraphic</a> message for the PostMessage WOPI protocol.</li>
    </ul>

    <h2 id="64" class="copy-link">Version 6.4</h2>
    <ul>
        <li>Added opening for <a href="<%= Url.Action("config/") %>#documentType">oxps</a> format.</li>
        <li>Added support for <a href="<%= Url.Action("wopi/") %>">WOPI protocol</a>.</li>
        <li>Added the <em>simple</em> value to the <a href="<%= Url.Action("config/editor/customization") %>#reviewDisplay">editorConfig.customization.reviewDisplay</a> parameter.</li>
        <li>Added the <a href="<%= Url.Action("commenting") %>#threaded-comments">threaded comments</a> saving in the spreadsheet files.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#uiTheme">editorConfig.customization.uiTheme</a> field.</li>
        <li>Added the possibility to view the <a href="<%= Url.Action("history") %>">document history</a> for the presentation files.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#hideNotes">editorConfig.customization.hideNotes</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor") %>#coEditing">editorConfig.coEditing</a> field.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#requestClose">requestClose</a> method.</li>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#commentGroups">document.permissions.commentGroups</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onPluginsReady">events.onPluginsReady</a> event.</li>
    </ul>

    <h2 id="63" class="copy-link">Version 6.3</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("command/license") %>">license</a> command.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#hideRulers">editorConfig.customization.hideRulers</a> field.</li>
        <%--<li>Added the <a href="<%= Url.Action("config/editor/customization") %>#submitForm">editorConfig.customization.submitForm</a> field.</li>--%>
        <%--<li>Added a new <a href="<%= Url.Action("callback") %>#used-callbackUrl">forcesavetype</a> (<em>forcesavetype = 3</em>).</li>--%>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#anonymous">editorConfig.customization.anonymous</a> field.</li>
        <li>The <a href="<%= Url.Action("config/editor/customization") %>#commentAuthorOnly">editorConfig.customization.commentAuthorOnly</a> field is deprecated, please use the <a href="<%= Url.Action("config/document/permissions") %>#editCommentAuthorOnly">document.permissions.editCommentAuthorOnly</a> and <a href="<%= Url.Action("config/document/permissions") %>#deleteCommentAuthorOnly">document.permissions.deleteCommentAuthorOnly</a> fields.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#setFavorite">setFavorite</a> method.</li>
        <li>Added the <em>data.favorite</em> parameter to the <a href="<%= Url.Action("config/events") %>#onMetaChange">events.onMetaChange</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/document/info") %>#favorite">document.info.favorite</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#reviewGroups">document.permissions.reviewGroups</a> field.</li>
        <li>Added conversion to <a href="<%= Url.Action("conversionapi") %>#text-matrix">epub, fb2, html</a> formats.</li>
        <li>Added conversion from <a href="<%= Url.Action("conversionapi") %>#text-matrix">xml</a> format.</li>
    </ul>

    <h2 id="62" class="copy-link">Version 6.2</h2>
    <ul>
        <li>Added a new <a href="<%= Url.Action("callback") %>#actions">actions.type</a> field value (<em>actions.type = 2</em>).</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#trackChanges">editorConfig.customization.trackChanges</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#toolbarHideFileName">editorConfig.customization.toolbarHideFileName</a> field.</li>
        <li>The <em>callbackUrl</em> for <em>status</em> <b>6</b> is selected based on <a href="<%= Url.Action("callback") %>#used-callbackUrl">forcesavetype</a>.</li>
        <li>Added opening for <a href="<%= Url.Action("config/") %>#documentType">fb2</a> format.</li>
    </ul>

    <h2 id="61" class="copy-link">Version 6.1</h2>
    <ul>
        <li>The <em>text</em>, <em>spreadsheet</em> and <em>presentation</em> values for <a href="<%= Url.Action("config/") %>#documentType">documentType</a> parameter is deprecated, please use <em>word</em>, <em>cell</em> and <em>slide</em> values instead.</li>
        <li>Added the <em>group</em> field to the <a href="<%= Url.Action("config/editor") %>#user">editorConfig.user</a>.</li>
        <li>Added conversion from <a href="<%= Url.Action("conversionapi") %>#text-matrix">fb2</a> format.</li>
    </ul>

    <h2 id="60" class="copy-link">Version 6.0</h2>
    <ul>
        <li>Added the type of insertion in <a href="<%= Url.Action("config/events") %>#onRequestInsertImage">events.onRequestInsertImage</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/editor") %>#templates">editorConfig.templates</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#plugins">editorConfig.customization.plugins</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#macros">editorConfig.customization.macros</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#macrosMode">editorConfig.customization.macrosMode</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestCreateNew">events.onRequestCreateNew</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#copy">document.permissions.copy</a> field.</li>
        <li>The <a href="<%= Url.Action("config/document/permissions") %>#rename">document.permissions.rename</a> field is deprecated, please add the <a href="<%= Url.Action("config/events") %>#onRequestRename">events.onRequestRename</a> field instead.</li>
    </ul>

    <h2 id="55" class="copy-link">Version 5.5</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#spellcheck">editorConfig.customization.spellcheck</a> field.</li>
        <li>Added conversion to <a href="<%= Url.Action("conversionapi") %>#text-matrix">pdfa</a> format.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestCompareFile">events.onRequestCompareFile</a> event.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#setRevisedFile">setRevisedFile</a> method.</li>
        <li>Token in <a href="<%= Url.Action("signature/browser") %>#methods">methods</a> parameters.</li>
        <li>The <a href="<%= Url.Action("config/document/permissions") %>#changeHistory">document.permissions.changeHistory</a> field is deprecated, please add the <a href="<%= Url.Action("config/events") %>#onRequestRestore">events.onRequestRestore</a> field instead.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#goback">editorConfig.customization.goback.requestClose</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestSharingSettings">events.onRequestSharingSettings</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#unit">editorConfig.customization.unit</a> field.</li>
        <li>Added the <a href="<%= Url.Action("conversionapi") %>#region">region</a> field.</li>
        <li>Added the <a href="<%= Url.Action("conversionapi") %>#spreadsheetLayout">spreadsheetLayout</a> field.</li>
        <li>Added <a href="<%= Url.Action("conversionapi") %>#error-codes">input error</a> for conversion.</li>
        <li>The <a href="<%= Url.Action("config/events") %>#onRequestSendNotify">events.onRequestSendNotify</a> event and the <a href="<%= Url.Action("config/events") %>#onRequestUsers">events.onRequestUsers</a> event can be set independently.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#mentionShare">editorConfig.customization.mentionShare</a> field.</li>
        <li>The <em>callbackUrl</em> is selected based on <a href="<%= Url.Action("callback") %>#used-callbackUrl">status</a>.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#compatibleFeatures">editorConfig.customization.compatibleFeatures</a> field.</li>
    </ul>

    <h2 id="54" class="copy-link">Version 5.4</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("config/editor") %>#region">editorConfig.region</a> field.</li>
        <li>The <a href="<%= Url.Action("config/document/info") %>#created">document.info.created</a> field is deprecated, please use the <a href="<%= Url.Action("config/document/info") %>#uploaded">document.info.uploaded</a> field instead.</li>
        <li>The <a href="<%= Url.Action("config/document/info") %>#author">document.info.author</a> field is deprecated, please use the <a href="<%= Url.Action("config/document/info") %>#owner">document.info.owner</a> field instead.</li>
        <li>The <a href="<%= Url.Action("config/events") %>#onReady">events.onReady</a> event is removed.</li>
        <li>The <em>firstname</em> and <em>lastname</em> fields in the <a href="<%= Url.Action("config/editor") %>#user">editorConfig.user</a> object is removed.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestSaveAs">events.onRequestSaveAs</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestInsertImage">events.onRequestInsertImage</a> event.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#insertImage">insertImage</a> method.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestMailMergeRecipients">events.onRequestMailMergeRecipients</a> event.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#setMailMergeRecipients">setMailMergeRecipients</a> method.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#setSharingSettings">setSharingSettings</a> method.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestUsers">events.onRequestUsers</a> event.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> method.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestSendNotify">events.onRequestSendNotify</a> event.</li>
    </ul>

    <h2 id="53" class="copy-link">Version 5.3</h2>
    <ul>
        <li>Added <a href="<%= Url.Action("conversionapi") %>#text-matrix">conversion</a> to the OOXML (dotx, xltx, potx) and ODF (ott, ots, otp) templates.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#reviewDisplay">editorConfig.customization.reviewDisplay</a> field.</li>
        <li>The <a href="<%= Url.Action("config/editor/customization") %>#commentAuthorOnly">editorConfig.customization.commentAuthorOnly</a> field is now used to restrict comment deletion as well.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#compactHeader">editorConfig.customization.compactHeader</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#hideRightMenu">editorConfig.customization.hideRightMenu</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#toolbarNoTabs">editorConfig.customization.toolbarNoTabs</a> field.</li>
        <li>Added <a href="<%= Url.Action("conversionapi") %>#error-codes">conversion error</a> for password protected documents.</li>
        <li>Added the <a href="<%= Url.Action("config/editor") %>#actionLink">editorConfig.actionLink</a> field.</li>
        <li>Added the <a href="<%= Url.Action("methods") %>#setActionLink">setActionLink</a> method.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onMakeActionLink">events.onMakeActionLink</a> event.</li>
    </ul>

    <h2 id="52" class="copy-link">Version 5.2</h2>
    <ul>
        <li>Token in request <a href="<%= Url.Action("signature/body") %>">body</a> parameters.</li>
        <li><a href="<%= Url.Action("config/document/permissions") %>#comment">document.permissions.comment</a> is available in all types of editors.</li>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#fillForms">document.permissions.fillForms</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#help">editorConfig.customization.help</a> field.</li>
        <li>Added the possibility to make the <a href="<%= Url.Action("config/editor/customization") %>#logo">editorConfig.customization.logo</a> not clickable.</li>
        <li>Added for the <a href="<%= Url.Action("conversionapi") %>#thumbnail-aspect">aspect</a> field value <em>2</em> for the conversion.</li>
    </ul>

    <h2 id="51" class="copy-link">Version 5.1</h2>
    <ul>
        <li>Added the <em>format</em> parameter to the <a href="<%= Url.Action("methods") %>#downloadAs">downloadAs</a> method.</li>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#modifyContentControl">document.permissions.modifyContentControl</a> field.</li>
        <li>Added conversion for <a href="<%= Url.Action("conversionapi") %>#text-matrix">OpenDocument Template</a> formats.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestClose">events.onRequestClose</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#goback">editorConfig.customization.goback.blank</a> field.</li>
    </ul>

    <h2 id="50" class="copy-link">Version 5.0</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#modifyFilter">document.permissions.modifyFilter</a> field.</li>
        <li>Added conversion for macro-enabled document, document template and flat document <a href="<%= Url.Action("conversionapi") %>#text-matrix">formats</a>.</li>
        <li>The <a href="<%= Url.Action("config/events") %>#onReady">events.onReady</a> event is deprecated, please use the <a href="<%= Url.Action("config/events") %>#onAppReady">events.onAppReady</a> events instead.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onDocumentReady">events.onDocumentReady</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/plugins") %>#autostart">editorConfig.plugins.autostart</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onWarning">events.onWarning</a> event.</li>
        <li>Added the <a href="<%= Url.Action("documentbuilderapi") %>">Document Builder service</a>.</li>
    </ul>

    <h2 id="44" class="copy-link">Version 4.4</h2>
    <ul>
        <li>Changed the <a href="<%= Url.Action("methods") %>#showMessage">showMessage</a> method.</li>
        <li>Added conversion to <a href="<%= Url.Action("conversionapi") %>#presentation-matrix">odp</a> format.</li>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#comment">document.permissions.comment</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#changeHistory">document.permissions.changeHistory</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestRestore">events.onRequestRestore</a> event.</li>
        <li>Added the <a href="<%= Url.Action("config/document/permissions") %>#rename">document.permissions.rename</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onRequestRename">events.onRequestRename</a> event.</li>
        <li>Added the <a href="<%= Url.Action("command/meta") %>">meta</a> command.</li>
        <li>Added the <a href="<%= Url.Action("config/events") %>#onMetaChange">events.onMetaChange</a> event.</li>
        <li>Changed the use of <em>callbackUrl</em> from the <a href="<%= Url.Action("callback") %>#used-callbackUrl">last user</a> who joined the co-editing.</li>
        <li>Added the <a href="<%= Url.Action("config/editor") %>#location">editorConfig.location</a> field.</li>
    </ul>

    <h2 id="43" class="copy-link">Version 4.3</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("methods") %>#destroyEditor">destroyEditor</a> method.</li>
        <li>Removed the <a href="<%= Url.Action("config/editor/plugins") %>#url">editorConfig.plugins.url</a> field from the plugin connection pattern.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#commentAuthorOnly">editorConfig.customization.commentAuthorOnly</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#forcesave">editorConfig.customization.forcesave</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#showReviewChanges">editorConfig.customization.showReviewChanges</a> field.</li>
        <li>Added the <a href="<%= Url.Action("callback") %>#forcesavetype">forcesavetype</a> field in the callback handler request when force saving the file.</li>
        <li>Added the <a href="<%= Url.Action("conversionapi") %>#response">JSON format for response</a> from document conversion service.</li>
    </ul>

    <h2 id="42" class="copy-link">Version 4.2</h2>
    <ul>
        <li>The <a href="<%= Url.Action("config/editor") %>#user">firstname</a> and <a href="<%= Url.Action("config/editor") %>#user">lastname</a> fields is deprecated, please use the <a href="<%= Url.Action("config/editor") %>#user">name</a> field instead.</li>
        <li>Added the possibility to specify the values for the <a href="<%= Url.Action("config/editor/customization") %>#chat">editorConfig.customization.chat</a> and <a href="<%= Url.Action("config/editor/customization") %>#comments">editorConfig.customization.comments</a> in the Open Source version.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#compactToolbar">editorConfig.customization.compactToolbar</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#zoom">editorConfig.customization.zoom</a> field.</li>
        <li>Added the <a href="<%= Url.Action("config/editor/customization") %>#autosave">editorConfig.customization.autosave</a> field.</li>
        <li>The <a href="<%= Url.Action("callback") %>#changeshistory">changeshistory</a> field is removed, please use the <a href="<%= Url.Action("callback") %>#history">history</a> field instead.</li>
        <li>Changed the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method.</li>
        <li>Added the possibility to convert files to <a href="<%= Url.Action("conversionapi") %>#sample-thumbnail">thumbnail</a> in the <a href="<%= Url.Action("conversionapi") %>">document conversion service</a>.</li>
        <li>The POST requests are now used for the interaction with the <a href="<%= Url.Action("command") %>">document command service</a> and the <a href="<%= Url.Action("conversionapi") %>">document conversion service</a>.</li>
        <li>Added the <a href="<%= Url.Action("command/version") %>">version</a> command.</li>
        <li>Added the <a href="<%= Url.Action("signature/") %>">signature</a> for the editor opening and for the incoming and outgoing requests.</li>
    </ul>

</asp:Content>
