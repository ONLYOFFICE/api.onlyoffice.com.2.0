builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("1");
var oRange = oWorksheet.GetRange("A1");
var oComment = oRange.AddComment("This is just a number.", "John Smith");
oComment.SetTime(Date.now());
oWorksheet.GetRange("A3").SetValue("Timestamp: " + oComment.GetTime());
builder.SaveFile("xlsx", "SetTime.xlsx");
builder.CloseFile();