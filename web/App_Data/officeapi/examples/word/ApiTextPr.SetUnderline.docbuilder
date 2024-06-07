builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetUnderline(true);
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text underlined with a single line.");
builder.SaveFile("docx", "SetUnderline.docx");
builder.CloseFile();
