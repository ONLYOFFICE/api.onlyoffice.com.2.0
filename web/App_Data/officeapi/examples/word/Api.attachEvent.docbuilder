builder.CreateFile("docx");
Api.attachEvent("asc_onHyperlinkClick", function() {
	console.log("HYPERLINK!!!");
});
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oRun = Api.CreateRun();
oRun.AddText("ONLYOFFICE Document Builder");
oParagraph.AddElement(oRun);
oParagraph.AddHyperlink("https://api.onlyoffice.com/docbuilder/basic", "docbuilder");
oParagraph.AddLineBreak();
oParagraph.AddText("When you click on a hyperlink from this document, the 'HYPERLINK!!!' message appears in the console log.");
builder.SaveFile("docx", "attachEvent.docx");
builder.CloseFile();