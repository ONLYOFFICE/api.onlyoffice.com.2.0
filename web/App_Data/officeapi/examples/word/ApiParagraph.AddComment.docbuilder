builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is just a sample paragraph.");
oParagraph.AddLineBreak();
oParagraph.AddText("The comment was added to this document.");
oParagraph.AddComment("comment", "Jane", "uid-1");
builder.SaveFile("docx", "AddComment.docx");
builder.CloseFile();
