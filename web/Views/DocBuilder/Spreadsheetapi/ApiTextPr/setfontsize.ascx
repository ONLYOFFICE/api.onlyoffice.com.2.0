<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFontSize</span>
</h1>

<% Html.RenderPartial("DocBuilderShared/ApiTextPr/SetFontSize", "spreadsheetapi");%>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oStroke, oFill;
oFill = Api.CreateSolidFill(Api.CreateRGBColor(104, 155, 104));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 120 * 36000, 70 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
oDocContent = oShape.GetDocContent();
oParagraph = oDocContent.GetElement(0);
var oRun = Api.CreateRun();
oTextPr = oRun.GetTextPr();
oTextPr.SetFontSize(30);
oParagraph.SetJc("left");
oRun.AddText("This is a sample text inside the shape with the font size set to 15 points using the text properties.");
oParagraph.AddElement(oRun);
builder.SaveFile("xlsx", "SetFontSize.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5006256&doc=Wk12YzJhcEJLMnM5YWZ3dldXdUozTHM0bFhCTUc4TlhJL2pFbzVydUtwQT0_IjUwMDYyNTYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>