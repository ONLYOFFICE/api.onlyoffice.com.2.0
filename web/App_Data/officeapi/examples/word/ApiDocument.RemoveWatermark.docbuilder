builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.InsertWatermark("Watermark", true);
oDocument.RemoveWatermark();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A watermark was removed from this document.");
builder.SaveFile("docx", "RemoveWatermark.docx");
builder.CloseFile();