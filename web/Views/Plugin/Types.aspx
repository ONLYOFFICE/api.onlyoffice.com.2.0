<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plugin types
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Plugin types</span>
    </h1>

    <p class="dscr">The following plugin types can be distinguished:</p>

    <ol>
        <li>
            <p><b>Visual/non-visual</b> (marked with the <em>isVisual</em> flag in the <em>config.json</em>):</p>
            <ul>
                <li>
                    <p><em>Visual plugins</em> (<em>"isVisual": true</em>) open a window or a panel for some action, like 
                        <a href="<%= Url.Action("example/highlightcode") %>">Highlight code</a>, 
                        <a href="<%= Url.Action("example/photoeditor") %>">Photo editor</a>, 
                        <a href="<%= Url.Action("example/ocr") %>">OCR</a>.</p>
                </li>
                <li>
                    <p><em>Non-visual plugins</em> (<em>"isVisual": false</em>) provide a button (or buttons) to apply some transformations or manipulations to the document, 
                        like <a href="<%= Url.Action("example/speech") %>">Speech</a>, 
                        <a href="<%= Url.Action("example/helloworld") %>">Hello world</a>.</p>
                </li>
                <li>
                    <p><em>An input helper</em> (<em>"events": ["onInputHelperClear", "onInputHelperInput"]</em>) plugin is a combo of both visual and non-visual plugins, 
                        like <a href="<%= Url.Action("example/autocomplete") %>">Autocomplete</a>. 
                        It has its own window that appears and disappears when you type text. Its location is tied to the cursor.</p>
                </li>
            </ul>
        </li>

        <li>
            <p><b>System/non-system</b> (marked with the <em>isSystem</em> flag in the <em>config.json</em>):</p>
            <ul>
                <li>
                    <p><em>Non-system plugins</em> (not marked in the <em>config.json</em>) start upon clicking the corresponding button, 
                        like <a href="<%= Url.Action("example/clippy") %>">Clippy</a>, 
                        <a href="<%= Url.Action("example/thesaurus") %>">Thesaurus</a>, 
                        <a href="<%= Url.Action("example/translator") %>">Translator</a>.</p>
                </li>
                <li>
                    <p><em>System plugins</em> (<em>"isSystem": true</em>) plugins work in the background as long as the editors are launched, 
                        like <a href="<%= Url.Action("example/settings") %>">Settings</a>, 
                        <a href="<%= Url.Action("example/searchandreplaceonstart") %>">Search and replace on start</a>. 
                        You don&#8217;t need to start them.</p>
                </li>
            </ul>
        </li>
        <li>
            <p><b>Editor enhancement/UI enhancement/third-party service plugins</b>:</p>
            <ul>
                <li>
                    <p><em>Editor enhancement plugins</em> extend the editor functionality and enhance the existing user experience, 
                        like <a href="<%= Url.Action("example/searchandreplace") %>">Search and replace</a>, 
                        <a href="<%= Url.Action("example/addcommentincell") %>">Add comment in cell</a>, 
                        <a href="<%= Url.Action("example/movecursor") %>">Move cursor</a>.</p>
                </li>
                <li>
                    <p><em>UI enhancement plugins</em> add custom components and controls to the UI, 
                        like <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/trackchanges" target="_blank">Trackchanges</a>, 
                        <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/trackchanges_off" target="_blank">Trackchanges off</a>.</p>
                </li>
                <li>
                    <p><em>Third-party service plugins</em> connect third-party services to the editors, 
                        like <a href="<%= Url.Action("example/typograf") %>">Typograf</a>, 
                        <a href="<%= Url.Action("example/zotero") %>">Zotero</a>, 
                        <a href="<%= Url.Action("example/telegram") %>">Telegram</a>.</p>
                </li>
            </ul>
        </li>

        <li>
            <p><b>OLE object</b> (marked as <em>"initDataType": "ole"</em> flag in the <em>config.json</em>):</p>
            <ul>
                <li>
                    <p>In addition to simple document manipulation or editing, the plugin can embed an <em>OLE object</em> which allows a third-party developer to access the document format, 
                        i.e. save information from external resources to the resulting file.</p>
                    <p>For example, the <a href="<%= Url.Action("example/youtube") %>">YouTube</a> plugin embeds YouTube videos into your document 
                        and the <a href="<%= Url.Action("example/chess") %>">Chess</a> plugin embeds a chess board.</p>
                </li>
            </ul>
        </li>   
    </ol>

</asp:Content>
