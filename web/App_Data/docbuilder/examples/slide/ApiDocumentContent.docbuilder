builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
var oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61));
var oStroke = Api.CreateStroke(0, Api.CreateNoFill());
var oShape = Api.CreateShape("flowChartMagneticTape", 300 * 36000, 130 * 36000, oFill, oStroke);
oShape.SetPosition(608400, 1267200);
var oDocContent = oShape.GetDocContent();
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
oSlide.AddObject(oShape);
builder.SaveFile("pptx", "ApiDocumentContent.pptx");
builder.CloseFile();
