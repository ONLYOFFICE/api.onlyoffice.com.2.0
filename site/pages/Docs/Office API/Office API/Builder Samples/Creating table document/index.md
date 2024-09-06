

Create a document with a styled table filled with array-based values:
* create an empty document with a table (Api, ApiDocument/CreateTable)
* create a custom style for the table (ApiDocument/GetStyle, ApiStyle, ApiTableCellPr, ApiTableRow);
* populate the table with the array-based data cell by cell (ApiTableCell).

```js document-builder={"documentType": "word", "editorConfig": {"customization": {"zoom": 60}}}
// builder.CreateFile("docx")
const oDocument = Api.GetDocument()
const headers = ["ID", "Year", "Region", "2023 Revenue", "2024 Revenue", "% Change"]
const data = [
  ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
  ["2023", "2023", "2023", "2023", "2024", "2024", "2024", "2024", "2024"],
  ["East", "South", "North", "East", "North", "South", "West", "North", "East"],
  ["$80.191", "$80.773", "$59.151", "$39.120", "$68.622", "$98.019", "$84.410", "$95.739", "92.511"],
  ["$83.021", "$93.056", "$75.716", "$34.295", "$68.622", "$122.714", "$30.670", "$138.856", "92.019"],
  ["4%", "15%", "27%", "-14%", "0%", "25%", "-64%", "45%", "-0.5%"],
]

const oTable = Api.CreateTable(6, 10)
oTable.SetWidth("percent", 100)
const oTableStyle = oDocument.CreateStyle("CustomTableStyle", "table")
oTableStyle.SetBasedOn(oDocument.GetStyle("Bordered"))
const oTableCellPr = oTableStyle.GetTableCellPr()
oTableCellPr.SetCellMarginTop(40)
oTableCellPr.SetCellMarginBottom(40)
oTable.SetStyle(oTableStyle)

const oTableRow = oTable.GetRow(0)
oTableRow.SetBackgroundColor(75, 136, 209, false)
for (let i = 0; i < 6; i += 1) {
  const oCell = oTable.GetRow(0).GetCell(i)
  oCell.SetVerticalAlign("center")
  const oCellContent = oCell.GetContent()
  const oParagraph = oCellContent.GetElement(0)
  oParagraph.AddText(headers[i])
  oParagraph.SetColor(255, 255, 255, false)
  oParagraph.SetBold(true)
  oParagraph.SetJc("center")
}

for (let i = 1; i < 10; i += 1) {
  const oRow = oTable.GetRow(i)
  let byte
  if (i % 2 === 0) {
    byte = 225
  } else {
    byte = 245
  }
  oRow.SetBackgroundColor(byte, byte, byte, false)
  for (let j = 0; j < 6; j += 1) {
    const oCell = oTable.GetRow(i).GetCell(j)
    oCell.SetVerticalAlign("center")
    const oCellContent = oCell.GetContent()
    oParagraph = oCellContent.GetElement(0)
    oParagraph.AddText(data[j][i - 1])
    oParagraph.SetJc("center")
    setTextColor(oParagraph, data[j][i - 1])
  }
}

function setTextColor(oParagraph, value) {
  if (value.includes("%") !== -1) {
    if (value.includes("-") !== -1) {
      oParagraph.SetColor(173, 35, 28)
    } else {
      oParagraph.SetColor(28, 173, 52)
    }
  }
}
oDocument.Push(oTable)
// builder.SaveFile("docx", "SetBackgroundColor.docx")
// builder.CloseFile()
```