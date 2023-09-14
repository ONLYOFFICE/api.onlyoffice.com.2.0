builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFormat = Api.Format("123456", ["$#,##0"]);
oWorksheet.GetRange("A1").SetValue(oFormat);
builder.SaveFile("xlsx", "Format.xlsx");
builder.CloseFile();
