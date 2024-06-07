<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Getting started with macros
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Getting started with macros</span>
    </h1>

    <p class="dscr">Macros are small scripts used to facilitate your day-to-day routine work with different types of documents. 
        ONLYOFFICE macros use the JavaScript syntax and <a href="<%= Url.Action("basic", "officeapi") %>">Office JavaScript API</a> scripting notation.</p>

    <p>There are several reasons why ONLYOFFICE uses JavaScript for macros:</p>
    <ul>
        <li>cross-platform,</li>
        <li>easy to use,</li>
        <li>security, as macros do not have any access to the system. They are just JS code that runs in the same window with the editors.</li>
    </ul>

    <div class="note">Please note that starting from version 7.1, the access to the <em>window</em> and <em>document</em> objects and the <em>alert</em> function is restricted from the macros because the <em>"use strict"</em> mode was applied to the macro scripts.
        Don't forget to declare variables before using them so that the macros work correctly.</div>

    <p>You can find ready-to-use macros <a href="<%= Url.Action("macrosamples/") %>">here</a> or create your own ones.</p>

    <p>How to start writing your macro:</p>
    <ol>
        <li>Open the <b>Plugins</b> tab and click <b>Macros</b>.</li>
        <li>Click <b>New</b> in the appeared window.</li>
        <li>Consult the <a href="<%= Url.Action("basic", "officeapi") %>">API documentation</a> to write the script.</li>
        <li><a href="<%= Url.Action("writingmacros") %>">Write</a> code for your macro.</li>
        <li><b>Rename</b> your macro by clicking the corresponding button.</li>
        <li>When ready, click <b>Run</b> to run your code in the document.</li>
    </ol>
    <img class="screenshot max-width-832" alt="Macros window" src="<%= Url.Content("~/content/img/plugins/macro_window.png") %>" />

    <p>If you want to delete an unnecessary macro, click the <b>Delete</b> button.</p>

</asp:Content>
