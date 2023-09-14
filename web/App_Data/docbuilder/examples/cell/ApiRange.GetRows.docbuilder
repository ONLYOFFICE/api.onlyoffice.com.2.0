builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oRange = oWorksheet.GetRange("1:3");
for (let i=1; i <= 3; i++) {
    var oRows = oRange.GetRows(i);    
    oRows.SetValue(i);
}
builder.SaveFile("xlsx", "GetRows.xlsx");
builder.CloseFile();
