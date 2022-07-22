<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Running mail merge process</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Run the mail merge process for the current document:</p>
<ul>
    <li>load mail merge data from the opened <em>xlsx</em> file to the current document (<a href="<%= Url.Action("spreadsheetapi/api/getmailmergedata") %>">Api/GetMailMergeData</a>,
    <a href="<%= Url.Action("textdocumentapi/api/loadmailmergedata") %>">Api/LoadMailMergeData</a>);</li>
    <li>run the mail merge process for the current document (<a href="<%= Url.Action("textdocumentapi/api/mailmerge") %>">Api/MailMerge</a>).</li>
</ul>

<div class="header-gray">Script</div>
</br >

<textarea disabled="disabled" id="builderScript" name="builderScript" class="builder-code">
    builder.OpenFile("MailMergeData.xlsx", "");

    GlobalVariable["MailMergeData"] = Api.GetMailMergeData(0);

    builder.CloseFile();

    builder.OpenFile("sample9.docx", "");

    Api.LoadMailMergeData(GlobalVariable["MailMergeData"]);
    Api.MailMerge();

    builder.SaveFile("docx", "MailMergeSample.docx");
    builder.CloseFile();
</textarea>

<a style="text-decoration: none;" href="<%= Url.Content("~/content/document/sample9.docx") %>", download="" />
    <button type="submit" id="generateButton" class="builder-run">
        Generate<br />
        document
    </button>
</a>

<div class="header-gray">Result</div>
</br >
<img alt="Mail merge template" src="<%= Url.Content("~/content/img/docbuilder/mail-merge-template.png") %>" />
<p class="image-description">Mail merge template</p>
<img alt="Mail merge receptions" src="<%= Url.Content("~/content/img/docbuilder/mail-merge-reception1.png") %>" />
<p class="image-description">Reception</p>