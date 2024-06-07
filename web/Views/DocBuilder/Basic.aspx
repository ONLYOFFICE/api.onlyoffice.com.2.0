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

    <div class="pvl_wrapper">
        <span class="pvl_product">ONLYOFFICE Document Builder</span><span class="pvl_version">v<%= Products.Get("docbuilder").Version %></span>
    </div>

    <p><b>ONLYOFFICE Document Builder</b> is a C++ library used to create and edit Office Open XML format files (documents, spreadsheets and presentations)
        and save them to DOCX, XSLX, PPTX and PDF formats.</p>
    <p>It allows you to build a document easily without the need to actually run a document processing editor.
        It also allows the developers to automate document building using the templates you create or inserting the data from some database of yours into a document
        or a set of documents. It has all the features of a common document editor but is lightweight and can be easily integrated
        into your document management system, CRM system, etc. using its <a href="<%= Url.Action("basic", "officeapi") %>">JavaScript API</a>.
    </p>

    <h2>How to use</h2>
    <p>There are two ways to use ONLYOFFICE Document Builder in your own project:</p>
    <ol>
        <li><p>Integrate this library into your own application. To get ONLYOFFICE Document Builder, visit <a href="<%= Url.Action("getbuilder") %>">this page</a>.</p>
            <p>After you download and unpack the files, the library is ready for <a href="<%= Url.Action("framework") %>">integration</a>.</p>
        </li>
        <li>Use <a href="<%= Url.Action("integrationapi/default") %>">Builder.App</a>, the provided executive binary wrapper for an easy start.
            The latest versions of executable files can always be downloaded <a target="_blank" href="https://www.onlyoffice.com/document-builder.aspx?from=api">here</a>.
            After the file download, run it and see the examples of how ONLYOFFICE Document Builder can be used without the need to write any application.</li>
    </ol>

    <h2 id="builder-components" class="copy-link">Document Builder components</h2>
    <p>ONLYOFFICE Document Builder consists of four components:</p>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Component</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("framework") %>">Builder.Framework</a></td>
                <td>A software tool that contains a collection of libraries, classes, and functions that are used to develop applications.
                    Currently, the following frameworks are available: <a href="<%= Url.Action("integrationapi/c") %>">C++</a>, <a href="<%= Url.Action("integrationapi/com") %>">COM</a>, <a href="<%= Url.Action("integrationapi/net") %>">.Net</a>.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/default") %>">Builder.App</a></td>
                <td>The <em>docbuilder.exe</em> executable file which can be run from your application with the <em>.docbuilder</em> script file as a parameter to it.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integratingdocumentbuilder") %>">Builder.Server</a></td>
                <td>The code for the sample of ONLYOFFICE Document Builder integration into your application</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>
    <br />

    <%
        Html.RenderPartial("DocBuilderShared/DocBuilderAction");
    %>

    <h2>Get help</h2>

    <p>If you have any questions or feature requests about ONLYOFFICE Document Builder, please visit <a href="https://github.com/ONLYOFFICE/DocumentBuilder/issues" target="_blank">GitHub</a>.</p>
    <p>You can also ask our developers on <a href="https://forum.onlyoffice.com/c/document-builder/37" target="_blank">ONLYOFFICE forum</a> (registration required).</p>

</asp:Content>
