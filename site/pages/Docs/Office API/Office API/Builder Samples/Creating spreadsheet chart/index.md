Creates a custom chart filled with array-based values in the spreadsheet:

* create a spreadsheet and fill top cells with data (ApiRange/SetValue);
* create a chart using the data (ApiWorksheet/AddChart);
* customize the chart (ApiChart/SetTitle,ApiChart/SetLegendPos);

```js document-builder={"documentType": "word", "editorConfig": {"customization": {"zoom": 60}}}
builder.CreateFile("xlsx")
const oWorksheet = Api.GetActiveSheet()
const sHeaders = ["Year", "Revenue South dept", "Revenue West dept"]
const sData = [
  ["Q1 2022", "Q2 2022", "Q3 2022", "Q4 2022", "Q1 2023", "Q2 2023", "Q3 2023"],
  ["14512", "15502", "13897", "11110", "13906", "12023", "11274"],
  ["9201", "10338", "8937", "11680", "15516", "18095", "18251"],
]

let i = 0
for (const header of sHeaders) {
  oWorksheet.GetRangeByNumber(i, 0).SetValue(header)
  let j = 0
  for (const data of sData[i]) {
    oWorksheet.GetRangeByNumber(i, j + 1).SetValue(data)
    j += 1
  }
  i += 1
}

oWorksheet.GetRange("B2:H3").SetNumberFormat("$#,##0")
oWorksheet.GetRange("A1").SetColumnWidth(18)
oWorksheet.GetRange("B1:H3").SetAlignHorizontal("left")
const sheetName = oWorksheet.GetName()
const oChart = oWorksheet.AddChart(`'${sheetName}'!$A$1:$H$3`, true, "lineNormal", 1, 153 * 36_000, 50 * 36_000, 0, 0, 4, 0)
oChart.SetTitle("Financial Overview (in thousands of USD)", 10)
oChart.SetLegendPos("left")
Api.Save()
```