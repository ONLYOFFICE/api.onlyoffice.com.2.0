builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.InsertWatermark("Watermark", true);
var oSettings = oDocument.GetWatermarkSettings();
var sText = oSettings.GetText();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Watermark text: " + sText);
builder.SaveFile("docx", "GetText.docx");
builder.CloseFile();