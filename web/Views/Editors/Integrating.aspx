<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Overview
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Overview</span>
    </h1>

    <p class="dscr">
        <a href="<%= Url.Action("getdocs") %>">ONLYOFFICE Docs</a> is an open-source office suite that includes editors for text documents, spreadsheets and presentations. 
        It provides the following features:
    </p>
    <ul>
        <li>creating, editing and viewing text documents, spreadsheets and presentations;</li>
        <li>collaborating on files with other teammates in real time.</li>
    </ul>

    <p>
        ONLYOFFICE allows you to connect the online document editors to any existing cloud service using one of the following ways:
    </p>
    <ul>
        <li><a href="<%= Url.Action("plugins") %>">Connectors</a>. In this case, ONLYOFFICE editors will be available right in the DMS.</li>
        <li><a href="<%= Url.Action("wopi") %>">WOPI protocol</a>. In this case, an iframe for the editing UI and documents will be presented.</li>
    </ul>

</asp:Content>
