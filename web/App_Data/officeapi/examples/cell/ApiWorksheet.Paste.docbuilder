builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oRange = oWorksheet.GetRange("A1");
oRange.SetValue("This is a sample text which is copied to the clipboard.");
oRange.Copy();
var oCopiedRange = oWorksheet.GetRange("A2");
oWorksheet.Paste(oCopiedRange);
builder.SaveFile("xlsx", "Paste.xlsx");
builder.CloseFile();