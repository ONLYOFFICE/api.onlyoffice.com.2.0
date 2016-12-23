<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateGradientStop</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/Api/CreateGradientStop", "presentationapi");%>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateGradientStop.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004788&doc=WGR4M0lYZzdTUDA5eUErTDZQY1VIdTIvRXBWLy9yRVZQcXc3TkhUaE9YYz0_IjUwMDQ3ODgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>