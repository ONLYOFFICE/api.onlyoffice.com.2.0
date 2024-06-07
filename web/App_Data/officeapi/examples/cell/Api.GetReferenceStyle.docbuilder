builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var sReferenceStyle = Api.GetReferenceStyle();
oWorksheet.GetRange("A1").SetValue("The cell reference style: " + sReferenceStyle);
builder.SaveFile("xlsx", "GetReferenceStyle.xlsx");
builder.CloseFile();