builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("ONLYOFFICE Document Builder");
Api.AddComment(oParagraph, "ONLYOFFICE for developers", "Jane", "uid-1");
builder.SaveFile("docx", "AddComment.docx");
builder.CloseFile();
