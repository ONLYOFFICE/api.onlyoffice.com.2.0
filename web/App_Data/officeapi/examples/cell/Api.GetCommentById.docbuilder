builder.CreateFile("xlsx");
var oComment = Api.AddComment("Comment", "John Smith");
var sId = oComment.GetId();
oComment = Api.GetCommentById(sId);
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("Commet Text: " + oComment.GetText());
oWorksheet.GetRange("A2").SetValue("Commet Author: " + oComment.GetAuthorName());
builder.SaveFile("xlsx", "GetCommentById.xlsx");
builder.CloseFile();