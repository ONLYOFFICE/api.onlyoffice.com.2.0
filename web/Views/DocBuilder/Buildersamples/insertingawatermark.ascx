<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Inserting a watermark</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Insert a watermark on each document page (<a href="<%= Url.Action("textdocumentapi/api/getdocument") %>">Api/GetDocument</a>,
<a href="<%= Url.Action("textdocumentapi/apidocument/insertwatermark") %>">ApiDocument/InsertWatermark</a>).</p>

<div class="header-gray">Script</div>
</br >

<textarea disabled="disabled" id="builderScript" name="builderScript" class="builder-code">
    builder.OpenFile("sample1.docx", "");
    var oDocument  = Api.GetDocument();
    oDocument.InsertWatermark("WATERMARK", true);
    builder.SaveFile("docx", "sample7.docx");
    builder.SaveFile("pdf", "sample7.pdf");
    builder.CloseFile();
</textarea>

<a style="text-decoration: none;" href="<%= Url.Content("~/content/document/sample7.docx") %>", download="" />
    <button type="submit" id="generateButton" class="builder-run">
        Generate<br />
        document
    </button>
</a>

<div class="header-gray">Result</div>
</br >
<img alt="Watermark" src="<%= Url.Content("~/content/img/docbuilder/watermark.png") %>" />