builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oImageTitle = Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/api-slide-1.jpg", 350 * 36000, 195* 36000);
var oImageSlideOne = Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/api-slide-2.jpg", 350 * 36000, 195* 36000);
var oSlide = oPresentation.GetSlideByIndex(0);
oSlide.RemoveAllObjects();
oSlide.AddObject(oImageTitle);
var oFill = Api.CreateNoFill();
var oStroke = Api.CreateStroke(0, oFill);
var oShapeTitle = Api.CreateShape("rect", 150 * 36000, 20 * 36000, oFill, oStroke);
var oShapeFooter = Api.CreateShape("rect", 150 * 36000, 20 * 36000, oFill, oStroke);
var oShapeChartTitle = Api.CreateShape("rect", 200 * 36000, 20 * 36000, oFill, oStroke);
oShapeTitle.SetPosition(40 * 36000, 55 * 36000);
oShapeFooter.SetPosition(170 * 36000, 175 * 36000);
oShapeChartTitle.SetPosition(135 * 36000, 3 * 36000);
var oDocContent = oShapeTitle.GetDocContent();
var oParagraph = oDocContent.GetElement(0);
var oRun = Api.CreateRun();
var oTextPr = oRun.GetTextPr();
oTextPr.SetFontSize(96);
oFill = Api.CreateSolidFill(Api.CreateRGBColor(115, 81, 68));
oTextPr.SetFill(oFill);
oTextPr.SetFontFamily("Tahoma");
oParagraph.SetJc("left");
oRun.AddText("TEAM BUILDING");
oRun.AddLineBreak();
oParagraph.AddElement(oRun);
oSlide.AddObject(oShapeTitle);
oRun = Api.CreateRun();
oTextPr = oRun.GetTextPr();
oTextPr.SetFontSize(62);
oTextPr.SetFill(oFill);
oRun.AddText("How we grow relationships through creativity");
oParagraph.AddElement(oRun);
oSlide.AddObject(oShapeTitle);

oDocContent = oShapeFooter.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oRun = Api.CreateRun();
oTextPr = oRun.GetTextPr();
oTextPr.SetFontSize(56);
oTextPr.SetFill(oFill);
oRun.AddText("HR Team General Report");
oParagraph.AddElement(oRun);
oSlide.AddObject(oShapeFooter);

oSlide = Api.CreateSlide();
oSlide.RemoveAllObjects();
oSlide.AddObject(oImageSlideOne);
oPresentation.AddSlide(oSlide);

var oChart = Api.CreateChart("bar", [
[6, 10, 15],
[8, 18, 27]
], ["Number of team's ideas used for corp events", "Number of new cross-team projects"], [2020, 2021, 2022], 4051300, 2347595, 48);
oChart.SetVerAxisTitle("", 10);
oChart.SetHorAxisTitle("", 11);
oChart.SetLegendPos("bottom");
oChart.SetShowDataLabels(false, false, true, false);
oChart.SetTitle("", 26);
oChart.SetSize(269.5 * 36000, 129 * 36000);
oChart.SetPosition(40 * 36000, 33 * 36000);
oFill = Api.CreateSolidFill(Api.CreateRGBColor(196, 230, 214));
oChart.SetSeriesFill(oFill, 0, false);
oFill = Api.CreateSolidFill(Api.CreateRGBColor(244, 80, 104));
oChart.SetHorAxisLablesFontSize(24);
oChart.SetLegendFontSize(24);
oChart.SetVertAxisLablesFontSize(24);
oChart.SetSeriesFill(oFill, 1, false);
oSlide.AddObject(oChart);

oDocContent = oShapeChartTitle.GetDocContent();
oParagraph = oDocContent.GetElement(0);
oRun = Api.CreateRun();
oTextPr = oRun.GetTextPr();
oTextPr.SetFontSize(76);
oFill = Api.CreateSolidFill(Api.CreateRGBColor(115, 81, 68));
oTextPr.SetFill(oFill);
oTextPr.SetFontFamily("Tahoma");
oParagraph.SetJc("left");
oRun.AddText("Collaboration between teams");
oRun.AddLineBreak();
oParagraph.AddElement(oRun);
oSlide.AddObject(oShapeChartTitle);

Api.Save();
builder.SaveFile("pptx", "Api.pptx");
builder.CloseFile();
