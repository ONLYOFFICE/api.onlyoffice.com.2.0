<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>
<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="FaqHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%= Scripts.Render("~/bundles/faq") %>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Frequently asked questions
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Frequently asked questions: Plugins and macros</span>
    </h1>

    <% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="plugins_1">
    <dt>How to install plugins to the ONLYOFFICE editors?</dt>
    <dd>
        <p>
            Some plugins are installed by default. Switch to the <b>Plugins</b> tab to see the available ones. 
            To install additional plugins, see the <a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a> or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.
        </p>
    </dd>
</dl>
<dl class="faq_block" id="plugins_2">
    <dt>How to adjust my plugin to the ONLYOFFICE style?</dt>
    <dd>
        <p>ONLYOFFICE offers its own style sheet in the <a href="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.css" target="_blank">plugin.css</a> file 
            connected to the <em>index.html</em> file. Detailed instructions on connecting ONLYOFFICE styles to the editors can be found <a href="<%= Url.Action("styles") %>">here</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="plugins_3">
    <dt>How to localize a plugin?</dt>
    <dd>
        <p>
            To localize a plugin, you need to do the following:
        </p>
        <ul>
            <li>Translate <em>config.json</em> sections.</li>
            <li>Localize <em>index.html</em> and plugin code files.</li>
            <li>Apply translations to plugin.</li>
        </ul>
        <p>
           Further information about the localization can be found <a href="<%= Url.Action("localization") %>">at this page</a>.
        </p>
    </dd>
</dl>
<dl class="faq_block" id="plugins_4">
    <dt>How can I create an About window for my plugin?</dt>
    <dd>
        <p>
            Use the <a href="<%= Url.Action("variations") %>">plugin variations</a> or <em>subplugins</em> to create an <b>About</b> window for your plugin or add extra plugin settings. 
            Have a look at the plugin example with two variations <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/helloworld" target="_blank">here</a>. 
            In addition to two variations in the config, you also need to create an additional <em>index_about.html</em> file.
        </p>
    </dd>
</dl>
<dl class="faq_block" id="plugins_5">
    <dt>Where to find the existing plugins available for integration?</dt>
    <dd>
        <p>All ready-to-use plugins are available in the <a href="https://www.onlyoffice.com/en/app-directory" target="_blank">ONLYOFFICE App Directory</a>.</p>
        <p>More plugin samples are listed <a href="https://github.com/ONLYOFFICE/sdkjs-plugins" target="_blank">on GitHub</a>. 
            Feel free to fork them and use them as examples to create your own plugin.</p>
    </dd>
</dl>
<dl class="faq_block" id="plugins_6">
    <dt>I packed the plugin folder to the archive, changed its extension to <em>.plugin</em> and added it to the editors. But it doesn&#8217;t work. What should I do?</dt>
    <dd>
        <p>Please make sure that your plugin archive <b>doesn&#8217;t</b> look the following way:</p>
        <img alt="Plugin archive" src="<%= Url.Content("~/content/img/plugins/plugin_archive.png") %>" />
        <p>All the plugin files and subfolders must be at the archive root. To do it, unpack the plugin folder first and then archive its elements only.</p>
    </dd>
</dl>
<dl class="faq_block" id="macros_1">
    <dt>Can I use Microsoft Office macros in ONLYOFFICE editors?</dt>
    <dd>
        <p>Microsoft Office macros use Visual Basic for Applications (VBA) scripting language, while ONLYOFFICE editors use JavaScript. 
            But this is not difficult to convert your previously used macros into the new format. 
            Some examples of converting MS VBA macros you can see <a href="<%= Url.Action("convertingvbamacros") %>">here</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="macros_2">
    <dt>Where can I find methods for writing macros?</dt>
    <dd>
        <p>Macros use JavaScript language syntax and <a href="<%= Url.Action("basic", "officeapi") %>">Office JavaScript API</a> scripting notation, 
            thus the methods available in JavaScript and all the methods supported by <b>Office API</b> are also supported by macros.</p>
    </dd>
</dl>
<dl class="faq_block" id="macros_3">
    <dt>Can I make a macro global?</dt>
    <dd>
        <p>Macros are attached to the specific documents and there is no possibility to make them global. 
            However, you can write a <a href="<%= Url.Action("structure") %>">plugin</a> that will be loaded for all the users.</p>
    </dd>
</dl>

</asp:Content>
