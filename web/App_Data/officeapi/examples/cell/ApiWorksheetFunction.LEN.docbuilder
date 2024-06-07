builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFunction = Api.GetWorksheetFunction();
oWorksheet.GetRange("A1").SetValue(oFunction.LEN("Online Office"));
builder.SaveFile("xlsx", "LEN.xlsx");
builder.CloseFile();