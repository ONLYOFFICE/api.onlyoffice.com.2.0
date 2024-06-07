<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/OfficeApi/Buildersamples/samplegenerator.ascx" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Filling spreadsheet</span>
</h1>
<p>Fill an empty spreadsheet with the data stored in arrays:</p>
<ul>
    <li>create a loop for columns and nest another loop for rows;</li>
    <li>get each cell (<a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrangebynumber") %>">ApiWorksheet/GetRangeByNumber</a>) and set the corresponding value from the data array (<a href="<%= Url.Action("spreadsheetapi/apirange/setvalue") %>">ApiRange/SetValue</a>).</li>
</ul>

<p>Check <a href="<%= Url.Action("howitworks/globalvariable", "docbuilder") %>">Exchanging data among files</a> and <a href="<%= Url.Action("integrationapi/arguments", "docbuilder") %>">Using command line arguments</a> to learn more options for passing external data in the DocBuilder script.</p>
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
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("fillspreadsheet"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Spreadsheet with data" documentType="cell" ext="xlsx" />
</div>
