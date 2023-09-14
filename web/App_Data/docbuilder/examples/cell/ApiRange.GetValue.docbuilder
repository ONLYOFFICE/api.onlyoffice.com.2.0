builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("1");
var sValue = oWorksheet.GetRange("A1").GetValue();
oWorksheet.GetRange("A3").SetValue("Value of the cell A1: ");
oWorksheet.GetRange("B3").SetValue(sValue);
builder.SaveFile("xlsx", "GetValue.xlsx");
builder.CloseFile();
