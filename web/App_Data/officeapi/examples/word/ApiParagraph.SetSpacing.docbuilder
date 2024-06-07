builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is just a sample paragraph.");
oParagraph.SetSpacing(2);
builder.SaveFile("docx", "SetSpacing.docx");
builder.CloseFile();
