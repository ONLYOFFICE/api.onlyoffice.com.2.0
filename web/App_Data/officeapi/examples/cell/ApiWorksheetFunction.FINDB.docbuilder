builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFunction = Api.GetWorksheetFunction();
oWorksheet.GetRange("A1").SetValue(oFunction.FINDB("line", "Online Office"));
builder.SaveFile("xlsx", "FINDB.xlsx");
builder.CloseFile();