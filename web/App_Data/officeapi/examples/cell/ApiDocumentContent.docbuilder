builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61));
var oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = oWorksheet.AddShape("flowChartOnlineStorage", 200 * 36000, 60 * 36000, oFill, oStroke, 0, 2 * 36000, 0, 3 * 36000);
var oDocContent = oShape.GetContent();
var oParagraph = oDocContent.GetElement(0);
oParagraph.AddText("This is paragraph #1.");
for (let nParaIncrease = 1; nParaIncrease < 5; ++nParaIncrease) {
  oParagraph = Api.CreateParagraph();
  oParagraph.AddText("This is paragraph #" + (nParaIncrease + 1) + ".");
  oDocContent.Push(oParagraph);
}
oDocContent.RemoveElement(2);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("We removed paragraph #3, check that out above.");
oDocContent.Push(oParagraph);
var sClassType = oDocContent.GetClassType();
oParagraph.AddLineBreak();
oParagraph.AddText("Class Type = " + sClassType);
oParagraph.AddLineBreak();
oParagraph.AddText("Number of elements inside the shape: " + oDocContent.GetElementsCount());
oParagraph.AddLineBreak();
builder.SaveFile("xlsx", "ApiDocumentContent.xlsx");
builder.CloseFile();
