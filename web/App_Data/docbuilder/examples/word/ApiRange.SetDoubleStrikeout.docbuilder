builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Server Builder");
var oRange = oDocument.GetRange(18, 23);
oRange.SetDoubleStrikeout(true);
builder.SaveFile("docx", "SetDoubleStrikeout.docx");
builder.CloseFile();
