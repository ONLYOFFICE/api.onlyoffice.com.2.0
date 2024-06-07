<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/OfficeApi/Buildersamples/samplegenerator.ascx" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Creating formal document</span>
</h1>
<p>Create a document following the structure of a formal paper:</p>
<ul>
    <li>create a title page with a document heading and subtitle (<a href="<%= Url.Action("textdocumentapi/api") %>">Api</a>,
        <a href="<%= Url.Action("textdocumentapi/apidocumentcontent") %>">ApiDocumentContent</a>, <a href="<%= Url.Action("textdocumentapi/apidrawing") %>">ApiDrawing</a>);</li>
    <li>create different styles for the document text, heading, subtitle, table, footer (<a href="<%= Url.Action("textdocumentapi/apiparapr") %>">ApiParaPr</a>,
        <a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>, <a href="<%= Url.Action("textdocumentapi/apitable") %>">ApiTable</a>,
        <a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>, <a href="<%= Url.Action("textdocumentapi/apitablepr") %>">ApiTablePr</a>,
        <a href="<%= Url.Action("textdocumentapi/apitablerow") %>">ApiTableRow</a>, <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>);</li>
    <li>structure the document by marking up its section: set columns for text and pictures, set page size and margins, create header and footer
        (<a href="<%= Url.Action("textdocumentapi/apidocument") %>">ApiDocument</a>, <a href="<%= Url.Action("textdocumentapi/apisection") %>">ApiSection</a>);</li>
    <li>fill the document with text, dividing it into separate fragments and highlighting them with headings
        (<a href="<%= Url.Action("textdocumentapi/apiparagraph") %>">ApiParagraph</a>, <a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>);</li>
    <li>add images and charts to represent document text (<a href="<%= Url.Action("textdocumentapi/api") %>">Api</a>,
        <a href="<%= Url.Action("textdocumentapi/apichart") %>">ApiChart</a>).</li>
</ul>
<br />

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
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("createformaldocument"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Formal document" documentType="word" ext="docx" zoom="60" />
</div>
