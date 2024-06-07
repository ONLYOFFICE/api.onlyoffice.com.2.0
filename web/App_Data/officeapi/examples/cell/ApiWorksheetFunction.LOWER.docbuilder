builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFunction = Api.GetWorksheetFunction();
oWorksheet.GetRange("A1").SetValue(oFunction.LOWER("Day"));
builder.SaveFile("xlsx", "LOWER.xlsx");
builder.CloseFile();