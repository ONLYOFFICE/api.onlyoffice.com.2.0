<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Overview
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Overview</span>
    </h1>

    <span class="pvl_product">ONLYOFFICE DocSpace</span><span class="pvl_version">v<%= Products.Get("docspace").Version %></span>

    <p class="dscr">
        <a href="https://www.onlyoffice.com/docspace.aspx" target="_blank">ONLYOFFICE DocSpace</a> is a collaborative cloud platform that allows users to edit and collaborate on documents, spreadsheets, presentations, and forms in customizable rooms.
        It provides the following features:
    </p>
    <ul>
        <li>creating and customizing rooms for collaboration;</li>
        <li>creating, editing and viewing text documents, spreadsheets, presentations, fillable forms, PDFs, ebooks, multimedia files;</li>
        <li>inviting users to collaborate on files with them in real time.</li>
    </ul>
    <p><b>ONLYOFFICE DocSpace API</b> is used to let the developers integrate ONLYOFFICE DocSpace into their own web applications,
        allowing users to create and submit documents directly from their websites.</p>

    <p>This documentation contains:</p>
    <ul>
        <li><a href="<%= Url.Action("jssdk/") %>">JavaScript SDK</a> which allows developers to connect DocSpace as a frame to their websites using <em>api.js</em>;</li>
        <li><a href="<%= Url.Action("backend/") %>">API Backend</a> which is implemented as REST over HTTP using GET/POST/PUT/DELETE and allows developers to interact with the backend of ONLYOFFICE DocSpace on-premises;</li>
        <li><a href="<%= Url.Action("apisystem/") %>">API System</a> which is implemented as REST over HTTP using GET/POST and allows developers to interact with ONLYOFFICE DocSpace hosted solution;</li>
        <li><a href="/docspace-storybook" target="_blank">Storybook</a> which is a JavaScript tool for developing DocSpace UI.</li>
    </ul>

    <h2>Get help</h2>

    <p>If you have any questions about ONLYOFFICE DocSpace, try the <a href="<%= Url.Action("faq") %>">FAQ</a> section first.</p>
    <p>You can request a feature or report a bug by posting an issue on <a href="https://github.com/ONLYOFFICE/DocSpace/issues" target="_blank">GitHub</a>.</p>
    <p>You can also ask our developers on <a href="https://forum.onlyoffice.com/" target="_blank">ONLYOFFICE forum</a> (registration required).</p>
</asp:Content>
