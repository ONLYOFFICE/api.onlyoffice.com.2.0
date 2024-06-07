<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/OfficeApi/Buildersamples/samplegenerator.ascx" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Commenting spreadsheet errors</span>
</h1>
<p>This script checks all used cells for formula errors like "#DIV/0!" and comments each error:</p>

<ul>
    <li>open an existing spreadsheet file to check for errors;</li>
    <li>create a loop for columns and nest another loop for rows;</li>
    <li>get each cell (<a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrangebynumber") %>">ApiWorksheet/GetRangeByNumber</a>) and check the value for errors;</li>
    <li>comment the cell (<a href="<%= Url.Action("spreadsheetapi/apirange/addcomment") %>">ApiRange/AddComment</a>) if an error exists.</li>
</ul>

<p>This sample is available for the <b>C++ and .Net DocBuilder Frameworks</b>.<br />Download the sample and get more information on the <a href="<%= Url.Action("builderframeworksamples", "docbuilder") %>">Builder framework samples</a> page.</p>

<textarea disabled="disabled" id="builderScript" name="builderScript" data-easy="true" class="docbuilder-script" spellcheck="false"></textarea>

<h2>Resulting document</h2>

<div id="editorSpace">
    <div id="placeholder"></div>
</div>
<script>
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("commenterrors"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Data with comments" documentType="cell" ext="xlsx" template="data_with_errors" />
</div>
