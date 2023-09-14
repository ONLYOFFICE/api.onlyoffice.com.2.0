<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Document Server FAQ: <br />
        Customizing questions</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="customizing_1">
    <dt>How to whitelabel ONLYOFFICE Document Server?</dt>
    <dd>
        <p>The below options can be edited for whitelabeling your version of Document Server, changing the information which will be displayed at the <b>About</b> page and visible to all editor users.</p>
        <div class="note">Please note that changing these options is only available to the <a target="_blank" href="https://www.onlyoffice.com/developer-edition-prices.aspx">ONLYOFFICE Developer Edition</a> users.</div>
        <ul>
            <li><em>editorConfig.customization.customer</em> options:
                <ul>
                    <li><em>editorConfig.customization.customer.address</em> is used to specify the postal address of the company or person;</li>
                    <li><em>editorConfig.customization.customer.info</em> is used to give some additional information about the company or person;</li>
                    <li><em>editorConfig.customization.customer.logo</em> is used to specify the path to the image logo;</li>
                    <li><em>editorConfig.customization.customer.logoDark</em> is used to specify the path to the image logo for the dark theme;</li>
                    <li><em>editorConfig.customization.customer.mail</em> is used to specify the email address of the company or person;</li>
                    <li><em>editorConfig.customization.customer.name</em> is used to specify the name of the company or person who gives access to the editors or the editor authors;</li>
                    <li><em>editorConfig.customization.customer.www</em> is used to specify the home website address of the company or person.</li>
                </ul>
            </li>
            <li><em>editorConfig.customization.logo</em> options:
                <ul>
                    <li><em>editorConfig.customization.logo.image</em> is used to specify the path to the image file used to show in the common work mode (i.e. in view and edit modes for all editors) or in the embedded mode;</li>
                    <li><em>editorConfig.customization.logo.imageDark</em> is used to specify the path to the image file used for the dark theme;</li>
                    <li><em>editorConfig.customization.logo.url</em> is used to specify the absolute URL which will be used when someone clicks the logo image (you can leave as an empty string or null to make the logo not clickable).</li>
                </ul>
            </li>
        </ul>
        <p>With all the above fields filled, the <em>customization</em> configuration will look like this:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "customization": {
            "customer": {
                "address": "My City, 123a-45",
                "info": "Some additional information",
                "logo": "https://example.com/logo-big.png",
                "logoDark": "https://example.com/dark-logo-big.png",
                "mail": "john@example.com",
                "name": "John Smith and Co.",
                "www": "example.com"
            },
            "logo": {
                "image": "https://example.com/logo.png",
                "imageDark": "https://example.com/dark-logo.png",
                "url": "https://example.com"
            },
            ...
        },
        ...
    },
    ...
});</pre>
        <p>Further information about the customization can be found <a href="<%= Url.Action("config/editor/customization") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="customizing_2">
    <dt>How to change the default language of the Document Server interface?</dt>
    <dd>
        <p>If the interface language is present in the <a target="_blank" href="https://helpcenter.onlyoffice.com/server/document/available-languages.aspx">list of available Document Server languages</a>, you can simply use the <em>editorConfig.lang</em> property in the configuration file to set it to the necessary locale, like this:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "lang": "de",
        ...
    },
    ...
});</pre>
        <p>If the language is not available and you want to translate it or have already translated it to your own language, please see <a target="_blank" href="https://helpcenter.onlyoffice.com/server/docker/document/add-interface-language.aspx">this article</a> to find out how to install it to your Document Server.</p>
        <p>Further information about the language settings can be found <a href="<%= Url.Action("config/editor") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="customizing_3">
    <dt>How to enable or disable the chat and/or the comments panel in the editors?</dt>
    <dd>
        <p>The chat and comments are enabled by default. To disable them use the <em>document.permissions.comment</em> and <em>document.permissions.chat</em> parameters with the values set to <b>false</b> in the configuration file respectively:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "chat": false,
            "comment": false,
            ...
        },
        ...
    },
    ...
});</pre>
        <p>This will disable both the <b>Chat</b> and <b>Comments</b> buttons and their functionality.</p>
        <p>Further information about the customization can be found <a href="<%= Url.Action("config/editor/customization") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="customizing_4">
    <dt>How to customize the editors interface, e.g. adjust the top toolbar view?</dt>
    <dd>
        <p>You can either display the full top toolbar or its compact version. To control this the <em>editorConfig.customization.compactToolbar</em> parameter is used. With the default <b>false</b> value the top toolbar will have its usual view. If you want to display its compact variant, the configuration will have to look like this:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "customization": {
            "compactToolbar": true,
            ...
        },
        ...
    },
    ...
});</pre>
        <p>Further information about the customization can be found <a href="<%= Url.Action("config/editor/customization") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="customizing_5">
    <dt>How to view and change the document additional parameters, e.g. its owner or uploading date?</dt>
    <dd>
        <p>The document owner and uploading date is affected by the <em>document.info.owner</em> and <em>document.info.uploaded</em> parameter respectively. You can pass these settings from some database of yours to the document configuration file the following way:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "info": {
            "owner": "John Smith",
            "uploaded": "2010-07-07 3:46 PM",
        },
        ...
    },
    ...
});</pre>
        <p>This values will be displayed in the <b>File</b> > <b>Document Info...</b> menu option.</p>
        <p>Further information about these settings can be found <a href="<%= Url.Action("config/document/info") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="customizing_6">
    <dt>How to optimize the appearance of editors for a desktop computer, or for a mobile device, or for embedding into a web page?</dt>
    <dd>
        <p>There are three main appearances of the editors, optimized for different use:</p>
        <ul>
            <li>
                <b>desktop</b>, which is optimized for the display in desktop computer browsers:
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "type": "desktop",
    ...
});</pre>
            </li>
            <li>
                <b>mobile</b>, which is optimized for the display in mobile device browsers:
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "type": "mobile",
    ...
});</pre>
            </li>
            <li>
                <b>embedded</b>, which is optimized for the embedding the documents into a website page:
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "type": "embedded",
    ...
});</pre>
            </li>
        </ul>
        <p>You can use any appearance for mobile devices or to embed the document to your webpage, but it is more logical to use the specific display type.</p>
        <p>Further information about the display type can be found <a href="<%= Url.Action("config") %>#type">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="customizing_7">
    <dt>How to connect plugins to Document Server so that they become visible for all editor users?</dt>
    <dd>
        <p>To enable plugins for all Document Server users, you need the following:</p>
        <ul>
            <li>Get the plugins (this can be done using our plugin repository on <a target="_blank" href="https://github.com/ONLYOFFICE/sdkjs-plugins">GitHub</a> or you can write your own plugin).</li>
            <li>Put the plugins to the folder accessible by Document Editor.</li>
            <li>Change the configuration file the following way:</li>
        </ul>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "plugins": {
             "autostart": [
                 "asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}",
                 "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
                 ...
             ],
             "pluginsData": [
                 "https://example.com/plugin1/config.json",
                 "https://example.com/plugin2/config.json",
                 ...
             ]
        },
        ...
    },
    ...
});</pre>
        <p>Where <em>editorConfig.plugins.autostart</em> is the array of the GUIDs for the plugins that you want to start automatically when Document Server is started (as defined in the plugin <a href="<%= Url.Action("config", "plugin") %>#guid">config.json</a> file), and <em>editorConfig.plugins.pluginsData</em> is the array of the <b>config.json</b> configuration files for all the plugins that you want to be available to Document Server users.</p>
        <p>Further information about enabling the plugins for Document Server can be found <a href="<%= Url.Action("config/editor/plugins") %>">at this page</a>.</p>
    </dd>
</dl>