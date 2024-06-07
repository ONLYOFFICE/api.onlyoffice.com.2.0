builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph with the font set to small capitalized letters.");
oParagraph.SetSmallCaps(true);
builder.SaveFile("docx", "SetSmallCaps.docx");
builder.CloseFile();
