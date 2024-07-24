---
order: -4
---


**ONLYOFFICE Document Builder** is a C++ library used to create and edit Office Open XML format files (documents, spreadsheets and presentations) and save them to DOCX, XSLX, PPTX and PDF formats.

It allows you to build a document easily without the need to actually run a document processing editor. It also allows the developers to automate document building using the templates you create or inserting the data from some database of yours into a document or a set of documents. It has all the features of a common document editor but is lightweight and can be easily integrated into your document management system, CRM system, etc. using its [JavaScript API](/officeapi/basic).

## How to use

There are two ways to use ONLYOFFICE Document Builder in your own project:

1. Integrate this library into your own application. To get ONLYOFFICE Document Builder, visit [this page](/docbuilder/getbuilder).

   After you download and unpack the files, the library is ready for [integration](/docbuilder/framework).

2. Use [Builder.App](/docbuilder/integrationapi/default), the provided executive binary wrapper for an easy start. The latest versions of executable files can always be downloaded [here](https://www.onlyoffice.com/document-builder.aspx?from=api). After the file download, run it and see the examples of how ONLYOFFICE Document Builder can be used without the need to write any application.

## Document Builder components

ONLYOFFICE Document Builder consists of four components:

| Component                                                | Description                                                                                                                                                                                                                                                                                   |
| -------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Builder.Framework](/docbuilder/framework)               | A software tool that contains a collection of libraries, classes, and functions that are used to develop applications. Currently, the following frameworks are available: [C++](/docbuilder/integrationapi/c), [COM](/docbuilder/integrationapi/com), [.Net](/docbuilder/integrationapi/net). |
| [Builder.App](/docbuilder/integrationapi/default)        | The *docbuilder.exe* executable file which can be run from your application with the *.docbuilder* script file as a parameter to it.                                                                                                                                                          |
| [Builder.Server](/docbuilder/integratingdocumentbuilder) | The code for the sample of ONLYOFFICE Document Builder integration into your application                                                                                                                                                                                                      |

\


This is the live examples of how **ONLYOFFICE Document Builder** works.

* Generate a document from your script
* Create a document with your data

Use the script in the textarea below as is to generate the document or you edit it in the textarea window. Or, in case you have a script of your own, use the **Upload your own script** button under the textarea to upload it.

builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Dear John Smith.");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("ONLYOFFICE is glad to announce that starting today, you are appointed Commercial director to the company of your dream.");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oRun = Api.CreateRun();
oRun.SetBold(true);
oRun.AddText("Please note: ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.AddText("this text is used to demonstrate the possibilities of ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetBold(true);
oRun.AddText("ONLYOFFICE Document Builder");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.AddText(" and cannot be used as real appointment to the position in any real company.");
oParagraph.AddElement(oRun);
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Best regards,");
oParagraph.AddLineBreak();
oParagraph.AddText("ONLYOFFICE Document Builder Team");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SampleText.docx");
builder.CloseFile(); Generate\
document

[Upload your own script]()

Fill the data into the text areas below so that it could appear in the output document. When done use the buttons to the right of the fields to create the appropriate document type with your entered data.

Name: John Smith Company: ONLYOFFICE Position/Title: Commercial director

Create\
spreadsheet Create\
document

## Get help

If you have any questions or feature requests about ONLYOFFICE Document Builder, please visit [GitHub](https://github.com/ONLYOFFICE/DocumentBuilder/issues).

You can also ask our developers on [ONLYOFFICE forum](https://forum.onlyoffice.com/c/document-builder/37) (registration required).
