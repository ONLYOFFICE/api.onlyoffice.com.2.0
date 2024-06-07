builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("1");
var oRange = oWorksheet.GetRange("A1");
var oComment = oRange.AddComment("This is just a number.", "John Smith");
oComment.SetUserId("uid-2");
oWorksheet.GetRange("A3").SetValue("Comment's user Id: " + oComment.GetUserId());
builder.SaveFile("xlsx", "SetUserId.xlsx");
builder.CloseFile();