builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("A2").SetValue("The sheet settings make it display no gridlines");
oWorksheet.SetDisplayGridlines(false);
builder.SaveFile("xlsx", "SetDisplayGridlines.xlsx");
builder.CloseFile();
