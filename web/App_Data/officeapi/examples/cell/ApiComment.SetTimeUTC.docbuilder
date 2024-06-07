builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("1");
var oRange = oWorksheet.GetRange("A1");
var oComment = oRange.AddComment("This is just a number.", "John Smith");
oComment.SetTimeUTC(Date.now());
oWorksheet.GetRange("A3").SetValue("Timestamp UTC: " + oComment.GetTimeUTC());
builder.SaveFile("xlsx", "SetTimeUTC.xlsx");
builder.CloseFile();