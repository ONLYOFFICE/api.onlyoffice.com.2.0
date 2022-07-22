<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Converting a document</span>
</h1>

<div class="header-gray">Description</div>

<p>Convert a document from one format into another:</p>
<ul>
    <li>open the created <em>docx</em> document;</li>
    <li>save it in the <em>pdf</em> format.</li>
</ul>

<div class="header-gray">Script</div>
<br />

<textarea readonly="readonly" id="builderScript" name="builderScript" class="builder-code">
    builder.OpenFile("sample1.docx", "");
    builder.SaveFile("pdf", "sample3.pdf");
    builder.CloseFile();
</textarea>

<a style="text-decoration: none;" href="<%= Url.Content("~/content/document/sample3.pdf") %>" download="">
    <button type="submit" id="generateButton" class="builder-run">
        Generate<br />
        document
    </button>
</a>

<div class="header-gray">Result</div>
<br />

<img alt="Adding text" src="<%= Url.Content("~/content/img/docbuilder/converting-document.png") %>" />
