builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var sPageCount = oDocument.GetPageCount();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Number of pages: " + sPageCount);
builder.SaveFile("docx", "GetPageCount.docx");
builder.CloseFile();