builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFunction = Api.GetWorksheetFunction();
oWorksheet.GetRange("A1").SetValue(oFunction.FIXED(1234.9, 1, false));
builder.SaveFile("xlsx", "FIXED.xlsx");
builder.CloseFile();