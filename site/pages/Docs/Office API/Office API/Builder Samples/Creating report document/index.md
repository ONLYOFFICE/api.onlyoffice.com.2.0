Create reports on all the comments added to the document and on every change which was made to the document in the review mode:

* open the created file (Api/GetDocument);
* get the comments and review reports and save them to the global variable (ApiDocument/GetCommentsReport, ApiDocument/GetReviewReport);
* create a table for the comments/review report and fill it in with the data from the global variable (Api/CreateParagraph, Api/CreateTable, ApiDocument/Push, ApiDocumentContent/GetElement, ApiParagraph/AddText, ApiTable/GetRow, ApiTable/MergeCells, ApiTableCell/GetContent, ApiTableRow/GetCell);
* edit text style in the table (ApiDocument/GetStyle, ApiRun/SetColor, ApiRun/SetStrikeout).

```js document-builder={"documentType": "word", "editorConfig": {"customization": {"zoom": 60}}}
builder.OpenFile("https://api.onlyoffice.com/app_data/officeapi/sample-files/document_review_mode.docx")

let oDocument = Api.GetDocument()
GlobalVariable["CommentsReport"] = oDocument.GetCommentsReport()
GlobalVariable["ReviewReport"] = oDocument.GetReviewReport()

builder.CloseFile()

builder.CreateFile("docx")

const oCommentsReport = GlobalVariable["CommentsReport"]
const oReviewReport = GlobalVariable["ReviewReport"]

oDocument = Api.GetDocument()
let oParagraph = Api.CreateParagraph()
oDocument.Push(oParagraph)
oParagraph.AddText("Comments report")

let nRows = 1
for (const sUserName in oCommentsReport) {
  nRows += oCommentsReport[sUserName].length
}

let nCols = 6
let oTable = Api.CreateTable(nCols, nRows)
oDocument.Push(oTable)

function privateFillCell(nCurRow, nCurCol, sText) {
  const oRow = oTable.GetRow(nCurRow)
  const oCell = oRow.GetCell(nCurCol)
  const oCellContent = oCell.GetContent()
  const oRun = oCellContent.GetElement(0).AddText(sText)
  return {Cell: oCell, Run: oRun}
}

privateFillCell(0, 0, "Name")
privateFillCell(0, 1, "Date")
privateFillCell(0, 2, "")
privateFillCell(0, 3, "Solved")
privateFillCell(0, 4, "Text")
privateFillCell(0, 5, "Quote text")

let nCurRow = 1
for (sUserName in oCommentsReport) {
  const arrUserComments = oCommentsReport[sUserName]
  const arrCells = []
  for (let nIndex = 0, nCount = arrUserComments.length; nIndex < nCount;
    nIndex += 1, nCurRow += 1) {
    const oCommentInfo = oCommentsReport[sUserName][nIndex]
    arrCells.push(privateFillCell(nCurRow, 0, "").Cell)
    privateFillCell(nCurRow, 1, new Date(oCommentInfo["Date"]).toString())
    let value2
    if (oCommentInfo["IsAnswer"] === true) {
      value2 = "answer"
    } else {
      value2 = "comment"
    }
    privateFillCell(nCurRow, 2, value2)

    if (oCommentInfo["IsAnswer"] !== true) {
      let value3
      if (oCommentInfo["IsSolved"] === true) {
        value3 = "yes"
        privateFillCell(nCurRow, 3, value3).Run.SetColor(0, 255, 0)
      } else {
        value3 = "no"
        privateFillCell(nCurRow, 3, value3).Run.SetColor(255, 0, 0)
      }
    }

    let value4
    if (oCommentInfo["CommentMessage"]) {
      value4 = oCommentInfo["CommentMessage"]
    } else {
      value4 = ""
    }
    privateFillCell(nCurRow, 4, value4)

    let value5
    if (oCommentInfo["QuoteText"]) {
      value5 = oCommentInfo["QuoteText"]
    } else {
      value5 = ""
    }
    privateFillCell(nCurRow, 5, value5)
  }

  const oMergedCell = oTable.MergeCells(arrCells)
  if (oMergedCell) {
    const oCellContent = oMergedCell.GetContent()
    oCellContent.GetElement(0).AddText(sUserName)
  } else if (arrCells.length !== 0) {
    oCellContent = arrCells[0].GetContent()
    oCellContent.GetElement(0).AddText(sUserName)
  }
}
oTable.SetStyle(oDocument.GetStyle("Bordered"))

oParagraph = Api.CreateParagraph()
oDocument.Push(oParagraph)
oParagraph.AddText("Review report")

nRows = 1
for (sUserName in oReviewReport) {
  nRows += oReviewReport[sUserName].length
}

nCols = 4
oTable = Api.CreateTable(nCols, nRows)
oDocument.Push(oTable)

privateFillCell(0, 0, "Name")
privateFillCell(0, 1, "Date")
privateFillCell(0, 2, "Action")
privateFillCell(0, 3, "")

nCurRow = 1
for (sUserName in oReviewReport) {
  const arrUserChanges = oReviewReport[sUserName]
  arrCells = []
  for (nIndex = 0, nCount = arrUserChanges.length; nIndex < nCount; nIndex += 1, nCurRow += 1) {
    const oChangeInfo = arrUserChanges[nIndex]
    arrCells.push(privateFillCell(nCurRow, 0, "").Cell)
    privateFillCell(nCurRow, 1, new Date(oChangeInfo["Date"]).toString())
    const sType = oChangeInfo["Type"]
    if (sType === "TextAdd") {
      privateFillCell(nCurRow, 2, "Added text")
      privateFillCell(nCurRow, 3, oChangeInfo["Value"])
    } else if (sType === "TextRem") {
      privateFillCell(nCurRow, 2, "Removed text")
      privateFillCell(nCurRow, 3, oChangeInfo["Value"]).Run.SetStrikeout(true)
    } else if (sType === "TextPr") {
      privateFillCell(nCurRow, 2, "Formatted text")
    } else if (sType === "ParaAdd") {
      privateFillCell(nCurRow, 2, "Added paragraph")
    } else if (sType === "ParaRem") {
      privateFillCell(nCurRow, 2, "Removed paragraph")
    } else if (sType === "ParaPr") {
      privateFillCell(nCurRow, 2, "Formatted paragraph")
    } else {
      privateFillCell(nCurRow, 2, "Unknown change")
    }
  }
  oMergedCell = oTable.MergeCells(arrCells)
  if (oMergedCell) {
    oCellContent = oMergedCell.GetContent()
    oCellContent.GetElement(0).AddText(sUserName)
  } else if (arrCells.length !== 0) {
    const oCellContent = arrCells[0].GetContent()
    oCellContent.GetElement(0).AddText(sUserName)
  }
}
oTable.SetStyle(oDocument.GetStyle("Bordered"))

builder.SaveFile("docx", "Report.docx")
builder.CloseFile()
```
