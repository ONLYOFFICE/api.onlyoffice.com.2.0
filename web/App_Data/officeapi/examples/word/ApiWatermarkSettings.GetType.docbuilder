builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.InsertWatermark("Watermark", true);
var oSettings = oDocument.GetWatermarkSettings();
var sType = oSettings.GetType();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Watermark type: " + sType);
builder.SaveFile("docx", "GetType.docx");
builder.CloseFile();