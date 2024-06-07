builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFunction = Api.GetWorksheetFunction();
oWorksheet.GetRange("A1").SetValue(oFunction.NUMBERVALUE("2.500,27", ",", "."));
builder.SaveFile("xlsx", "NUMBERVALUE.xlsx");
builder.CloseFile();