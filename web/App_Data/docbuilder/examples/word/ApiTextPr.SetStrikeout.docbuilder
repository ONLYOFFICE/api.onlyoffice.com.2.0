builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetStrikeout(true);
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text struck out with a single line.");
builder.SaveFile("docx", "SetStrikeout.docx");
builder.CloseFile();
