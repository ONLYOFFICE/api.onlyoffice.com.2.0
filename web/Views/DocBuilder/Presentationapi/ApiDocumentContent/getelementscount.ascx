<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetElementsCount</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiDocumentContent/GetElementsCount", "presentationapi");%>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("We got the first paragraph inside the shape.");
oParagraph.AddLineBreak();
oParagraph.AddText("Number of elements inside the shape: " + oDocContent.GetElementsCount());
oParagraph.AddLineBreak();
oParagraph.AddText("Line breaks are NOT counted into the number of elements.");
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "GetElementsCount.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5007735&doc=bHdmeTdFQVFybFdISllYKzA3bFpVRVg3RE92NDVqd2ZRc3huYk8xOTFJWT0_IjUwMDc3MzUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>