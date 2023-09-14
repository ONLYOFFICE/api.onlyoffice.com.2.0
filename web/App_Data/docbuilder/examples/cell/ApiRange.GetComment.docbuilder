builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oRange = oWorksheet.GetRange("A1");
oRange.SetValue("1");
oRange.AddComment("This is just a number.");
oWorksheet.GetRange("A3").SetValue("Comment: " + oRange.GetComment().GetText());
builder.SaveFile("xlsx", "GetComment.xlsx");
builder.CloseFile();
