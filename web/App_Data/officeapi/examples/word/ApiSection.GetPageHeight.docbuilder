builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oSection = oDocument.GetFinalSection();
var nHeight = oSection.GetPageHeight();
oParagraph.AddText("Page height = " + nHeight);
builder.SaveFile("docx", "GetPageHeight.docx");
builder.CloseFile();
