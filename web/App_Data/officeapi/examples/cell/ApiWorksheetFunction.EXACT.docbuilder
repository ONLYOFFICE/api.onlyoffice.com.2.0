builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFunction = Api.GetWorksheetFunction();
oWorksheet.GetRange("A1").SetValue(oFunction.EXACT("MyPassword", "mypassword"));
builder.SaveFile("xlsx", "EXACT.xlsx");
builder.CloseFile();