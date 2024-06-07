builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFunction = Api.GetWorksheetFunction();
oWorksheet.GetRange("A1").SetValue(oFunction.FIND("line", "Online Office"));
builder.SaveFile("xlsx", "FIND.xlsx");
builder.CloseFile();