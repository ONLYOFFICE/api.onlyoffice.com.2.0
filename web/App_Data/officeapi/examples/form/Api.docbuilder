builder.CreateFile("pdf");
var oDocument = Api.GetDocument();

function addTextToParagraph(oParagraph, text, fontSize, isBold) {
    var oRun = Api.CreateRun();
    var oTextPr = oRun.GetTextPr();
    oTextPr.SetFontSize(fontSize);
    oTextPr.SetBold(isBold);
    oRun.AddText(text);
    oParagraph.AddElement(oRun);
};

function addTextFormToParagraph(oParagraph, fontSize, key, placeholder, maxCharacters, jc) {
    var oTextForm = Api.CreateTextForm({ "key": key, "required": true, "comb": false, placeholder: placeholder, "maxCharacters": maxCharacters, "multiLine": false, "autoFit": true });
    oParagraph.AddElement(oTextForm);
    oParagraph.SetFontSize(fontSize);
    oParagraph.SetJc(jc);
};

var oDrawing = Api.CreateImage("https://api.onlyoffice.com/content/img/docbuilder/examples/form-template.png", 210 * 36000, 300 * 36000);
oDrawing.SetHorAlign("page", "left");
oDrawing.SetVerAlign("page", "top");
oDrawing.SetWrappingStyle("behind");
oDocument.GetElement(0).AddDrawing(oDrawing);

var oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingBefore(1500);
addTextToParagraph(oParagraph, "CERTIFICATE", 70, true);
oParagraph.AddLineBreak();
addTextToParagraph(oParagraph, "OF ACHIVEMENT", 50, false);
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingBefore(500);
addTextToParagraph(oParagraph, "This certificate is presented to ", 40, false);
oParagraph.AddLineBreak();
addTextFormToParagraph(oParagraph, 40, "Full name", "Full name", 40, "left");
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingBefore(300);
addTextFormToParagraph(oParagraph, 35, "Description", "Description of the certificate", 200, "left");
oParagraph.SetSpacingAfter(1000);
oDocument.Push(oParagraph);

var oTable = Api.CreateTable(1, 2);
oTable.SetWidth("percent", 30);
oTable.SetTableBorderTop("single", 4, 0, 253, 253, 255);
oTable.SetTableBorderBottom("single", 4, 0, 253, 253, 255);
oTable.SetTableBorderLeft("single", 4, 0, 255, 253, 255);
oTable.SetTableBorderRight("single", 4, 0, 253, 253, 255);
var oCell = oTable.GetRow(0).GetCell(0);
oCell.SetCellBorderBottom("single", 5, 0, 51, 51, 51);

oCell = oTable.GetRow(1).GetCell(0);
oParagraph = oCell.GetContent().GetElement(0);
addTextFormToParagraph(oParagraph, 35, "Issued by", "Issued by", 20, "center");

oDocument.Push(oTable);
Api.Save();
builder.SaveFile("pdf", "Certificate.pdf");
builder.CloseFile();