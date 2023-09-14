builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRangeByNumber(1, 2).SetValue("42");
builder.SaveFile("xlsx", "GetRangeByNumber.xlsx");
builder.CloseFile();
