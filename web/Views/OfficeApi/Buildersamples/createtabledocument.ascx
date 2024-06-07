<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/OfficeApi/Buildersamples/samplegenerator.ascx" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Creating table document</span>
</h1>
<p class="dscr">Create a document with a styled table filled with array-based values:</p>
<ul>
    <li>create an empty document with a table (<a href="<%= Url.Action("textdocumentapi/api") %>">Api</a>, <a href="<%= Url.Action("textdocumentapi/api/createtable") %>">ApiDocument/CreateTable</a>)</li>
    <li>create a custom style for the table (<a href="<%= Url.Action("textdocumentapi/apidocument/getstyle") %>">ApiDocument/GetStyle</a>, <a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>,
        <a href="<%= Url.Action("textdocumentapi/apitablecellpr") %>">ApiTableCellPr</a>, <a href="<%= Url.Action("textdocumentapi/apitablerow") %>">ApiTableRow</a>);</li>
    <li>populate the table with the array-based data cell by cell (<a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>).</li>
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
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("createtabledocument"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Table" runScript="true" documentType="word" ext="docx" zoom="90" />
</div>
