Run the mail merge process for the current document:

- load mail merge data from the opened <em>xlsx</em> file to the current document (Api/LoadMailMergeData);
- run the mail merge process for the current document (Api/MailMerge).

```ts document-builder={"document": {"url": "https://api.onlyoffice.com/app_data/officeapi/sample-files/mail_template.docx"}, "documentType": "word", "editorConfig": {"customization": {"zoom": 60}}}
// builder.OpenFile("https://api.onlyoffice.com/app_data/officeapi/sample-files/mail_merge_data.xlsx")
// GlobalVariable["MailMergeData"] = Api.GetMailMergeData(0)
// builder.CloseFile()

Api.LoadMailMergeData(GlobalVariable["MailMergeData"])
Api.MailMerge()
```
