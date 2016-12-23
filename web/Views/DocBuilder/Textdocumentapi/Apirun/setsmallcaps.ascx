<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSmallCaps</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiRun/SetSmallCaps", "textdocumentapi");%>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetSmallCaps(true);
oRun.AddText("This is a text run with the font set to small capitalized letters.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetSmallCaps.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892215&doc=NVNRNXdVQ2xNcUh0bmtEQ1VNVER3MTVwWDh3OWVtN0tteFlyWUJITjhJWT0_IjQ4OTIyMTUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>