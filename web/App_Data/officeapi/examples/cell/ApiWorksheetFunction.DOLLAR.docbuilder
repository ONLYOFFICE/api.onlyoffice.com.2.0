builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFunction = Api.GetWorksheetFunction();
oWorksheet.GetRange("A1").SetValue(oFunction.DOLLAR(98.9997, 3));
builder.SaveFile("xlsx", "DOLLAR.xlsx");
builder.CloseFile();