<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Frontend frameworks
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Frontend frameworks</span>
    </h1>

    <p class="dscr">
        ONLYOFFICE Docs can be integrated with some of the existing frontend frameworks using components.
        These components provide ready-to-use code modules, standardized frontend technologies, and reusable interface blocks making the process of building user interfaces faster and easier.
    </p>

    <p>Currently, the following frameworks are available:</p>
    <ul>
        <li><a href="<%= Url.Action("angular") %>">Angular</a></li>
        <li><a href="<%= Url.Action("react") %>">React</a></li>
        <li><a href="<%= Url.Action("vue") %>">Vue</a></li>
    </ul>

    <br />
    <p>If you have any further questions, please contact us at <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com</a>.</p>

</asp:Content>
