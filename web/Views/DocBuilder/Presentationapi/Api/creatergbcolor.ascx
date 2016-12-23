<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateRGBColor</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreateRGBColor", "presentationapi");%>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
var oRGBColor = Api.CreateRGBColor(255, 164, 101);
oGs1 = Api.CreateGradientStop(Api.CreatePresetColor("lightYellow"), 0);
oGs2 = Api.CreateGradientStop(oRGBColor, 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateRGBColor.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004805&doc=ZHI3VFNzYTF1dkxWYjVjZW4xc2N6TXl1eXhUVVV3USsrQm9pOWI3Q0d5ST0_IjUwMDQ4MDUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>