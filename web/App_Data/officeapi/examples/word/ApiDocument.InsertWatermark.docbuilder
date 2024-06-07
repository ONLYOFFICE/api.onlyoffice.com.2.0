builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A watermark was inserted into this document.");
oDocument.InsertWatermark("Watermark", true);
builder.SaveFile("docx", "InsertWatermark.docx");
builder.CloseFile();
