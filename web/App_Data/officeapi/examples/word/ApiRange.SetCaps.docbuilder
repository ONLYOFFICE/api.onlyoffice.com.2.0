builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
var oRange = oDocument.GetRange(10, 17);
oRange.SetCaps(true);
builder.SaveFile("docx", "SetCaps.docx");
builder.CloseFile();
