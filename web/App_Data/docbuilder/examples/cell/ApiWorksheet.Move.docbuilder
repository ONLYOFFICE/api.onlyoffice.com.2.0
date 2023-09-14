builder.CreateFile("xlsx");
var oSheet1 = Api.GetActiveSheet();
Api.AddSheet("Sheet2");
var oSheet2 = Api.GetActiveSheet();
oSheet2.Move(oSheet1);
builder.SaveFile("xlsx", "Move.xlsx");
builder.CloseFile();