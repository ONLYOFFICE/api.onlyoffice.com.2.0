builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("1");
var oRange = oWorksheet.GetRange("A1");
var oComment = oRange.AddComment("This is just a number.", "John Smith");
oComment.SetAuthorName("Mark Potato");
oWorksheet.GetRange("A3").SetValue("Comment's author: " + oComment.GetAuthorName());
builder.SaveFile("xlsx", "SetAuthorName.xlsx");
builder.CloseFile();