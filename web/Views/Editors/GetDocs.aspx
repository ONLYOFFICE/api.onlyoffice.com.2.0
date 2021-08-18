<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Get ONLYOFFICE Docs
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Get ONLYOFFICE Docs</span>
    </h1>

    <p class="dscr">
        <b>ONLYOFFICE Docs Developer Edition</b> is available for Windows, Linux and Docker.
    </p>

    <p>To install it on your local computer, follow the instructions on <b>ONLYOFFICE Help Center</b>:</p>
    <ul class="list-buttons">
        <li><a class="button" href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api_csharp_example" target="_blank">Get ONLYOFFICE Docs for Windows</a></li>
        <li><a class="button" href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api_csharp_example" target="_blank">Get ONLYOFFICE Docs for Linux</a></li>
        <li><a class="button" href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-docker.aspx?from=api_csharp_example" target="_blank">Get ONLYOFFICE Docs for Docker</a></li>
    </ul>

</asp:Content>
