<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/OfficeApi/Buildersamples/samplegenerator.ascx" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Creating advanced form</span>
</h1>
<p class="dscr">Create an advanced form with a table structure:</p>
<ul>
   <li>create a new document, create tables for the text and form inputs (<a href="<%= Url.Action("textdocumentapi/api/createparagraph") %>">Api/CreateParagraph</a>,
        <a href="<%= Url.Action("textdocumentapi/api/createtable") %>">Api/CreateTable</a>, <a href="<%= Url.Action("textdocumentapi/apidocument/push") %>">ApiDocument/Push</a>,
        <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getelement") %>">ApiDocumentContent/GetElement</a>, <a href="<%= Url.Action("textdocumentapi/apiparagraph/addtext") %>">ApiParagraph/AddText</a>,
        <a href="<%= Url.Action("textdocumentapi/apitable/getrow") %>">ApiTable/GetRow</a>,
        <a href="<%= Url.Action("textdocumentapi/apitablecell/getcontent") %>">ApiTableCell/GetContent</a>, <a href="<%= Url.Action("textdocumentapi/apitable/getcell") %>">ApiTable/GetCell</a>);</li>
    <li>style tables (<a href="<%= Url.Action("textdocumentapi/apitable/settablebordertop") %>">ApiTable/SetTableBorderTop</a>, <a href="<%= Url.Action("textdocumentapi/apitable/settableborderbottom") %>">ApiTable/SetTableBorderBottom</a>,
        <a href="<%= Url.Action("textdocumentapi/apitable/settableborderleft") %>">ApiTable/SetTableBorderLeft</a>, <a href="<%= Url.Action("textdocumentapi/apitable/settableborderright") %>">ApiTable/SetTableBorderRight</a>,
        <a href="<%= Url.Action("textdocumentapi/apitable/setwidth") %>">ApiTable/SetWidth</a>, <a href="<%= Url.Action("textdocumentapi/apitablerow/setbackgroundcolor") %>">ApiTableRow/SetBackgroundColor</a>);</li>
    <li>create the text and image forms and add them to the tables (<a href="<%= Url.Action("formapi/api/createpictureform") %>">Api/CreatePictureForm</a>,
    <a href="<%= Url.Action("formapi/api/createtextform") %>">Api/CreateTextForm</a>).</li>
</ul>

<p>This sample is available for the <b>C++ and .Net DocBuilder Frameworks</b>.<br />Download the sample and get more information on the <a href="<%= Url.Action("builderframeworksamples", "docbuilder") %>">Builder framework samples</a> page.</p>

<textarea id="builderScript" name="builderScript" data-easy="true" class="docbuilder-script" spellcheck="false"></textarea>

<ul class="list-buttons doc-builder-list-buttons">
    <li>
        <a id="startButton" class="button red">Start script</a>
    </li>
    <li>
        <a id="clearButton" class="button">Clear</a>
    </li>
</ul>

<h2>Resulting document</h2>

<div id="editorSpace">
    <div id="placeholder"></div>
</div>
<script>
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("createadvancedform"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Purchase order" documentType="word" ext="docx" zoom="80" />
</div>
