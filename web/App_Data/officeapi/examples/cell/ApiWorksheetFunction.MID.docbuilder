builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFunction = Api.GetWorksheetFunction();
oWorksheet.GetRange("A1").SetValue(oFunction.MID("Online Office", 3, 4));
builder.SaveFile("xlsx", "MID.xlsx");
builder.CloseFile();