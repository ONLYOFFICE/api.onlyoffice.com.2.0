builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetRightMargin(20.8);
var nRightMargin = oWorksheet.GetRightMargin();
oWorksheet.GetRange("A1").SetValue("Right margin: " + nRightMargin + " mm");
builder.SaveFile("xlsx", "SetRightMargin.xlsx");
builder.CloseFile();
