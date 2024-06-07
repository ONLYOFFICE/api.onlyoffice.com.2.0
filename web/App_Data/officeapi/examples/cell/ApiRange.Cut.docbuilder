builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oRange = oWorksheet.GetRange("A1");
oRange.SetValue("This is a sample text which is cut from the A1 cell and pasted to the A2 cell.");
oRange.Cut(oWorksheet.GetRange("A2"));
builder.SaveFile("xlsx", "Cut.xlsx");
builder.CloseFile();