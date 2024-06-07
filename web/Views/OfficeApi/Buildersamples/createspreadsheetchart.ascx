<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/OfficeApi/Buildersamples/samplegenerator.ascx" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Creating spreadsheet chart</span>
</h1>
<p>Creates a custom chart filled with array-based values in the spreadsheet:</p>

<ul>
    <li>create a spreadsheet and fill top cells with data (<a href="<%= Url.Action("spreadsheetapi/apirange/setvalue") %>">ApiRange/SetValue</a>);</li>
    <li>create a chart using the data (<a href="<%= Url.Action("spreadsheetapi/apiworksheet/addchart") %>">ApiWorksheet/AddChart</a>);</li>
    <li>customize the chart (<a href="<%= Url.Action("spreadsheetapi/apichart/settitle") %>">ApiChart/SetTitle</a>, <a href="<%= Url.Action("spreadsheetapi/apichart/setlegendpos") %>">ApiChart/SetLegendPos</a>);</li>
</ul>

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
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("createspreadsheetchart"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Chart" documentType="cell" ext="xlsx" />
</div>
