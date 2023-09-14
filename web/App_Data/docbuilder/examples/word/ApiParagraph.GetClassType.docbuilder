builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var sClassType = oParagraph.GetClassType();
oParagraph.AddText("Class Type = " + sClassType);
builder.SaveFile("docx", "GetClassType.docx");
builder.CloseFile();
