builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFunction = Api.GetWorksheetFunction();
oWorksheet.GetRange("A1").SetValue(oFunction.REPT("Text", 3));
builder.SaveFile("xlsx", "REPT.xlsx");
builder.CloseFile();