builder.CreateFile("xlsx");
Api.AddComment("Comment 1", "John Smith");
Api.AddComment("Comment 2", "Mark Potato" );
var arrComments = Api.GetComments();
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("Comment text: " + arrComments[0].GetText());
oWorksheet.GetRange("A2").SetValue("Comment author: " + arrComments[0].GetAuthorName());
builder.SaveFile("xlsx", "AddComment.xlsx");
builder.CloseFile();