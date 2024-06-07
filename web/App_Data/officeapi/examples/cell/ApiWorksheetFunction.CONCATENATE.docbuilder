builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFunction = Api.GetWorksheetFunction();
oWorksheet.GetRange("A1").SetValue(oFunction.CONCATENATE("John", " ", "Adams"));
builder.SaveFile("xlsx", "CONCATENATE.xlsx");
builder.CloseFile();