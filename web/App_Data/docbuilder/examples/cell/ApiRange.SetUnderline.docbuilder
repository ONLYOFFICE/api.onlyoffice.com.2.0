builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2").SetValue("The text underlined with a single line");
oWorksheet.GetRange("A2").SetUnderline("single");
oWorksheet.GetRange("A4").SetValue("Normal text");
builder.SaveFile("xlsx", "SetUnderline.xlsx");
builder.CloseFile();
