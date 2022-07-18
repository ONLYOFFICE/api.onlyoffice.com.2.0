<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Mail merge receptions</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Create mail merge receptions in the separate documents:</p>
<ul>
    <li>load mail merge data from the opened xlsx file to the current document (<a href="<%= Url.Action("textdocumentapi/api/getmailmergedata") %>">Api/GetMailMergeData</a>,
    <a href="<%= Url.Action("textdocumentapi/api/loadmailmergedata") %>">Api/LoadMailMergeData</a>);</li>
    <li>get the mail merge template document (<a href="<%= Url.Action("textdocumentapi/api/getmailmergetemplatedoccontent") %>">Api/GetMailMergeTemplateDocContent</a>);</li>
    <li>count a number of the mail merge receptions (<a href="<%= Url.Action("textdocumentapi/api/getmailmergereceptionscount") %>">Api/GetMailMergeReceptionsCount</a>);</li>
    <li>run the mail merge process for each mail merge reception and save them to the separate files (<a href="<%= Url.Action("textdocumentapi/api/mailmerge") %>">Api/MailMerge</a>);</li>
    <li>replace the resulting document content after each mail merge action with the mail merge template document content in order to use it later for the next mail merge (<a href="<%= Url.Action("textdocumentapi/api/replacedocumentcontent") %>">Api/ReplaceDocumentContent</a>).</li>
</ul>

<div class="header-gray">Script</div>
</br >

<textarea disabled="disabled" id="builderScript" name="builderScript" class="builder-code">
    builder.OpenFile("MailMergeData.xlsx", "");

    GlobalVariable["MailMergeData"] = Api.GetMailMergeData(0);

    builder.CloseFile();

    builder.OpenFile("sample8.docx", "");

    Api.LoadMailMergeData(GlobalVariable["MailMergeData"]);

    var oTemplateDocContent = Api.GetMailMergeTemplateDocContent();
    var ReceptionsCount     = Api.GetMailMergeReceptionsCount();

    for (var nReception = 0; nReception < ReceptionsCount; nReception++) 
    {
        Api.MailMerge(nReception, nReception);
        builder.SaveFile(("docx", "MailMergeSample" + nReception + ".docx");
        Api.ReplaceDocumentContent(oTemplateDocContent);
    }

    builder.CloseFile();
</textarea>

<a style="text-decoration: none;" href="<%= Url.Content("~/content/img/docbuilder/document-samples/sample8.docx") %>", download="" />
    <button type="submit" id="generateButton" class="builder-run">
        Generate<br />
        document
    </button>
</a>

<div class="header-gray">Result</div>
</br >
<img alt="Mail merge receptions" src="<%= Url.Content("~/content/img/docbuilder/mail-merge-reception1.png") %>" />
<img alt="Mail merge receptions" src="<%= Url.Content("~/content/img/docbuilder/mail-merge-reception2.png") %>" />