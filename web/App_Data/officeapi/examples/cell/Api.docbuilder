builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
var oFillColor = Api.CreateColorFromRGB(201, 222, 255);
oWorksheet.GetRange("A1:M6").SetFillColor(oFillColor);
oWorksheet.GetRange("A1:M6").SetBold(true);
oWorksheet.GetRange("A7:A11").SetBold(true);
oWorksheet.GetRange("A21:M22").SetFillColor(oFillColor);

oFillColor = Api.CreateColorFromRGB(232, 240, 252);
oWorksheet.GetRange("A1").SetColumnWidth(14);
oWorksheet.GetRange("B1:M1").SetColumnWidth(7);
oWorksheet.GetRange("A1:A4").SetRowHeight(27);
var oImage = oWorksheet.AddImage("https://api.onlyoffice.com/content/img/docbuilder/examples/api-cell.png", 28 * 36000, 28 * 36000, 5, 0, 0, 0);

var oRange = oWorksheet.GetRange("C4:J4");
oRange.Merge(false);
oRange.SetValue("Annual Results");
oRange.SetFontSize(24);
oRange = oWorksheet.GetRange("C5:J5");
oRange.Merge(false);
oRange.SetValue("(in thousands of USD)");
oRange.SetFontSize(12);
oRange = oWorksheet.GetRange("C4:J5");
oRange.SetAlignHorizontal("center");
oRange.SetFontColor(Api.CreateColorFromRGB(64, 135, 247));
oRange.SetBorders("Top", "Thick", Api.CreateColorFromRGB(64, 135, 247));
oWorksheet.GetRange("A4:M5").SetBorders("Bottom", "Thick", Api.CreateColorFromRGB(64, 135, 247));

for (var i = 8; i <= 10; i++) {
  if (i%2 === 0) {
    oRange = oWorksheet.GetRange(`A${i}:M${i}`);
    oRange.SetFillColor(oFillColor);
  }
}

oWorksheet.GetRange("A6:M10").SetValue([
  ["City/Month", "Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"],
  ["Beijing", 361.06, 484.37, 318.96, 230.41, 219.15, 229.92, 431.04, 224.24, 396.48, 373.76, 361.06, 419.46],
  ["Jinan", 382.77, 375.40, 439.87, 238.76, 138.84, 240.92, 388.12, 299.67, 326.89, 379.88, 382.77, 481.45],
  ["Haujou", 348.05, 399.41, 303.55, 311.43, 148.70, 219.52, 450.96, 270.40, 371.74, 378.89, 348.05, 501.98],
  ["Macau", 354.52, 366.52, 342.87, 382.48, 222.50, 304.50, 388.09, 233.51, 346.43, 392.74, 354.52, 468.08],
]);

oWorksheet.GetRange("B6:M10").SetAlignHorizontal("center");
oWorksheet.GetRange("B6:M10").SetNumberFormat("$#,##0");

oWorksheet.GetRange("G11:I15").SetValue([
  ["","=B6","=M6"],
  ["=A7","=B7","=M7"],
  ["=A8","=B8","=M8"],
  ["=A9","=B9","=M9"],
  ["=A10","=B10","=M10"]
]);

var sheetName = oWorksheet.GetName();
oWorksheet.GetRange("G11:I15").SetNumberFormat("$#,##0");
var oChart = oWorksheet.AddChart(`'${sheetName}'!$A$6:$M$10`, true, "lineNormal", 1, 100 * 36000, 50 * 36000, 0, 0, 10, 0);
oChart.SetTitle("Financial Overview (in thousands of USD)", 10);
oChart.SetLegendPos("left");

oChart = oWorksheet.AddChart(`'${sheetName}'!$G$11:$I$15`, true, "bar", 2, 100 * 36000, 50 * 36000, 6, 0, 10, 0);
oChart.SetTitle("Year start VS Year End (in thousands of USD)", 10);
oChart.SetLegendPos("left");
Api.Save();
builder.SaveFile("xlsx", "Api.xlsx");
builder.CloseFile();
