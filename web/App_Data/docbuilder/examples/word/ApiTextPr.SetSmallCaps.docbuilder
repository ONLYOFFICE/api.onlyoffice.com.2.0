builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetSmallCaps(true);
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the font set to small capitalized letters.");
builder.SaveFile("docx", "SetSmallCaps.docx");
builder.CloseFile();
