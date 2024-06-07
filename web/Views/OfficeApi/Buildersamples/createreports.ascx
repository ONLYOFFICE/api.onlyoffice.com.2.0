<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>

<%@ Register TagPrefix="UserControl"
    TagName="Generator"
    Src="~/Views/OfficeApi/Buildersamples/samplegenerator.ascx" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Creating report document</span>
</h1>
<p class="dscr">Create reports on all the comments added to the document and on every change which was made to the document in the review mode:</p>
<ul>
    <li>open the created file (<a href="<%= Url.Action("textdocumentapi/api/getdocument") %>">Api/GetDocument</a>);</li>
    <li>get the comments and review reports and save them to the global variable (<a href="<%= Url.Action("textdocumentapi/apidocument/getcommentsreport") %>">ApiDocument/GetCommentsReport</a>,
        <a href="<%= Url.Action("textdocumentapi/apidocument/getreviewreport") %>">ApiDocument/GetReviewReport</a>);</li>
    <li>create a table for the comments/review report and fill it in with the data from the global variable (<a href="<%= Url.Action("textdocumentapi/api/createparagraph") %>">Api/CreateParagraph</a>,
        <a href="<%= Url.Action("textdocumentapi/api/createtable") %>">Api/CreateTable</a>, <a href="<%= Url.Action("textdocumentapi/apidocument/push") %>">ApiDocument/Push</a>,
        <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getelement") %>">ApiDocumentContent/GetElement</a>, <a href="<%= Url.Action("textdocumentapi/apiparagraph/addtext") %>">ApiParagraph/AddText</a>,
        <a href="<%= Url.Action("textdocumentapi/apitable/getrow") %>">ApiTable/GetRow</a>, <a href="<%= Url.Action("textdocumentapi/apitable/mergecells") %>">ApiTable/MergeCells</a>,
        <a href="<%= Url.Action("textdocumentapi/apitablecell/getcontent") %>">ApiTableCell/GetContent</a>, <a href="<%= Url.Action("textdocumentapi/apitablerow/getcell") %>">ApiTableRow/GetCell</a>);</li>
    <li>edit text style in the table (<a href="<%= Url.Action("textdocumentapi/apidocument/getstyle") %>">ApiDocument/GetStyle</a>, <a href="<%= Url.Action("textdocumentapi/apirun/setcolor") %>">ApiRun/SetColor</a>,
        <a href="<%= Url.Action("textdocumentapi/apirun/setstrikeout") %>">ApiRun/SetStrikeout</a>).</li>
</ul>
<br />
<textarea disabled="disabled" id="builderScript" name="builderScript" data-easy="true" class="docbuilder-script" spellcheck="false"></textarea>

<h2>Resulting document</h2>

<div id="editorSpace">
    <div id="placeholder"></div>
</div>
<script>
    <% var defMethod = DocBuilderDocumentation.Instance.GetSample("createreports"); %>
    $("#builderScript").val("<%= Regex.Replace(defMethod.Script.Replace("\"", "\\\""), @"\r\n|\n", "\\n") %>");
</script>
<div id="generator">
    <UserControl:Generator runat="server" docTitle="Reports" runScript="false" documentType="word" ext="docx" template="review_report" zoom="80" />
</div>
