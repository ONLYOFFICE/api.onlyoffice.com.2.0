<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Creating advanced oForm</span>
</h1>

<p class="dscr">This example shows advanced <b>Document Builder</b> oForm use cases.<br><a href="<%= Url.Action("howitworks/filloform", "docbuilder") %>">Filling oForm</a> and <a href="<%= Url.Action("howitworks/readoform", "docbuilder") %>">Reading oForm</a> examples reffer to the current example.</p>

<div class="header-gray">Document Builder script</div>
<pre>
builder.CreateFile("docx");
var oDocument = Api.GetDocument();

function addTextFormToParagraph(oParagraph, fontSize, key, placeholder, maxCharacters, jc, comb, border) {
    var oTextForm = Api.CreateTextForm({ "key": key, "required": true, "comb": comb, placeholder: placeholder, "maxCharacters": maxCharacters, "multiLine": false, "autoFit": true });
    if (border) oTextForm.SetBorderColor(200, 200, 200);
    oParagraph.AddElement(oTextForm);
    oParagraph.SetFontSize(fontSize);
    oParagraph.SetJc(jc);
}

function setBordres(oTable, color) {
    oTable.SetTableBorderTop("single", 4, 0, color, color, color);
    oTable.SetTableBorderBottom("single", 4, 0, color, color, color);
    oTable.SetTableBorderLeft("single", 4, 0, color, color, color);
    oTable.SetTableBorderRight("single", 4, 0, color, color, color);
    oTable.SetTableBorderInsideV("single", 4, 0, color, color, color);
    oTable.SetTableBorderInsideH("single", 4, 0, color, color, color);
}

function addTextToParagraph(oParagraph, text, fontSize, isBold) {
    oParagraph.AddText(text);
    oParagraph.SetFontSize(fontSize);
    oParagraph.SetBold(isBold);
}

function getTableCellParagraph(oTable, row, col) {
    return oTable.GetCell(row, col).GetContent().GetElement(0);
}

function createFullWidthTable(rows, cols, borderColor) {
    var oTable = Api.CreateTable(cols, rows);
    oTable.SetWidth("percent", 100);
    setBordres(oTable, borderColor);
    return oTable;
}

var oTable = createFullWidthTable(1, 2, 255);
var oParagraph = getTableCellParagraph(oTable, 0, 0);
addTextToParagraph(oParagraph, "PURCHASE ORDER", 36, true);
oParagraph = getTableCellParagraph(oTable, 0, 1);
addTextToParagraph(oParagraph, "Serial # ", 25);
addTextFormToParagraph(oParagraph, 25, "Serial", " ", 5, "left", true);
oDocument.Push(oTable);

var oParagraph = Api.CreateParagraph();
var oPictureForm = Api.CreatePictureForm({ "key": "Photo", "tip": "Upload Company Logo", "required": true, "placeholder": "Photo", "scaleFlag": "tooBig", "lockAspectRatio": false, "respectBorders": false });
oParagraph.AddElement(oPictureForm);
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
addTextFormToParagraph(oParagraph, 35, "Company Name", "Company Name", 50, "left");
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
addTextToParagraph(oParagraph, "Date: ", 25);
addTextFormToParagraph(oParagraph, 35, "Date", "DD.MM.YYYY", 10, "left", true, true);
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
addTextToParagraph(oParagraph, "To:", 35, true);
oDocument.Push(oParagraph);

var oTable = createFullWidthTable(1, 1, 200);
var oParagraph = getTableCellParagraph(oTable, 0, 0);
addTextFormToParagraph(oParagraph, 30, "Recipient", "Recipient", 32, "left", true);
oDocument.Push(oTable);

var oTable = createFullWidthTable(10, 2, 200);
oTable.GetRow(0).SetBackgroundColor(245, 245, 245, false);
var oCell = oTable.GetCell(0, 0);
oCell.SetWidth("percent", 30);
oParagraph = getTableCellParagraph(oTable, 0, 0);
addTextToParagraph(oParagraph, "Qty.", 30, true);
oParagraph = getTableCellParagraph(oTable, 0, 1);
addTextToParagraph(oParagraph, "Description", 30, true);

for (var i = 1; i < 10; i++) {
    var oParagraph = getTableCellParagraph(oTable, i, 0);
    addTextFormToParagraph(oParagraph, 30, "Qty" + i, " ", 9, "left", true);
    var oParagraph = getTableCellParagraph(oTable, i, 1);
    addTextFormToParagraph(oParagraph, 30, "Description" + i, " ", 22, "left", true);
}
oDocument.Push(oTable);
oDocument.RemoveElement(0);
oDocument.RemoveElement(1);

Api.Save();
builder.SaveFile("oform", "Form.oform");
builder.CloseFile();
</pre>

<p>APIs used: 
    <a href="<%= Url.Action("formapi/api", "docbuilder") %>">API Form</a>,
    <a href="<%= Url.Action("textdocumentapi/apiparagraph", "docbuilder") %>">API Paragraph</a>, 
    <a href="<%= Url.Action("textdocumentapi/apitable", "docbuilder") %>">API Table</a>
</p>
<p>oForm methods used: 
    <a href="<%= Url.Action("formapi/api/createpictureform", "docbuilder") %>">CreatePictureForm</a>, 
    <a href="<%= Url.Action("formapi/api/createtextform", "docbuilder") %>">CreateTextForm</a>
</p>
<div class="header-gray">Result</div>
<br>
<img class="screenshot max-width-832" alt="Compare documents" src="<%= Url.Content("~/content/img/docbuilder/create-advanced-oform-example.png") %>" />