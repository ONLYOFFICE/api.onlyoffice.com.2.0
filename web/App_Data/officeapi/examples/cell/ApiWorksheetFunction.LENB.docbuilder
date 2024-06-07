builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFunction = Api.GetWorksheetFunction();
oWorksheet.GetRange("A1").SetValue(oFunction.LENB("Online Office"));
builder.SaveFile("xlsx", "LENB.xlsx");
builder.CloseFile();