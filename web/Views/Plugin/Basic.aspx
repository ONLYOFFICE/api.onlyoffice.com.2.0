<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Overview
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Overview</span>
    </h1>

    <span class="pvl_product">ONLYOFFICE Plugins and Macros</span><span class="pvl_version">v<%= Products.Get("plugin").Version %></span>

    <p>
        ONLYOFFICE <a href="https://www.onlyoffice.com/office-suite.aspx" target="_blank">Docs</a> and <a href="https://www.onlyoffice.com/desktop.aspx" target="_blank">Desktop Editors</a> offer support for plugins allowing developers to add specific features to the editors that are not directly related to the OOXML format.
    </p>
    <p>
        This documentation describes:
    </p>
    <ul>
        <li>How to <a href="<%= Url.Action("structure") %>">build</a>, <a href="<%= Url.Action("localization") %>">localize</a>, run, test and publish a plugin</li>
        <li>How to <a href="<%= Url.Action("writingmacros") %>">write</a>, <a href="<%= Url.Action("debugging") %>">debug</a> and run a macro 
            or <a href="<%= Url.Action("convertingvbamacros") %>">convert</a> VBA macros to use in ONLYOFFICE</li>
        <li>How to use ONLYOFFICE <a href="<%= Url.Action("plugin") %>">methods</a> and <a href="<%= Url.Action("events") %>">events</a></li>
        <li>Where to find guides and <a href="<%= Url.Action("example/") %>">plugin</a>/<a href="<%= Url.Action("macrosamples") %>">macro</a> code samples to get started</li>
    </ul>


    <h2>What plugins can do</h2>

    <p>Here are some examples of what you can do with ONLYOFFICE plugins:</p>
    <ul>
        <li>connect third-party services, like <a href="<%= Url.Action("example/telegram") %>">Telegram</a>, <a href="<%= Url.Action("example/youtube") %>">YouTube</a>, 
            <a href="<%= Url.Action("example/thesaurus") %>">Thesaurus</a>, <a href="<%= Url.Action("example/translator") %>">Translator</a>, <a href="<%= Url.Action("example/zotero") %>">Zotero</a>, 
            <a href="<%= Url.Action("example/ocr") %>">OCR</a>, etc.;</li>
        <li>add custom components & controls in the UI, like <b>Trackchanges</b>, <b>Trackchanges_off</b>;</li>
        <li>enhance the existing user experience and the editors&#8217; functionality: <a href="<%= Url.Action("example/autocomplete") %>">Autocomplete</a>, 
            <a href="<%= Url.Action("example/searchandreplace") %>">Search & Replace</a>, <a href="<%= Url.Action("example/movecursor") %>">Move cursor</a>, 
            <a href="<%= Url.Action("example/extendedcomments") %>">Extended comments</a>;</li>
        <li>automate tasks in documents with <a href="<%= Url.Action("macros") %>">Macros</a>.</li>
    </ul>
    <p>Code samples are available at <a href="https://github.com/ONLYOFFICE/sdkjs-plugins" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins</a>.</p>
    <p>If you are looking for ready-to-use plugins, please visit <a href="https://www.onlyoffice.com/en/app-directory" target="_blank">ONLYOFFICE App Directory</a>.</p>


    <h2>How to create plugins</h2>

    <p>To create your own plugin, you need to follow a few steps:</p>
    <ol>
        <li>Learn the fundamental concepts for building plugins on the <a href="<%= Url.Action("gettingstarted") %>">Getting started with plugins</a> page 
            and write code that defines the plugin appearance and behavior.</li>
        <li>After building the plugin, test it thoroughly and make sure the plugin looks and works as you expected. 
            Try to anticipate the problems that might occur and suggest your solutions to them.</li>
        <li>Now you can use the plugin on your own or suggest it for publishing by contacting us at <a href="mailto:marketing@onlyoffice.com" target="_blank">marketing@onlyoffice.com</a>.</li>
    </ol>


    <h2>How to get help</h2>

    <p>If you have any questions about plugins, try to find them in the <a href="<%= Url.Action("faq") %>">FAQ</a> section first.</p>
    <p>You can request a feature or report a bug by posting an issue on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
    <p>You can also ask our developers on <a href="https://forum.onlyoffice.com/c/plugins/38" target="_blank">ONLYOFFICE forum</a> (registration required).</p>

</asp:Content>
