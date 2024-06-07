<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/OfficeApi/Buildersamples/samplegenerator.ascx" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Filling form</span>
</h1>
<p class="dscr">Fill a form with the data stored in the object:</p>
<ul>
    <li>open an existing form document and get all forms (<a href="<%= Url.Action("textdocumentapi/apidocument/getallforms") %>">ApiDocument/GetAllForms</a>);</li>
    <li>run a loop for each form, check the form type and set the data corresponding to the form key (<a href="<%= Url.Action("textdocumentapi/apiformbase/getformtype") %>">ApiFormBase/GetFormType</a>, 
        <a href="<%= Url.Action("textdocumentapi/apiformbase/getformkey") %>">ApiFormBase/GetFormKey</a>, <a href="<%= Url.Action("textdocumentapi/apipictureform/setimage") %>">ApiPictureForm/SetImage</a>, <a href="<%= Url.Action("textdocumentapi/apicomboboxform/settext") %>">ApiComboBoxForm/SetText</a>)</li>
</ul>

<p>Check <a href="<%= Url.Action("howitworks/globalvariable", "docbuilder") %>">Exchanging data among files</a> and <a href="<%= Url.Action("integrationapi/arguments", "docbuilder") %>">Using command line arguments</a> to learn more options for passing external data in the DocBuilder script.</p>
<p>This sample is available for the <b>C++ and .Net DocBuilder Frameworks</b>.<br />Download the sample and get more information on the <a href="<%= Url.Action("builderframeworksamples", "docbuilder") %>">Builder framework samples</a> page.</p>

<textarea disabled="disabled" id="builderScript" name="builderScript" data-easy="true" class="docbuilder-script" spellcheck="false"></textarea>

<h2>Resulting document</h2>

<div id="editorSpace">
    <div id="placeholder"></div>
</div>
<script>
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("fillform"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Filled form" documentType="word" ext="docxf" runScript="false" template="filled_form" zoom="80" />
</div>
