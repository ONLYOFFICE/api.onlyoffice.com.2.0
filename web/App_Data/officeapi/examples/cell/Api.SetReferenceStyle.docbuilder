builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
Api.SetReferenceStyle("xlR1C1");
var sReferenceStyle = Api.GetReferenceStyle();
oWorksheet.GetRange("A1").SetValue("The cell reference style: " + sReferenceStyle);
builder.SaveFile("xlsx", "SetReferenceStyle.xlsx");
builder.CloseFile();