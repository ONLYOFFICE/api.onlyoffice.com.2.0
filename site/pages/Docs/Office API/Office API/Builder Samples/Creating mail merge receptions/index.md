Run the mail merge process for the current document:

* load mail merge data from the opened <em>xlsx</em> file to the current document (Api/LoadMailMergeData);
* run the mail merge process for the current document (Api/MailMerge).

```js document-builder={"documentType": "word", "editorConfig": {"customization": {"zoom": 60}}}
builder.OpenFile("https://api.onlyoffice.com/app_data/officeapi/sample-files/mail_merge_data.xlsx")
GlobalVariable["MailMergeData"] = Api.GetMailMergeData(0)
builder.CloseFile()

builder.OpenFile("https://api.onlyoffice.com/app_data/officeapi/sample-files/mail_template.docx")
Api.LoadMailMergeData(GlobalVariable["MailMergeData"])
Api.MailMerge()

builder.SaveFile("docx", "Mail merge result.docx")
builder.CloseFile()
```