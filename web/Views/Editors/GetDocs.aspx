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
        <b>ONLYOFFICE Docs</b> is available for Windows, Linux and Docker.
    </p>

    <p>To install it on your local server, follow the instructions in <b>ONLYOFFICE Help Center</b>:</p>
    <ul class="list-buttons">
        <li><a class="button" href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api_csharp_example" target="_blank">Get ONLYOFFICE Docs for Windows</a></li>
        <li><a class="button" href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api_csharp_example" target="_blank">Get ONLYOFFICE Docs for Linux</a></li>
        <li><a class="button" href="https://helpcenter.onlyoffice.com/installation/docs-developer-install-docker.aspx?from=api_csharp_example" target="_blank">Get ONLYOFFICE Docs for Docker</a></li>
    </ul>

    <p>Before working with ONLYOFFICE Docs API documentation, it is recommended to make the following settings if necessary:</p>
    <ul>
        <li>switch ONLYOFFICE Docs to the HTTPS protocol for secure connection using <a href="https://helpcenter.onlyoffice.com/installation/docs-community-https-linux.aspx" target="_blank">SSL Certificates</a>;</li>
        <li>add additional <a href="https://helpcenter.onlyoffice.com/installation/docs-community-install-fonts-linux.aspx" target="_blank">fonts</a> to ONLYOFFICE Docs to enhance the work with the editors;</li>
        <li>download external themes for the application interface.</li>
    </ul>

</asp:Content>
