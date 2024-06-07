builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2").SetValue("2");
var oRange = oWorksheet.GetRange("A1:D5");
oRange.SetFontSize(20);
builder.SaveFile("xlsx", "SetFontSize.xlsx");
builder.CloseFile();
