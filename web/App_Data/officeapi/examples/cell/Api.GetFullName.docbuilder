builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var sName = Api.GetFullName();
oWorksheet.GetRange("B1").SetValue("File name: " + sName);
builder.SaveFile("xlsx", "GetFullName.xlsx");
builder.CloseFile();