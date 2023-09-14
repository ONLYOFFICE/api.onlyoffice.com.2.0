builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetShd("clear", 255, 111, 61);
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text with the shading set to orange.");
builder.SaveFile("docx", "SetShd.docx");
builder.CloseFile();
