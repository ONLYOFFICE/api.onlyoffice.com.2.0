builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetColor(255, 111, 61, false);
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the color set to orange using the text properties.");
builder.SaveFile("docx", "SetColor.docx");
builder.CloseFile();
