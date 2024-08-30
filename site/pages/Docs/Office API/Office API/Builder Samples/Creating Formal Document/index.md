Create a document following the structure of a formal paper:

- create a title page with a document heading and subtitle (Api, ApiDocumentContent, ApiDrawing);
- create different styles for the document text, heading, subtitle, table, footer (ApiParaPr, ApiStyle, ApiTable, ApiTableCell, ApiTablePr, ApiTableRow, ApiTextPr);
- structure the document by marking up its section: set columns for text and pictures, set page size and margins, create header and footer (ApiDocument, ApiSection);
- fill the document with text, dividing it into separate fragments and highlighting them with headings (ApiParagraph, ApiRun);
- add images and charts to represent document text (Api, ApiChart).

```js document-builder={"documentType": "word", "editorConfig": {"customization": {"zoom": 60}}}
// builder.CreateFile("docx");

var oParagraph, oRun, oDrawing, oParaMark;
var oDocument = Api.GetDocument();

var oNoSpacingStyle = oDocument.GetStyle("No Spacing");
var oFinalSection = oDocument.GetFinalSection();
oFinalSection.SetEqualColumns(2, 720);
oFinalSection.SetPageSize(12240, 15840);
oFinalSection.SetPageMargins(1440, 1440, 1440, 1440);
oFinalSection.SetHeaderDistance(720);
oFinalSection.SetFooterDistance(720);
oFinalSection.SetType("continuous");

var oTextPr, oParaPr, oTablePr;

oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetFontSize(22);
oTextPr.SetLanguage("en-US");
oTextPr.SetFontFamily("Calibri");

oParaPr = oDocument.GetDefaultParaPr();
oParaPr.SetSpacingLine(276, "auto");
oParaPr.SetSpacingAfter(200);

var oNormalStyle = oDocument.GetDefaultStyle("paragraph");
oParaPr = oNormalStyle.GetParaPr();
oParaPr.SetSpacingLine(240, "auto");
oParaPr.SetJc("both");
oTextPr = oNormalStyle.GetTextPr();
oTextPr.SetColor(0x26, 0x26, 0x26, false);

var oHeading1Style = oDocument.CreateStyle("Heading 1", "paragraph");
oParaPr = oHeading1Style.GetParaPr();
oParaPr.SetKeepNext(true);
oParaPr.SetKeepLines(true);
oParaPr.SetSpacingAfter(240);
oTextPr = oHeading1Style.GetTextPr();
oTextPr.SetColor(0x29, 0x33, 0x4F, false);
oTextPr.SetFontSize(40);
oTextPr.SetFontFamily("Calibri Light");

var oSubtitleStyle = oDocument.CreateStyle("Subtitle");
oParaPr = oSubtitleStyle.GetParaPr();
oParaPr.SetSpacingAfter(0);
oParaPr.SetSpacingBefore(240);
oTextPr = oSubtitleStyle.GetTextPr();
oTextPr.SetColor(0x29, 0x33, 0x4F, false);
oTextPr.SetFontSize(32);
oTextPr.SetFontFamily("Calibri Light");

var oNormalTableStyle = oDocument.GetDefaultStyle("table");
oTablePr = oNormalTableStyle.GetTablePr();
oTablePr.SetTableInd(0);
oTablePr.SetTableCellMarginTop(0);
oTablePr.SetTableCellMarginLeft(108);
oTablePr.SetTableCellMarginRight(108);
oTablePr.SetTableCellMarginBottom(0);

var oTableGridStyle = oDocument.CreateStyle("TableGrid", "table");
oTableGridStyle.SetBasedOn(oNormalTableStyle);
oParaPr = oTableGridStyle.GetParaPr();
oParaPr.SetSpacingAfter(0);
oParaPr.SetSpacingLine("auto", 240);
oTablePr = oTableGridStyle.GetTablePr();
oTablePr.SetTableInd(0);
oTablePr.SetTableBorderTop("single", 4, 0, 0, 0, 0);
oTablePr.SetTableBorderLeft("single", 4, 0, 0, 0, 0);
oTablePr.SetTableBorderRight("single", 4, 0, 0, 0, 0);
oTablePr.SetTableBorderBottom("single", 4, 0, 0, 0, 0);
oTablePr.SetTableBorderInsideH("single", 4, 0, 0, 0, 0);
oTablePr.SetTableBorderInsideV("single", 4, 0, 0, 0, 0);
oTablePr.SetTableCellMarginTop(0);
oTablePr.SetTableCellMarginLeft(108);
oTablePr.SetTableCellMarginBottom(0);
oTablePr.SetTableCellMarginRight(108);

var oFooterStyle = oDocument.CreateStyle("Footer", "paragraph");
oParaPr = oFooterStyle.GetParaPr();
oParaPr.SetTabs([4680, 9360], ["center", "right"]);
oParaPr.SetSpacingAfter(0);
oParaPr.SetJc("left");
oTextPr = oFooterStyle.GetTextPr();
oTextPr.SetColor(0, 0, 0, true);
oTextPr.SetFontSize(22);

oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingLine(276, "auto");
oParagraph.SetJc("left");
oParaMark = oParagraph.GetParagraphMarkTextPr();
oParaMark.SetFontSize(52);
oParaMark.SetColor(0x14, 0x14, 0x14, false);
oParaMark.SetSpacing(5);
oParagraph.AddPageBreak();
var oFill = Api.CreateSolidFill(Api.CreateRGBColor(61, 74, 107));
var oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect",5463210, 9655810, oFill, oStroke);
oParagraph.AddDrawing(oDrawing);
oDrawing.SetWrappingStyle("behind");
oDrawing.SetHorPosition("page", 155575);
oDrawing.SetVerPosition("page", 201295);

var oDocContent = oDrawing.GetDocContent();
oDocContent.RemoveAllElements();
var oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("right");
var oRun2 = oParagraph2.AddText("ONLYOFFICE");
oRun2.AddLineBreak();
oRun2.AddText("Document Builder");
oRun2.SetFontSize(64);
oRun2.SetCaps(true);
oRun2.SetColor(255, 255, 255);
oRun2.SetFontFamily("Calibri Light");
oParagraph2.SetBottomBorder("single", 1, 0, 151, 192, 60);
oDocContent.Push(oParagraph2);
oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("right");
oRun2 = oParagraph2.AddText("Product Launch Revenue Plan");
oRun2.SetFontSize(44);
oRun2.SetColor(255, 255, 255);
oRun2.SetFontFamily("Calibri Light");
oDocContent.Push(oParagraph2);
oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("right");
oDocContent.Push(oParagraph2);
oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("right");
oDocContent.Push(oParagraph2);
oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("right");
oDocContent.Push(oParagraph2);
oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("right");
oRun2 = oParagraph2.AddText("Confidential");
oRun2.SetFontSize(28);
oRun2.SetColor(255, 255, 255);
oRun2.SetFontFamily("Calibri Light");
oDocContent.Push(oParagraph2);
oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("right");
oRun2 = oParagraph2.AddText("July 2016");
oRun2.SetFontSize(28);
oRun2.SetColor(255, 255, 255);
oRun2.SetFontFamily("Calibri Light");
oDocContent.Push(oParagraph2);
oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("right");
oDocContent.Push(oParagraph2);
oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("right");
oDocContent.Push(oParagraph2);
oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("right");
oDocContent.Push(oParagraph2);

oFill = Api.CreateSolidFill(Api.CreateRGBColor(41, 51, 79));
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 1880870, 9655810, oFill, oStroke);
oDrawing.SetWrappingStyle("inFront");
oDrawing.SetHorPosition("page", 5673725);
oDrawing.SetVerPosition("page", 201295);
oParagraph.AddDrawing(oDrawing);
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oNoSpacingStyle);

var oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(176, 217, 84), 0);
var oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(151, 192, 60), 100000);
oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 5930900, 15 * 36000, oFill, oStroke);
oDrawing.SetWrappingStyle("topAndBottom");
oDrawing.SetHorAlign("margin", "left");
oDrawing.SetVerPosition("paragraph", 5715);
oDrawing.SetDistances(114300, 0, 114300, 0);
oDocContent = oDrawing.GetDocContent();
oDocContent.RemoveAllElements();
oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("left");
oRun2 = oParagraph2.AddText("Product Launch Revenue Plan");
oRun2.SetFontSize(36);
oRun2.SetColor(0, 0, 0);
oRun2.SetFontFamily("Calibri Light");
oDocContent.AddElement(0, oParagraph2);

oParagraph.AddDrawing(oDrawing);

oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oHeading1Style);
oDrawing = Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/launch_photo.png", 720725, 1204595);
oDrawing.SetWrappingStyle("tight");
oDrawing.SetHorAlign("margin", "left");
oDrawing.SetVerPosition("page", 1810470);
oDrawing.SetDistances(114300, 0, 114300, 0);
oParagraph.AddDrawing(oDrawing);
oParagraph.AddText("Overview");
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oParagraph.AddText("In the previous meeting of the board of directors funds were approved to take the 'ONLYOFFICE Document Builder' product to market.  They have also allocated a sum of $250,000 towards market identification and launch efforts. This document describes in brief the objective set forth by the VP of marketing pursuant to the board's decision.");
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oHeading1Style);
oParagraph.SetSpacingAfter(100, true);
oParagraph.SetSpacingBefore(100, true);
oParagraph.AddText("Summary");
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingAfter(100, true);
oParagraph.SetSpacingBefore(100, true);

oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 104, 0));

oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(176, 217, 84), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(151, 192, 60), 100000);
oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);

oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 70 * 36000, 40 * 36000, oFill, oStroke);
oDrawing.SetWrappingStyle("topAndBottom");
oDrawing.SetVerPosition("paragraph", 900888);
oDrawing.SetDistances(114300, 0, 114300, 0);
oDocContent = oDrawing.GetDocContent();
oDocContent.RemoveAllElements();
oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("left");
oParagraph2.SetSpacingAfter(160);
oRun2 = oParagraph2.AddText("Phase 1");
oRun2.SetFontSize(20);
oRun2.SetBold(true);
oRun2.SetColor(0, 0, 0);
oRun2.SetFontFamily("Calibri");

oRun2 = oParagraph2.AddText(": Review market tests, marketing plans, and expected sales goals.");
oRun2.SetFontSize(20);
oRun2.SetColor(0, 0, 0);
oRun2.SetFontFamily("Calibri");

oDocContent.Push(oParagraph2);

oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("left");
oParagraph2.SetSpacingAfter(160);
oRun2 = oParagraph2.AddText("Phase 2");
oRun2.SetFontSize(20);
oRun2.SetBold(true);
oRun2.SetColor(0, 0, 0);
oRun2.SetFontFamily("Calibri");

oRun2 = oParagraph2.AddText(": Developers complete final build of the solution.");
oRun2.SetFontSize(20);
oRun2.SetColor(0, 0, 0);
oRun2.SetFontFamily("Calibri");
oDocContent.Push(oParagraph2);

oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("left");
oParagraph2.SetSpacingAfter(160);
oRun2 = oParagraph2.AddText("Phase 3");
oRun2.SetFontSize(20);
oRun2.SetBold(true);
oRun2.SetColor(0, 0, 0);
oRun2.SetFontFamily("Calibri");

oRun2 = oParagraph2.AddText(": The launch phase.");
oRun2.SetFontSize(20);
oRun2.SetColor(0, 0, 0);
oRun2.SetFontFamily("Calibri");
oDocContent.Push(oParagraph2);

oParagraph.AddDrawing(oDrawing);

oParagraph.AddText("After years of market research and focused creative effort we are in a position to take our 'ONLYOFFICE Document Builder' to market. We have a three phase approach in place to complete the product and take the product to market.  The first step of this initiative is to test the market. ");
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingAfter(0, true);
oParagraph.SetSpacingBefore(0, true);
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oHeading1Style);
oParagraph.SetSpacingAfter(100, true);
oParagraph.SetSpacingBefore(100, true);

oDrawing = Api.CreateChart("bar3D", [[200, 240, 300, 320, 390],[250, 260, 270, 280, 285]], ["Projected Revenue", "Estimated Costs"], [2016, 2017, 2018, 2019, 2020], 90 * 36000, 2347595);
oDrawing.SetWrappingStyle("tight");
oDrawing.SetHorPosition("column", 80 * 36000);
oDrawing.SetVerPosition("paragraph", 346075);
oDrawing.SetDistances(114300, 0, 114300, 0);
oDrawing.SetVerAxisTitle("USD In Hundred Thousands");
oDrawing.SetLegendPos("bottom");
oDrawing.SetShowDataLabels(false, false, true);
oParagraph.AddDrawing(oDrawing);
oParagraph.AddText("Financial Overview");
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oParagraph.SetIndRight(5040);
oParagraph.AddText("Included are the estimated investment costs to introduce the new product.  As you can see for the first 2 years we will be in the investment phase.  Generating market demand and building our reputation in this category.  By 201");
oParagraph.AddText("8");
oParagraph.AddText(" we expect to be profitable.");
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oParagraph.SetIndRight(5040);
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oHeading1Style);
oParagraph.SetSpacingAfter(100, true);
oParagraph.SetSpacingBefore(100, true);
oParagraph.AddText("Details");
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingAfter(240);
oParagraph.AddText("Out of the $250,000 allocated for this effort, we would like to spend about $50,000 towards the identification of the market.  For this we are allowed to engage with a marketing consulting organization.  Let us start with creating an RFP for this and start inviting the bids.  We would like to get the selection process completed by no later than end of first quarter.");
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingBefore(100, true);
oParagraph.SetSpacingAfter(360);
oDocument.Push(oParagraph);
var oSection1 = oDocument.CreateSection(oParagraph);
oSection1.SetEqualColumns(1, 720);
oSection1.SetPageSize(12240, 15840);
oSection1.SetPageMargins(1440, 1440, 1440, 1440);
oSection1.SetHeaderDistance(720);
oSection1.SetFooterDistance(576);

oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oSubtitleStyle);
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(176, 217, 84), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(151, 192, 60), 100000);
oFill = Api.CreateLinearGradientFill([oGs1, oGs2], 5400000);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 2718435, 962025, oFill, oStroke);
oDrawing.SetWrappingStyle("square");
oDrawing.SetHorAlign("margin", "right");
oDrawing.SetVerPosition("paragraph", 35560);
oDrawing.SetDistances(114300, 0, 114300, 0);
var oContent = oDrawing.GetDocContent();
oContent.RemoveAllElements();
oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("left");
oRun2 = oParagraph2.AddText("Innovation. Profit.");
oRun2.SetFontSize(20);
oRun2.SetBold(true);
oRun2.SetColor(0, 0, 0);
oRun2.SetFontFamily("Calibri");
oContent.AddElement(0, oParagraph2);

oParagraph2 = Api.CreateParagraph();
oParagraph2.SetJc("left");
oRun2 = oParagraph2.AddText("After years of market research and focused creative effort we are in a position to take our 'ONLYOFFICE Document Builder' to market.");
oRun2.SetFontSize(18);
oRun2.SetItalic(true);
oRun2.SetColor(0, 0, 0);
oRun2.SetFontFamily("Calibri");
oContent.AddElement(1, oParagraph2);

oParagraph.AddDrawing(oDrawing);
oParagraph.AddText("Legal Issues");
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oDrawing = Api.CreateChart("pie", [[53, 32, 14]], [], ["Enterprise", "Small Business", "Individual Developers"], 2741295, 2473300);
oDrawing.SetWrappingStyle("square");
oDrawing.SetHorAlign("margin", "right");
oDrawing.SetVerPosition("paragraph", 914400);
oDrawing.SetDistances(114300, 0, 114300, 0);
oDrawing.SetTitle("Projected Market", 9);
oDrawing.SetShowDataLabels(false, false, true);
oParagraph.AddDrawing(oDrawing);
oParagraph.AddText("To support the new product, the Legal Department will maintain a centralized repository for all patent investigations as well as marketing claims.  The release team will adhere to all of the standardized processes for releasing new products.");
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingAfter(0);
oParagraph.AddText("As we approach release of the product, the Legal Department is prepared ");
oParagraph.AddText("to develop all licensing agreements and has streamlined coordination with the marketing and sales department on the license terms and addendums.   ");
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.SetStyle(oSubtitleStyle);
oParagraph.AddText("Statement on Timeline");

oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.SetSpacingAfter(0);
oParagraph.AddText("All timelines in this report are estimated and highly dependent upon each team meeting their individual objectives. There are many interdependencies that are detailed in the related project plan.  ");

oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.SetStyle(oSubtitleStyle);
oParagraph.AddText("Productivity Gains");

oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.AddText("To support the new product, the Legal Department will maintain a centralized repository for all patent investigations");
oParagraph.AddText(" as well as marketing claims.  ");

oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.SetStyle(oSubtitleStyle);
oParagraph.AddText("License Agreements");

oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingAfter(0);
oParagraph.AddText("All timelines in this report are estimated and highly dependent upon each team meetin");
oParagraph.AddText("g their individual objectives.  I");
oParagraph.AddText("nterdependencies are detailed in the related project plan.  ");
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.SetStyle(oSubtitleStyle);
oParagraph.SetKeepNext(true);
oParagraph.SetKeepLines(true);
oParagraph.AddText("Revenue Forecasting");

oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oParagraph.SetKeepNext(true);
oParagraph.SetKeepLines(true);
oParagraph.AddText("To support the new product, the Legal Department will maintain a centralized repository for all ");
oParagraph.AddText("patent investigations and");
oParagraph.AddText(" marketing claims.  The release team will adhere to all of the stand");
oParagraph.AddText("ardized processes for releasing ");
oParagraph.AddText("new products. ");

var oTable = Api.CreateTable(2, 2);
oDocument.Push(oTable);
oTable.SetStyle(oTableGridStyle);
oTable.SetWidth("twips", 4311);
oTable.SetTableInd(100);
oTable.SetTableLook(true, true, false, false, true, false);
oTable.SetTableBorderTop("single", 4, 0, 0xAF, 0xAD, 0x91);
oTable.SetTableBorderBottom("single", 4, 0, 0xAF, 0xAD, 0x91);
oTable.SetTableBorderLeft("single", 4, 0, 0xAF, 0xAD, 0x91);
oTable.SetTableBorderRight("single", 4, 0, 0xAF, 0xAD, 0x91);
oTable.SetTableBorderInsideH("single", 4, 0, 0xAF, 0xAD, 0x91);
oTable.SetTableBorderInsideV("single", 4, 0, 0xAF, 0xAD, 0x91);
var oRow = oTable.GetRow(0), oCell, oCellContent;
if (oRow)
{
    oRow.SetHeight("atLeast", 201);
    oCell = oRow.GetCell(0);
    oCell.SetWidth("twips", 1637);
    oCell.SetShd("clear", 151, 192, 60, false);
    oCell.SetVerticalAlign("center");
    oCellContent = oCell.GetContent();
    oParagraph = oCellContent.GetElement(0);
    oParagraph.SetJc("center");
    oRun = oParagraph.AddText("2016");
    oRun.SetBold(true);
    oRun.SetColor(0, 0, 0, false);

    oCell = oRow.GetCell(1);
    oCell.SetWidth("twips", 2674);
    oCell.SetShd("clear", 151, 192, 60, false);
    oCell.SetVerticalAlign("center");
    oCellContent = oCell.GetContent();
    oParagraph = oCellContent.GetElement(0);
    oParagraph.SetJc("center");
    oRun = oParagraph.AddText("2017");
    oRun.SetBold(true);
    oRun.SetColor(0, 0, 0, false);
}
oRow = oTable.GetRow(1);
if (oRow)
{
    oRow.SetHeight("atLeast", 700);
    oCell = oRow.GetCell(0);
    oCell.SetWidth("twips", 1637);
    oCell.SetVerticalAlign("center");
    oCellContent = oCell.GetContent();
    oParagraph = oCellContent.GetElement(0);
    oParagraph.SetJc("center");
    oParagraph.AddText("All Projects");
    oParagraph.AddLineBreak();
    oParagraph.AddText("Pending");

    oCell = oRow.GetCell(1);
    oCell.SetWidth("twips", 2674);
    oCell.SetShd("clear", 0, 0, 0, true);
    oCell.SetVerticalAlign("center");
    oCellContent = oCell.GetContent();
    oCellContent.RemoveAllElements();
    oCell.SetCellMarginTop(150);
    var oInnerTable = Api.CreateTable(3, 3);
    oCellContent.AddElement(0, oInnerTable);
    oInnerTable.SetStyle(oTableGridStyle);
    oInnerTable.SetWidth("twips", 2448);
    oInnerTable.SetTableLook(true, true, false, false, true, false);
    var oMergeCells = [];
    oRow = oInnerTable.GetRow(0);
    if(oRow)
    {
        oRow.SetHeight("atLeast", 201);
        oCell = oRow.GetCell(0);
        if (oCell)
        {
            oMergeCells.push(oCell);
        }
        oCell = oRow.GetCell(1);
        if (oCell)
        {
            oCell.SetWidth("twips", 865);
            oCell.SetShd("clear", 189, 227, 100, false);
            oCellContent = oCell.GetContent();
            oParagraph = oCellContent.GetElement(0);
            oParagraph.AddText("West");
        }
        oCell = oRow.GetCell(2);
        if (oCell)
        {
            oCell.SetWidth("twips", 1092);
            oCell.SetShd("clear", 225, 245, 174, false);
            oCellContent = oCell.GetContent();
            oParagraph = oCellContent.GetElement(0);
            oParagraph.AddText("Approved");
        }
    }
    oRow = oInnerTable.GetRow(1);
    if (oRow)
    {
        oRow.SetHeight("atLeast", 196);
        oCell = oRow.GetCell(0);
        if (oCell)
        {
            oMergeCells.push(oCell);
        }

        oCell = oRow.GetCell(1);
        if (oCell)
        {
            oCell.SetWidth("twips", 865);
            oCell.SetShd("clear", 189, 227, 100, false);
            oCellContent = oCell.GetContent();
            oParagraph = oCellContent.GetElement(0);
            oParagraph.AddText("Central");
        }
        oCell = oRow.GetCell(2);
        if (oCell)
        {
            oCell.SetWidth("twips", 1092);
            oCell.SetShd("clear", 225, 245, 174, false);
            oCellContent = oCell.GetContent();
            oParagraph = oCellContent.GetElement(0);
            oParagraph.AddText("Pending");
        }
    }
    oRow = oInnerTable.GetRow(2);
    if (oRow)
    {
        oRow.SetHeight("atLeast", 196);
        oCell = oRow.GetCell(0);
        if (oCell)
        {
            oMergeCells.push(oCell);
        }
        oCell = oRow.GetCell(1);
        if (oCell)
        {
            oCell.SetWidth("twips", 865);
            oCell.SetShd("clear", 189, 227, 100, false);
            oCellContent = oCell.GetContent();
            oParagraph = oCellContent.GetElement(0);
            oParagraph.AddText("East");
        }
        oCell = oRow.GetCell(2);
        if (oCell)
        {
            oCell.SetWidth("twips", 1092);
            oCell.SetShd("clear", 225, 245, 174, false);
            oCellContent = oCell.GetContent();
            oParagraph = oCellContent.GetElement(0);
            oParagraph.AddText("Approved");
        }
    }
    var oMergedCell = oInnerTable.MergeCells(oMergeCells);
    oMergedCell.SetVerticalAlign("center");
    oMergedCell.SetTextDirection("btlr");
    oMergedCell.SetWidth("twips", 491);
    oMergedCell.SetShd("clear", 177, 217, 84, false);
    oCellContent = oMergedCell.GetContent();
    oParagraph = oCellContent.GetElement(0);
    oParagraph.SetIndLeft(113);
    oParagraph.SetIndRight(113);
    oParagraph.SetJc("center");
    oRun = oParagraph.AddText("USA");
    oRun.SetBold(true);
}

oParagraph = Api.CreateParagraph();
oDocument.Push(oParagraph);
oTextPr = oParagraph.GetParagraphMarkTextPr();
oTextPr.SetColor(0xff, 0x00, 0x00);
oTextPr.SetFontFamily("Segoe UI");

oSection1.SetTitlePage(true);
oDocContent = oSection1.GetHeader("default", true);
oTable = Api.CreateTable(2, 1);
oDocContent.AddElement(0, oTable);
oTable.SetWidth("auto");
oTable.SetJc("right");
oTable.SetTableLook(true, true, false, false, true, false);

oRow = oTable.GetRow(0);
if (oRow)
{
    oRow.SetHeight("atLeast", 792);
    oCell = oRow.GetCell(0);
    if (oCell)
    {
        oCell.SetWidth("twips", 7337);
        oCell.SetVerticalAlign("bottom");
        oCellContent = oCell.GetContent();
        oParagraph = oCellContent.GetElement(0);
        oParagraph.SetStyle("Header");
        oParagraph.SetJc("right");
        oTextPr = oParagraph.GetParagraphMarkTextPr();
        oTextPr.SetFontFamily("Calibri Light");
        oTextPr.SetFontSize(28);
        oRun = oParagraph.AddText("ONLYOFFICE Document Builder");
        oRun.SetSmallCaps(true);
        oRun.SetFontSize(32);
        oRun.SetFontFamily("Calibri Light");
    }
    oCell = oRow.GetCell(1);
    if (oCell)
    {
        oCell.SetWidth("twips", 792);
        oCell.SetShd("clear", 0x3D, 0x4A, 0x6B);
        oCell.SetVerticalAlign("center");
        oCellContent = oCell.GetContent();
        oParagraph = oCellContent.GetElement(0);
        oParagraph.SetStyle("Header");
        oParagraph.SetJc("center");
        oParagraph.GetParagraphMarkTextPr().SetColor(0xff, 0xff, 0xff);
        oRun = oParagraph.AddPageNumber();
        oRun.SetColor(0xff, 0xff, 0xff);
    }
}

oDocContent = oSection1.GetFooter("default", true);
oTable = Api.CreateTable(2, 1);
oDocContent.AddElement(0, oTable);
oTable.SetWidth("auto");
oTable.SetJc("right");
oTable.SetTableLook(true, true, false, false, true, false);
oRow = oTable.GetRow(0);
if (oRow)
{
    oCell = oRow.GetCell(0);
    if (oCell)
    {
        oCell.SetWidth("auto");
        oCellContent = oCell.GetContent();
        oParagraph = oCellContent.GetElement(0);
        oParagraph.SetStyle(oFooterStyle);
        oParagraph.SetJc("right");
        oParagraph.AddText("ONLYOFFICE Document Builder");
        oParagraph.AddText(" | Confidential");
    }
    oCell = oRow.GetCell(1);
    if (oCell)
    {
        oCell.SetWidth("auto");
        oCellContent = oCell.GetContent();
        oParagraph = oCellContent.GetElement(0);
        oParagraph.SetStyle(oFooterStyle);
        oParagraph.SetJc("right");
        oDrawing = Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/onlyoffice_logo.png", 495300, 481965);
        oDrawing.SetWrappingStyle("inline");
        oParagraph.AddDrawing(oDrawing);
    }
}

oParagraph.SetStyle(oFooterStyle);

var oElement = oDocument.Last();
oElement.Delete();

// builder.SaveFile("docx", "Formal document.docx");
// builder.CloseFile();
```
