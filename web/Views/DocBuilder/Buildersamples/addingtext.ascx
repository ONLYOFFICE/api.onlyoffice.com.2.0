<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Adding text to the opened document</span>
</h1>

<div class="header-gray">Description</div>

<p>Add text to the document:</p>
<ul>
    <li>open the created document (<a href="<%= Url.Action("textdocumentapi/api/getdocument") %>">Api/GetDocument</a>);</li>
    <li>add the text to it (<a href="<%= Url.Action("textdocumentapi/apidocument/getelement") %>">ApiDocument/GetElement</a>,
        <a href="<%= Url.Action("textdocumentapi/apiparagraph/addtext") %>">ApiParagraph/AddText</a>, <a href="<%= Url.Action("textdocumentapi/apirun/addtext") %>">ApiRun/AddText</a>);</li>
    <li>align the text by the left side (<a href="<%= Url.Action("textdocumentapi/apiparagraph/setjc") %>">ApiParagraph/SetJc</a>);</li>
    <li>split the text into two lines (<a href="<%= Url.Action("textdocumentapi/apirun/addlinebreak") %>">ApiRun/AddLineBreak</a>);</li>
    <li>color it in blue (<a href="<%= Url.Action("textdocumentapi/apirun/setcolor") %>">ApiRun/SetColor</a>).</li>
</ul>

<div class="header-gray">Script</div>
<br />

<textarea readonly="readonly" id="builderScript" name="builderScript" class="builder-code">
    builder.OpenFile("sample1.docx", "");

    var oDocument = Api.GetDocument();
    var oParagraph = oDocument.GetElement(0);
    oParagraph.SetJc("left");
    
    var oRun = oParagraph.AddText("This text was added by ONLYOFFICE Document Builder ");
    oRun.AddLineBreak();
    oRun.AddText("after it opened the created document.");
    oRun.SetColor(255, 255, 255);
    
    builder.SaveFile("docx", "sample2.docx");
    builder.CloseFile();
</textarea>

<a style="text-decoration: none;" href="<%= Url.Content("~/content/document/sample2.docx") %>" download="">
    <button type="submit" id="generateButton" class="builder-run">
        Generate<br />
        document
    </button>
</a>

<div class="header-gray">Result</div>
<br />

<img alt="Adding text" src="<%= Url.Content("~/content/img/docbuilder/adding-text.png") %>" />
