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
        <a href="<%= Url.Action("getdocs") %>">ONLYOFFICE Docs</a> is an open source office suite that contains editors for text documents, spreadsheets and presentations. 
        It provides the following functions:
    </p>
    <ul>
        <li>text document, spreadsheet and presentation creating, editing and viewing;</li>
        <li>collaboration on files with other teammates in real time.</li>
    </ul>

    <p>
        ONLYOFFICE allows you to connect online document editors to any existing cloud service using one of the following ways:
    </p>
    <ul>
        <li><a href="<%= Url.Action("plugins") %>">Connectors</a>. In this case, ONLYOFFICE editors will be available right in the DMS.</li>
        <li><a href="<%= Url.Action("wopi") %>">WOPI protocol</a>. In this case, an iframe for the editing UI and the documents itself will be presented.</li>
    </ul>

</asp:Content>
