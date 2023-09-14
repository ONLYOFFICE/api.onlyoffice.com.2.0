builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var sName = Api.GetFullName();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("File name: " + sName);
builder.SaveFile("docx", "GetFullName.docx");
builder.CloseFile();