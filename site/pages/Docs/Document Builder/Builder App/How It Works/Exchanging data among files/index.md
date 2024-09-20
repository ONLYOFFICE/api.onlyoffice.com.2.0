---
order: -2
---

There is always a chance that you will need to exchange the data among the documents. For example, you might need to open some document, copy style from it, or some data values, close the document, create a new one and paste the copied data to it or use it to form some report.

But once you close the file (using the [CDocBuilder.CloseFile](../../../Builder%20Framework/C++/CDocBuilder/CloseFile/index.md) method), all the variable data you worked with will be void and cleared, and you will not be able to use it with any other file.

To exchange the data between the files *GlobalVariable* is introduced.

What you need, is to create a variable in the first opened or created file using the *GlobalVariable* method, e.g.:

``` ts
GlobalVariable["CommentsReport"] = oDocument.GetCommentsReport()
```

Then close the document and open or create a new one where this variable can be used without any problems, e.g.:

``` ts
const oCommentsReport = GlobalVariable["CommentsReport"]
```

The example below shows how *GlobalVariable* is used. For more information visit the ApiDocument.GetCommentsReport and ApiDocument.GetReviewReport sections.

## Example

``` ts
builder.OpenFile("https://example.com/DocumentWithComments.docx")
const oDocument = Api.GetDocument()
GlobalVariable["CommentsReport"] = oDocument.GetCommentsReport()
builder.CloseFile()

builder.CreateFile("docx")
const oCommentsReport = GlobalVariable["CommentsReport"]
// now you can use the 'CommentsReport' variable from the previous document in the current document
builder.SaveFile("docx", "GetCommentsReport.docx")
builder.CloseFile()
```
