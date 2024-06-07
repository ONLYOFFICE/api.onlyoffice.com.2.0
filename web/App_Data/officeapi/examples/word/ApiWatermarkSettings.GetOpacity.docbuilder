builder.CreateFile("docx");
var oDocument = Api.GetDocument();
oDocument.InsertWatermark("Watermark", true);
var oSettings = oDocument.GetWatermarkSettings();
var nOpacity = oSettings.GetOpacity();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Watermark opacity: "+ nOpacity);
builder.SaveFile("docx", "GetOpacity.docx");
builder.CloseFile();