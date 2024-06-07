<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/OfficeApi/Buildersamples/samplegenerator.ascx" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Creating basic form</span>
</h1>
<p class="dscr">Create a basic form with the image and text inputs:</p>
<ul>
    <li>create a new document, add text to the first paragraph and style it as heading (<a href="<%= Url.Action("textdocumentapi/apidocument") %>">ApiDocument</a>, 
        <a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>, <a href="<%= Url.Action("textdocumentapi/apiparagraph") %>">ApiParagraph</a>);</li>
    <li>create an image form and a text form, and add the form to the document (<a href="<%= Url.Action("formapi/api/createpictureform") %>">Api/CreatePictureForm</a>,
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
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("createbasicform"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="PassCard" documentType="word" ext="docx" />
</div>
