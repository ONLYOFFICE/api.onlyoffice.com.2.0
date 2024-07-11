---
order: -1
layout: part
preview: /assets/images/docs-preview.png
description: ONLYOFFICE Docs is a collaborative office suite that includes editors for text documents, spreadsheets, presentations, fillable forms, and PDFs.
summary: In this section, you will learn how to bring document editing and co-authoring to your web app users, set up, configure and integrate ONLYOFFICE Docs, extend its functionality using your own plugins/macros, and integrate document editors into the desktop applications. You will also find the information on how to use Document Builder to generate documents easily without running document editors.
sample:
  syntax: js
  code: |
    oTextForm = Api.CreateTextForm({
      key: "Date of Birth",
      placeholder: "DDMMYYYY",
      comb: true
    })

    oLogoForm.SetImage("https://example.com/blank.png")

    oParagraph.AddElement(oTextForm)
    oParagraph.AddElement(oLogoForm)
    oDocument.Push(oParagraph)

    Api.Save()
    builder.SaveFile("oform", "University.docxf")
    builder.CloseFile()
help:
  faq: http://0.0.0.0/
  issues: http://0.0.0.0/
  forum: http://0.0.0.0/
---
