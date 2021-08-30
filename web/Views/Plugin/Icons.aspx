<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plugin icons
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Plugin icons</span>
    </h1>

    <p class="dscr">Plugin icon image files that are specified in the <a href="<%= Url.Action("config") %>#icons">config.json</a> file to display plugins 
        on the <b>Plugins</b> tab or in the plugin <b>Settings</b> window. Here you can find all the available plugin icon parameters.</p>


    <h2 id="scaling" class="copy-link">Scaling</h2>

    <p>There are three scaling types of plugin icons: 100%, 150% and 200%. For each type the icon has its <em>normal</em> state:</p>

    <pre>
"icons": [
    {
        "100%": { "normal": "icon.png" },
        "150%": { "normal": "icon@1.5x.png" },
        "200%": { "normal": "icon@2x.png" }
    }
]
</pre>

    <p>The document editor chooses the necessary icons in the following way:</p>
    <ol>
        <li>get the information about the current scaling and find an icon for it;</li>
        <li>if there is no such an icon in the <em>config</em>, take the one which is the closest to the required size and round it up (150% instead of 140%).</li>
    </ol>


    <h2 id="style" class="copy-link">Style</h2>

    <p>The <em>style</em> parameter is also used to specify the icon appearance:</p>

    <table class="table">
        <colgroup>
            <col style="width: 220px;" />
            <col />
            <col style="width: 100px;" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
                <td>Default</td>
            </tr>
        </thead>
        <tbody>
            <tr id="style" class="tablerow">
                <td>style</td>
                <td>The theme type of the plugin icons. It can have the <em>light</em> or <em>dark</em> values.</td>
                <td>string</td>
                <td>"dark"</td>
            </tr>
        </tbody>
    </table>
    <pre>
"icons": [
    {
        "style" : "dark"
    }
]
</pre>

    <note>This parameter is only used when the icons are different in light and dark themes.</note>

</asp:Content>
