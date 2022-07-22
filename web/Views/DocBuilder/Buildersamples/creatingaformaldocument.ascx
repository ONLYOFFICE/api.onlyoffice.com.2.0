<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Creating a formal document</span>
</h1>

<div class="header-gray">Description</div>

<p>Create a document following the structure of a formal paper:</p>
<ul>
    <li>create a title page with a document heading and subtitle (<a href="<%= Url.Action("textdocumentapi/api") %>">Api</a>,
        <a href="<%= Url.Action("textdocumentapi/apidocumentcontent") %>">ApiDocumentContent</a>, <a href="<%= Url.Action("textdocumentapi/apidrawing") %>">ApiDrawing</a>);</li>
    <li>create different styles for the document text, heading, subtitle, table, footer (<a href="<%= Url.Action("textdocumentapi/apiparapr") %>">ApiParaPr</a>,
        <a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>, <a href="<%= Url.Action("textdocumentapi/apitable") %>">ApiTable</a>,
        <a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>, <a href="<%= Url.Action("textdocumentapi/apitablepr") %>">ApiTablePr</a>,
        <a href="<%= Url.Action("textdocumentapi/apitablerow") %>">ApiTableRow</a>, <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>);</li>
    <li>structure the document by marking up its section: set columns for text and pictures, set page size and margins, create header and footer
        (<a href="<%= Url.Action("textdocumentapi/apidocument") %>">ApiDocument</a>, <a href="<%= Url.Action("textdocumentapi/apisection") %>">ApiSection</a>);</li>
    <li>fill the document with text, dividing it into separate fragments and highlighting them with headings
        (<a href="<%= Url.Action("textdocumentapi/apiparagraph") %>">ApiParagraph</a>, <a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>);</li>
    <li>add images and charts to represent document text (<a href="<%= Url.Action("textdocumentapi/api") %>">Api</a>,
        <a href="<%= Url.Action("textdocumentapi/apichart") %>">ApiChart</a>).</li>
</ul>

<div class="header-gray">Script</div>
<br />

<textarea readonly="readonly" id="builderScript" name="builderScript" class="builder-code">
    builder.CreateFile("docx");

    var oParagraph, oRun, oDrawing, oParaMark;
    var oDocument     = Api.GetDocument();

    var oNoSpacingStyle = oDocument.GetStyle("No Spacing");
    var oFinalSection   = oDocument.GetFinalSection();
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
    oDrawing = Api.CreateImage("data:image/jpeg;base64,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", 720725, 1204595);
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
            oDrawing = Api.CreateImage("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPoAAAD6CAYAAACI7Fo9AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MTNGODdFREI0Mzc1MTFFNjgwNTNBRURFNDZCNzBCOUEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MTNGODdFREM0Mzc1MTFFNjgwNTNBRURFNDZCNzBCOUEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDoxM0Y4N0VEOTQzNzUxMUU2ODA1M0FFREU0NkI3MEI5QSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDoxM0Y4N0VEQTQzNzUxMUU2ODA1M0FFREU0NkI3MEI5QSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PsJGrH0AACE/SURBVHja7J1nbJ1X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", 495300, 481965);
            oDrawing.SetWrappingStyle("inline");
            oParagraph.AddDrawing(oDrawing);
        }
    }

    oParagraph.SetStyle(oFooterStyle);

    var oElement = oDocument.Last();
    oElement.Delete();

    builder.SaveFile("docx", "sample1.docx");
    builder.CloseFile();
</textarea>

<a style="text-decoration: none;" href="<%= Url.Content("~/content/document/sample1.docx") %>" download="">
    <button type="submit" id="generateButton" class="builder-run">
        Generate<br />
        document
    </button>
</a>

<div class="header-gray">Result</div>

<div class="img-block-3">
    <div>
        <img alt="Formal document 1" src="<%= Url.Content("~/content/img/docbuilder/formal-document-1.png") %>" />
    </div>
    <div>
        <img alt="Formal document 2" src="<%= Url.Content("~/content/img/docbuilder/formal-document-2.png") %>" />
    </div>
    <div>
        <img alt="Formal document 3" src="<%= Url.Content("~/content/img/docbuilder/formal-document-3.png") %>" />
    </div>
</div>
