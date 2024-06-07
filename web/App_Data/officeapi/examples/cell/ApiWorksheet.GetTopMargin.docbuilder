builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var nTopMargin = oWorksheet.GetTopMargin();
oWorksheet.GetRange("A1").SetValue("Top margin: " + nTopMargin + " mm");
builder.SaveFile("xlsx", "GetTopMargin.xlsx");
builder.CloseFile();
