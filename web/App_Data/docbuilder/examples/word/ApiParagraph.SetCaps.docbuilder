builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph with the font set to capitalized letters.");
oParagraph.SetCaps(true);
builder.SaveFile("docx", "SetCaps.docx");
builder.CloseFile();
