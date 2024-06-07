builder.CreateFile("docx");
var oDocument = Api.GetDocument();

var oHeading1Style = oDocument.CreateStyle("Heading 1", "paragraph");
var oParaPr = oHeading1Style.GetParaPr();
oParaPr.SetKeepNext(true);
oParaPr.SetKeepLines(true);
oParaPr.SetSpacingAfter(240);
var oTextPr = oHeading1Style.GetTextPr();
oTextPr.SetColor(0xff, 0x68, 0x00, false);
oTextPr.SetFontSize(70);
oTextPr.SetFontFamily("Calibri Light");
var oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oHeading1Style);
oParagraph.AddText("Weekly Report | QTR 3 Week 12");

var oDrawing =Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/api-word.jpg", 220 * 36000, 350 * 36000);
oDrawing.SetWrappingStyle("behind");
oDrawing.SetHorAlign("page", "left");
oDrawing.SetVerAlign("page", "top");
oParagraph.AddDrawing(oDrawing);

oParagraph = Api.CreateParagraph();
var oChart = Api.CreateChart("bar3D", [ [200, 140, 180, 160, 240, 240], [250, 190, 200, 180, 260, 260] ], ["Projected Revenue", "Estimated Costs"], ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], 80 * 36000, 55 * 36000, 24);
var oFill = Api.CreateSolidFill(Api.CreateRGBColor(51, 51, 51));
oChart.SetSeriesFill(oFill, 0, false);
oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61));
oChart.SetSeriesFill(oFill, 1, false);
oChart.SetVerAxisTitle("USD In Thousands", 10);
oChart.SetLegendPos("bottom");
oChart.SetShowDataLabels(false, false, true, false);
oChart.SetTitle("Financial Overview", 13);
oChart.SetDistances(5 * 36000, 5 * 36000, 5 * 36000, 36000);
oChart.SetWrappingStyle("square");
oChart.SetHorAlign("page", "left");
oChart.SetHorPosition("leftMargin", 30 * 36000);
oParagraph.AddDrawing(oChart);

oParagraph.AddText("Regardless of your sector or industry, it’s likely that your finances department is the beating heart of your entire operation. Without financial fluency, it’s difficult for an organization to thrive, which means that keeping your monetary affairs in order is essential.");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("As a business, you need the reliability of frequent financial reports to better understand the state of your finances, both current and future. Financial reports give you the ability to take a proactive approach to managing your company's economy and improve long-term profitability with short-term company financial reports.");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("A robust finance report communicates crucial accounting information that covers a specified period through daily, weekly, and monthly financial reports. These are powerful tools that you can apply to increase internal business performance. A data-driven finance report is also an effective means of remaining updated with any significant progress or changes in the status of your finances and helps you measure your results, cash flow, and financial position.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "Api.docx");
builder.CloseFile();
