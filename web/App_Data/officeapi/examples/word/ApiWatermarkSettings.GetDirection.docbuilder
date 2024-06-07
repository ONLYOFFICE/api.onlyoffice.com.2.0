builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.InsertWatermark("Watermark", true);
var oSettings = oDocument.GetWatermarkSettings();
var sDirection = oSettings.GetDirection();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Watermark direction: " + sDirection);
builder.SaveFile("docx", "GetDirection.docx");
builder.CloseFile();