builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetHighlight("lightGray");
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text highlighted with light gray color using the text properties.");
builder.SaveFile("docx", "SetHighlight.docx");
builder.CloseFile();
