builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
var oRange = oDocument.GetRange(10, 24);
oRange.SetSmallCaps(true);
builder.SaveFile("docx", "SetSmallCaps.docx");
builder.CloseFile();
