<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Adding plugins
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Adding plugins</span>
    </h1>

    <p class="dscr"><b>ONLYOFFICE Desktop Editors</b> allows developers to add specific features which are not directly related to the OOXML format using plugins. 
        You can use ready-made plugins from <a href="https://www.onlyoffice.com/en/app-directory" target="_blank">ONLYOFFICE App Directory</a> 
        or create your own ones using our <a href="<%= Url.Action("structure", "plugin") %>">Plugins and macros API documentation</a>.</p>


    <p>There are two ways to add plugins: through the plugin manager and through the plugin folder.</p>
    
    
    <h2>Adding plugins through the plugin manager</h2>

    <p>Starting from version 7.4, you can download ready-to-use plugins from <b>ONLYOFFICE Plugin Marketplace</b>.</p>

    <p><b>Option 1. Using the <b>Install</b> button (an internet connection is required)</b></p>
    <p>Follow the steps below to add the plugins to the editor using plugin manager:</p>
    <ol>
        <li>Open the <b>Plugins</b> tab.</li>
        <li>Click <b>Plugin Manager</b>.</li>
        <li>Find the plugin you need and click <b>Install</b>.</li>
    </ol>
    <p><img class="screenshot max-width-832" alt="Plugins manager" src="<%= Url.Content("~/content/img/plugins/desktop-plugin-manager.png") %>" /></p>

    <p><b>Option 2. Uploading the plugin archive (an internet connection is not required)</b></p>
    <p>If you want to add your own plugin, you can do it manually, even if you are offline:</p>
    <ol>
        <li>
            <p>Pack all the <a href="<%= Url.Action("structure", "plugin") %>">plugin files</a> within the plugin folder into a <b>zip</b> archive and change its extension to <em>.plugin</em>
        (all the plugin files and subfolders must be at the archive root).</p>
            <note>If you download a plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins" target="_blank">GitHub</a>, unpack the plugin folder first and then archive its elements only.</note>
        </li>
        <li>Open the <b>Plugin Manager</b> on the <b>Plugins</b> tab.</li>
        <li>Go to the <b>My plugins</b> tab and click the <b>Install plugin manually</b> button.</li>
        <li>Choose your created archive and click <b>Open</b>.</li>
    </ol>
    <img alt="Install plugin manually" class="screenshot" src="<%= Url.Content("~/content/img/plugins/install-manually.png") %>" />

    <p>The plugin will be added to the opened editors and all the editors you will open afterwords and displayed within the <b>Plugins</b> tab.</p>


    <h2>Adding plugins through the plugin folder </h2>
    <p><b>Step 1.</b> Create a new folder in the <em>sdkjs-plugins</em> directory. The path to the folder depends on the operating system you use:</p>
    <ul style="list-style: none;">
        <li>For Linux - <em>/opt/onlyoffice/desktopeditors/editors/sdkjs-plugins/</em></li>
        <li>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DesktopEditors\sdkjs-plugins\</em></li>
        <li>For Mac OS - <em>/Applications/ONLYOFFICE.app/Contents/Resources/editors/sdkjs-plugins/</em></li>
    </ul>

    <p><b>Step 2.</b> Use a plugin <b>GUID</b> as the folder name. You can find the plugin GUID in the <em>config.json</em> file.</p>
    <p>For example, for the <b>Extended comments</b> plugin the <em>guid</em> parameter will look the following way:</p>
    <pre>
{
    "name" : "Extended comments",
    "guid" : "asc.{91EAC419-EF8B-440C-A960-B451C7DF3A37}",
    ...
}
</pre>
    <p>So, the folder name of this plugin will be <em>{91EAC419-EF8B-440C-A960-B451C7DF3A37}</em>.</p>
    
    <p><b>Step 3.</b> Put all the plugin files to this folder:</p>
    <img class="screenshot max-width-832" alt="Plugin folder" src="<%= Url.Content("~/content/img/desktop/plugins_folder.png") %>" />
    
    <p><b>Step 4.</b> Start ONLYOFFICE Desktop Editors. If everything is done correctly, the plugin will be displayed within the <b>Plugins</b> tab:</p>
    <img class="screenshot max-width-832" alt="Extended comments" src="<%= Url.Content("~/content/img/desktop/extended_comments.png") %>" />
    

    <h2>Removing plugins from ONLYOFFICE Desktop Editors</h2>

    <p>To uninstall the newly added plugins, proceed in the following way:</p>
    <ol>
        <li>Open the <b>Plugins</b> tab.</li>
        <li>Go to <b>Plugin Manager</b>.</li>
        <li>Click the <b>Remove</b> button under the corresponding plugin.</li>
    </ol>
    <note>This option is not available for the default plugins and the plugins added via the plugin folder.</note>

    <p>If you need to uninstall the default plugins, go to the <em>sdkjs-plugins</em> folder and remove the corresponding plugin folder from this directory.</p>
    <note>Please note that removing the default plugins from ONLYOFFICE Desktop Editors on Mac OS breaks the package integrity and may cause the application crash. Be careful and don't do this unless absolutely necessary.</note>
    <p>The table below contains default plugins guids to make it easier for you to find them:</p>
            
    <h2>Default plugins guid&#8217;s</h2>
    <table class="try-now-table">
        <tbody>
            <tr>
                <td>Highlight code</td>
                <td>{BE5CBF95-C0AD-4842-B157-AC40FEDD9841}</td>
            </tr>
            <tr>
                <td>Mendeley</td>
                <td>{BE5CBF95-C0AD-4842-B157-AC40FEDD9441}</td>
            </tr>
            <tr>
                <td>OCR</td>
                <td>{440EBF13-9B19-4BD8-8621-05200E58140B}</td>
            </tr>
            <tr>
                <td>Photo editor</td>
                <td>{07FD8DFA-DFE0-4089-AL24-0730933CC80A}</td>
            </tr>
            <tr>
                <td>Speech</td>
                <td>{D71C2EF0-F15B-47C7-80E9-86D671F9C595}</td>
            </tr>
            <tr>
                <td>Thesaurus</td>
                <td>{BE5CBF95-C0AD-4842-B157-AC40FEDD9840}</td>
            </tr>
            <tr>
                <td>Translator</td>
                <td>{7327FC95-16DA-41D9-9AF2-0E7F449F6800}</td>
            </tr>
            <tr>
                <td>YouTube</td>
                <td>{38E022EA-AD92-45FC-B22B-49DF39746DB4}</td>
            </tr>
            <tr>
                <td>Zotero</td>
                <td>{BFC5D5C6-89DE-4168-9565-ABD8D1E48711}</td>
            </tr>
            <tr>
                <td>Send</td>
                <td>{B509123E-6335-40BD-B965-91EB799346E3}</td>
            </tr>
        </tbody>
    </table>
    <note>Please note that after app updating the default plugins will appear again and you will need to uninstall them.</note>

</asp:Content>
