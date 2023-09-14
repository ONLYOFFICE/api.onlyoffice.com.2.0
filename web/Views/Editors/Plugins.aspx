<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ready-to-use connectors
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Ready-to-use connectors</span>
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
        <li><a href="<%= Url.Action("drupal") %>">Drupal ONLYOFFICE connector module</a></li>
        <li><a href="<%= Url.Action("humhub") %>">HumHub ONLYOFFICE connector</a></li>
        <li><a href="<%= Url.Action("jira") %>">Jira ONLYOFFICE integration app</a></li>
        <li><a href="<%= Url.Action("liferay") %>">ONLYOFFICE Connector for Liferay</a></li>
        <li><a href="<%= Url.Action("mattermost") %>">Mattermost ONLYOFFICE integration plugin</a></li>
        <li><a href="<%= Url.Action("moodle") %>">Moodle ONLYOFFICE integration plugin</a></li>
        <li><a href="<%= Url.Action("nextcloud") %>">Nextcloud ONLYOFFICE integration app</a></li>
        <li><a href="<%= Url.Action("nuxeo") %>">Nuxeo ONLYOFFICE integration plugin</a></li>
        <li><a href="<%= Url.Action("odoo") %>">Odoo ONLYOFFICE integration app</a></li>
        <li><a href="<%= Url.Action("owncloud") %>">ownCloud ONLYOFFICE integration app</a></li>
        <li><a href="<%= Url.Action("plone") %>">Plone ONLYOFFICE integration plugin</a></li>
        <li><a href="<%= Url.Action("redmine") %>">Redmine ONLYOFFICE integration plugin</a></li>
        <li><a href="<%= Url.Action("sharepoint") %>">SharePoint ONLYOFFICE integration solution</a></li>
        <li><a href="<%= Url.Action("strapi") %>">Strapi ONLYOFFICE integration plugin</a></li>
        <li><a href="<%= Url.Action("suitecrm") %>">SuiteCRM ONLYOFFICE integration plugin</a></li>
        <li><a href="<%= Url.Action("wordpress") %>">WordPress ONLYOFFICE integration plugin</a></li>
    </ul>

    <br />
    <p>
        If you have any further questions, please contact us at
        <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com</a>.
    </p>

</asp:Content>
