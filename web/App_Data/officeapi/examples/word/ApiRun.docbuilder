builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oRun = Api.CreateRun();
oRun.AddText("This is just a sample text.");
oRun.AddLineBreak();
oRun.AddTabStop();
oRun.AddTabStop();
oRun.AddText(" Nothing special.");
oRun.SetBold(true);
oParagraph.AddElement(oRun);
var oCopyRun = oRun.Copy();
oParagraph.AddLineBreak();
oParagraph.AddElement(oCopyRun);
oRun = Api.CreateRun();
var oDrawing = Api.CreateChart("bar3D", [
  [200, 240, 280],
  [250, 260, 280]
], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24);
var oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51));
oDrawing.SetSeriesFill(oFill, 0, false);
oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61));
oDrawing.SetSeriesFill(oFill, 1, false);
oDrawing.SetVerAxisTitle("USD In Hundred Thousands", 10);
oDrawing.SetHorAxisTitle("Year", 11);
oDrawing.SetLegendPos("bottom");
oDrawing.SetShowDataLabels(false, false, true, false);
oDrawing.SetTitle("Financial Overview", 13);
oRun.AddDrawing(oDrawing);
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.AddText("onlyoffice document builder");
oRun.SetCaps(true);
oParagraph.AddLineBreak();
oParagraph.AddElement(oRun);
oRun.AddHyperlink("https://www.onlyoffice.com", "main page");
builder.SaveFile("docx", "ApiRun.docx");
builder.CloseFile();
