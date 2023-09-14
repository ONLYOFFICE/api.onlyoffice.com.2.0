builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.SetPrintHeadings(true);
oWorksheet.GetRange("A1").SetValue("Row and column headings will be printed with this page: " + oWorksheet.GetPrintHeadings());
builder.SaveFile("xlsx", "SetPrintHeadings.xlsx");
builder.CloseFile();