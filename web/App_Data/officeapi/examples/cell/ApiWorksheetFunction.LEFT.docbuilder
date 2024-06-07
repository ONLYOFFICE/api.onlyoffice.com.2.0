builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFunction = Api.GetWorksheetFunction();
oWorksheet.GetRange("A1").SetValue(oFunction.LEFT("Online Office", 6));
builder.SaveFile("xlsx", "LEFT.xlsx");
builder.CloseFile();