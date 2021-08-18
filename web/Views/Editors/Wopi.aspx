<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Using WOPI
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Using WOPI</span>
    </h1>

    <p class="dscr">
        Starting from version 6.4, ONLYOFFICE Docs offers support for the <b>Web Application Open Platform Interface Protocol (WOPI)</b> - a REST-based protocol 
        that is used to integrate your application with an online office. WOPI operations allow you to open files stored on a server, edit and save them. 
    </p>
    <p>This documentation describes:</p>
    <ul>
        <li>file properties that can be specified via <a href="<%= Url.Action("discovery") %>">WOPI discovery</a>;</li>
        <li>supported <a href="<%= Url.Action("restapi") %>">WOPI REST API</a> functions;</li>
        <li>available messages that can be posted via <a href="<%= Url.Action("postmessage") %>">PostMessage</a>;</li>
        <li><a href="<%= Url.Action("wopiconfig") %>">configuration</a> file parameters that can be changed by the integrator using the WOPI protocol.</li>
    </ul>

    <p>For further information on the WOPI protocol, please read the <a href="https://wopi.readthedocs.io/en/latest/" target="_blank">WOPI documentation</a>.</p>

</asp:Content>
