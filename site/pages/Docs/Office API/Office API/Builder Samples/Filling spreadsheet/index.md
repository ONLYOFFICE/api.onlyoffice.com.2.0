Fill an empty spreadsheet with the data stored in arrays:

* create a loop for columns and nest another loop for rows;
* get each cell (ApiWorksheet/GetRangeByNumber) and set the corresponding value from the data array (ApiRange/SetValue).

Check Exchanging data among files and Using command line arguments to learn more options for passing external data in the DocBuilder script.
This sample is available for the **C++ and .Net DocBuilder Frameworks**.
Download the sample and get more information on the [Builder framework samples](../../../../Document%20Builder/Builder%20Framework/Builder%20framework%20samples/index.md) page.

```js document-builder={"documentType": "word", "editorConfig": {"customization": {"zoom": 60}}}
builder.CreateFile("xlsx")
const oWorksheet = Api.GetActiveSheet()
const sHeaders = ["ID", "Product", "Price", "Available"]
const sData = [
  ["D51s15", "D83a01", "D14s09", "D60a12"],
  ["Soda", "Granola", "Donuts", "Cake"],
  [2.5, 12.1, 19.9, 48.1],
  ["true", "true", "false", "true"],
]

let i = 0
for (const header of sHeaders) {
  oWorksheet.GetRangeByNumber(0, i).SetValue(header)
  let j = 0
  for (const data of sData[i]) {
    oWorksheet.GetRangeByNumber(j + 1, i).SetValue(data)
    j += 1
  }
  i += 1
}

builder.SaveFile("xlsx", "Spreadsheet with data.xlsx")
builder.CloseFile()
```