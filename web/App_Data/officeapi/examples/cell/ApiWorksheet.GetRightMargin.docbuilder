builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var nRightMargin = oWorksheet.GetRightMargin();
oWorksheet.GetRange("A1").SetValue("Right margin: " + nRightMargin + " mm");
builder.SaveFile("xlsx", "GetRightMargin.xlsx");
builder.CloseFile();
