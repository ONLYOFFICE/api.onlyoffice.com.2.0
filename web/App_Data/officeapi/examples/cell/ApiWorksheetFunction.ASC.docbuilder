builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFunction = Api.GetWorksheetFunction();
oWorksheet.GetRange("A1").SetValue(oFunction.ASC("text"));
builder.SaveFile("xlsx", "ASC.xlsx");
builder.CloseFile();