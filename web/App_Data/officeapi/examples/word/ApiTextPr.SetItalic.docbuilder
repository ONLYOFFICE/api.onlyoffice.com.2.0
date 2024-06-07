builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetItalic(true);
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the font set to italicized letters using the text properties.");
builder.SaveFile("docx", "SetItalic.docx");
builder.CloseFile();
