<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/OfficeApi/Buildersamples/samplegenerator.ascx" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Adding watermark</span>
</h1>
<p class="dscr">Create a document with a watermark with custom settings:</p>
<ul>
    <li>create an empty page with a watermark (<a href="<%= Url.Action("textdocumentapi/api") %>">Api</a>,
    <a href="<%= Url.Action("textdocumentapi/apidocument/insertwatermark") %>">ApiDocument/InsertWatermark</a>);</li>
    <li>edit watermark settings, set an image, specify size, direction and opacity (<a href="<%= Url.Action("textdocumentapi/apiwatermarksettings") %>">ApiWatermarkSettings</a>);</li>
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
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("addwatermark"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Watermark" runScript="true" documentType="word" ext="docx" zoom="50" />
</div>
