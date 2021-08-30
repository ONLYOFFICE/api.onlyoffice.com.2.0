<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Creating connectors
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Creating connectors</span>
    </h1>

    <p class="dscr">
        ONLYOFFICE Docs can be integrated into some of the existing document management systems using plugins.
        These plugins will add the document editing features into the document management system you use quickly and easily without having to write your own code.
    </p>

    <p>Currently, the following plugins are available:</p>
    <ul>
        <li><a href="<%= Url.Action("alfresco") %>">ONLYOFFICE Alfresco module package</a></li>
        <li><a href="<%= Url.Action("chamilo") %>">Chamilo ONLYOFFICE integration plugin</a></li>
        <li><a href="<%= Url.Action("confluence") %>">Confluence ONLYOFFICE integration app</a></li>
        <li><a href="<%= Url.Action("HumHub") %>">HumHub ONLYOFFICE connector</a></li>
        <li><a href="<%= Url.Action("liferay") %>">Liferay ONLYOFFICE connector</a></li>
        <li><a href="<%= Url.Action("nextcloud") %>">Nextcloud ONLYOFFICE integration app</a></li>
        <li><a href="<%= Url.Action("nuxeo") %>">Nuxeo ONLYOFFICE integration plugin</a></li>
        <li><a href="<%= Url.Action("owncloud") %>">ownCloud ONLYOFFICE integration app</a></li>
        <li><a href="<%= Url.Action("plone") %>">Plone ONLYOFFICE integration plugin</a></li>
        <li><a href="<%= Url.Action("sharepoint") %>">SharePoint ONLYOFFICE integration solution</a></li>
    </ul>

    <br />
    <p>
        If you have any further questions, please contact us at
        <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com</a>.
    </p>

</asp:Content>
