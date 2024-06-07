builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("1");
var oRange = oWorksheet.GetRange("A1");
var oComment = oRange.AddComment("This is just a number.", "John Smith");
oComment.SetSolved(true);
oWorksheet.GetRange("A3").SetValue("Comment is solved: " + oComment.IsSolved());
builder.SaveFile("xlsx", "SetSolved.xlsx");
builder.CloseFile();