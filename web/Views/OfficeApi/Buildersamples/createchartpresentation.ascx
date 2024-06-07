<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/OfficeApi/Buildersamples/samplegenerator.ascx" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Creating chart presentation</span>
</h1>
<p class="dscr">Create a chart presentation:</p>
<ul>
    <li>get the first slide in the current presentation (<a href="<%= Url.Action("presentationapi/api/getpresentation") %>">Api/GetPresentation</a>,
    <a href="<%= Url.Action("presentationapi/apipresentation/getslidebyindex") %>">ApiPresentation/GetSlideByIndex</a>);</li>
    <li>set the gradient background (<a href="<%= Url.Action("presentationapi/api/creategradientstop") %>">Api/CreateGradientStop</a>,
        <a href="<%= Url.Action("presentationapi/apislide/setbackground") %>">ApiSlide/SetBackground</a>);</li>
    <li>set the slide title and text in the specified style (<a href="<%= Url.Action("presentationapi/api/createshape") %>">Api/CreateShape</a>,
        <a href="<%= Url.Action("presentationapi/apirun/addtext") %>">ApiRun/AddText</a>,
        <a href="<%= Url.Action("presentationapi/apiparagraph/setjc") %>">ApiParagraph/SetJc</a>,
        <a href="<%= Url.Action("presentationapi/apitextpr/setfill") %>">ApiTextPr/SetFill</a>, <a href="<%= Url.Action("presentationapi/apitextpr/setfontfamily") %>">ApiTextPr/SetFontFamily</a>,
        <a href="<%= Url.Action("presentationapi/apitextpr/setfontsize") %>">ApiTextPr/SetFontSize</a>, <a href="<%= Url.Action("presentationapi/apishape/getdoccontent") %>">ApiShape/GetDocContent</a>, <a href="<%= Url.Action("presentationapi/apislide/addobject") %>">ApiSlide/AddObject</a>);</li>
    <li>create a chart and add it to the specified slide (<a href="<%= Url.Action("presentationapi/api/createchart") %>">Api/CreateChart</a>, <a href="<%= Url.Action("presentationapi/apislide/addobject") %>">ApiSlide/AddObject</a>)</li>
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
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("createchartpresentation"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Chart presentation" documentType="slide" ext="pptx" zoom="40" />
</div>
