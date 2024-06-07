<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/OfficeApi/Buildersamples/samplegenerator.ascx" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Creating mail merge receptions</span>
</h1>
<p class="dscr">Run the mail merge process for the current document:</p>
<ul>
    <li>load mail merge data from the opened <em>xlsx</em> file to the current document (<a href="<%= Url.Action("spreadsheetapi/api/getmailmergedata") %>">Api/GetMailMergeData</a>,
    <a href="<%= Url.Action("textdocumentapi/api/loadmailmergedata") %>">Api/LoadMailMergeData</a>);</li>
    <li>run the mail merge process for the current document (<a href="<%= Url.Action("textdocumentapi/api/mailmerge") %>">Api/MailMerge</a>).</li>
</ul>
<br />
<textarea disabled="disabled" id="builderScript" name="builderScript" data-easy="true" class="docbuilder-script" spellcheck="false"></textarea>

<h2>Resulting document</h2>

<div id="editorSpace">
    <div id="placeholder"></div>
</div>
<script>
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("mailmergereceptions"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Mail merge result" runScript="false" documentType="word" ext="docx" template="mail_merge_result" />
</div>
