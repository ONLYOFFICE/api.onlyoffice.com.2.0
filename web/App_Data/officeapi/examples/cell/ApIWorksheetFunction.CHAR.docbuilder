builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFunction = Api.GetWorksheetFunction();
oWorksheet.GetRange("A1").SetValue(oFunction.CHAR(234));
builder.SaveFile("xlsx", "CHAR.xlsx");
builder.CloseFile();