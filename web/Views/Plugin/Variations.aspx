<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plugin variations
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Plugin variations</span>
    </h1>

    <p class="dscr">Plugin variations - subplugins that are created inside the origin plugin for the following purposes:</p>
    <ul>
        <li>to perform the main plugin actions;</li>
        <li>to contain plugin settings;</li>
        <li>to display an <b>About</b> window, etc.</li>
    </ul>

    <p>Let&#8217;s have a look at the <b>Translation</b> plugin. The plugin itself does not need a visual window for translation as it can be done just pressing a single button, 
        but its settings (the translation direction) and an <b>About</b> window must be visual. So we will need to have at least two plugin variations (translation itself and settings), 
        or three, in case we want to add an <b>About</b> window with the information about the plugin and its authors or the software used for the plugin creation.</p>

    <p>To create plugin variations, you need to specify its parameters in the <a href="<%= Url.Action("config") %>#variations">config.json</a> file 
        and build the <a href="<%= Url.Action("indexhtml") %>">index.html</a> files for each variation.</p>

    <note>The <em>.html</em> files for <b>all</b> variations must be placed to the plugin root folder together with the <em>config.json</em> configuration file for the plugin to work correctly.</note>

</asp:Content>
