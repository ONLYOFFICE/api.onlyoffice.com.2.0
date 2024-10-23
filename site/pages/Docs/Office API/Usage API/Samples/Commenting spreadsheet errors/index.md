This script checks all used cells for formula errors like "#DIV/0!" and comments each error:

- open an existing spreadsheet file to check for errors;
- create a loop for columns and nest another loop for rows;
- get each cell (ApiWorksheet/GetRangeByNumber) and check the value for errors;
- comment the cell (ApiRange/AddComment) if an error exists.

This sample is available for the **C++ and .Net DocBuilder Frameworks**.
Download the sample and get more information on the [Builder framework samples](../../../../Document%20Builder/Builder%20Framework/Builder%20framework%20samples/index.md) page.

```ts document-builder={"document": {"url": "https://static.onlyoffice.com/assets/docs/samples/data_with_errors.xlsx"}, "documentType": "cell", "editorConfig": {"customization": {"zoom": 60}}}
const oWorksheet = Api.GetActiveSheet()
const data = oWorksheet.GetRange("A:G").GetValue()
for (let row = 0; row < data.length; row += 1) {
  for (let column = 0; column < data[0].length; column += 1) {
    const cell = data[row][column]
    if (cell.indexOf("#") === 0) {
      const comment = `Error "${cell}"`
      oWorksheet.GetRangeByNumber(row, column).AddComment(comment)
    }
  }
}
```
