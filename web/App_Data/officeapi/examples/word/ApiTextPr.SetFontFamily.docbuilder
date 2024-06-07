builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetFontFamily("Comic Sans MS");
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the font family set to 'Comic Sans MS' using the text properties.");
builder.SaveFile("docx", "SetFontFamily.docx");
builder.CloseFile();
