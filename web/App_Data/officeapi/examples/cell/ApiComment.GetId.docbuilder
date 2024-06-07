builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A1").SetValue("1");
var oRange = oWorksheet.GetRange("A1");
oRange.AddComment("This is just a number.");
oWorksheet.GetRange("A3").SetValue("Comment Id: ");
oWorksheet.GetRange("B3").SetValue(oRange.GetComment().GetId());
builder.SaveFile("xlsx", "GetId.xlsx");
builder.CloseFile();