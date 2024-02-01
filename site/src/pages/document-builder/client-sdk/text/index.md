---
title: Text Document
layout: page/page.webc
order: -3
---
# Structure of a text document

Although a text document consists of various elements, most of them are nested in each other and three main elements can be outlined: *paragraph*, *table* and *block content control*. All the other elements are a part of these three larger ones.

The text itself can be added directly to a paragraph, block content control, inline text content control, range or table cell, which is a part of a table structure. But, for the sake of convenience (as it is always easier to work with smaller blocks than with larger ones) the text is usually divided into small text portions called *runs*. Each paragraph can consist either of only one text run or have dozens of them inside, depending on the paragraph complexity.

The text runs, in their turn, have text itself and other elements which can be a part of text: *images*, *shapes*, *charts*.

Besides the text runs, paragraphs can also contain *inline text content controls* and *hyperlinks*.

A table has a little bit more complex structure, as it comprises *table rows*, which in their turn include *table cells* within their structure. *Table cells* can have the whole *paragraph*, *table* or *block content control* structure inside them.

A block content control can also contain the *paragraph*, *table* or another *block content control* inside it.

Thus any text document structure with **ONLYOFFICE Document Builder** API used to create it can be outlined like this:

**ONLYOFFICE Document Builder API**

Document and document elements creation:\
[Api](/docbuilder/textdocumentapi/api)

Document

The main document properties, global color and fill/stroke settings, styles used throughout the document:\
[ApiDocumentContent](/docbuilder/textdocumentapi/apidocumentcontent), [ApiDocument](/docbuilder/textdocumentapi/apidocument), [ApiStyle](/docbuilder/textdocumentapi/apistyle), [ApiFill](/docbuilder/textdocumentapi/apifill), [ApiStroke](/docbuilder/textdocumentapi/apistroke), [ApiGradientStop](/docbuilder/textdocumentapi/apigradientstop), [ApiUniColor](/docbuilder/textdocumentapi/apiunicolor), [ApiPresetColor](/docbuilder/textdocumentapi/apipresetcolor), [ApiRGBColor](/docbuilder/textdocumentapi/apirgbcolor), [ApiSchemeColor](/docbuilder/textdocumentapi/apischemecolor)

Section

Document section properties:\
[ApiSection](/docbuilder/textdocumentapi/apisection)

Paragraph

Common paragraph properties, common text properties, current paragraph properties, paragraph numbering:\
[ApiParaPr](/docbuilder/textdocumentapi/apiparapr), [ApiTextPr](/docbuilder/textdocumentapi/apitextpr), [ApiParagraph](/docbuilder/textdocumentapi/apiparagraph), [ApiNumbering](/docbuilder/textdocumentapi/apinumbering), [ApiNumberingLevel](/docbuilder/textdocumentapi/apinumberinglevel)

Text run

Common text properties, current text run properties:\
[ApiTextPr](/docbuilder/textdocumentapi/apitextpr), [ApiRun](/docbuilder/textdocumentapi/apirun)

Image

Common object properties, current image properties:\
[ApiDrawing](/docbuilder/textdocumentapi/apidrawing), [ApiImage](/docbuilder/textdocumentapi/apiimage)

Chart

Common object properties, current chart properties:\
[ApiDrawing](/docbuilder/textdocumentapi/apidrawing), [ApiChart](/docbuilder/textdocumentapi/apichart)

Shape

Common object properties, current shape properties:\
[ApiDrawing](/docbuilder/textdocumentapi/apidrawing), [ApiShape](/docbuilder/textdocumentapi/apishape).

If a place for text is provided inside the shape, the whole paragraph structure can be inserted into it.

Inline text content control

Common text properties, current inline text content control properties:\
[ApiTextPr](/docbuilder/textdocumentapi/apitextpr), [ApiInlineLvlSdt](/docbuilder/textdocumentapi/apiinlinelvlsdt)

Text run

Inline text content control

Hyperlink

Hyperlink

Current hyperlink properties:\
[ApiHyperlink](/docbuilder/textdocumentapi/apihyperlink)

Table

Common table styles, common table properties, current table properties:\
[ApiTableStylePr](/docbuilder/textdocumentapi/apitablestylepr), [ApiTablePr](/docbuilder/textdocumentapi/apitablepr), [ApiTable](/docbuilder/textdocumentapi/apitable)

Table row

Common table row properties, current table row properties:\
[ApiTableRowPr](/docbuilder/textdocumentapi/apitablerowpr), [ApiTableRow](/docbuilder/textdocumentapi/apitablerow)

Table cell

Common table cell properties, current table row properties:\
[ApiTableCellPr](/docbuilder/textdocumentapi/apitablecellpr), [ApiTableCell](/docbuilder/textdocumentapi/apitablecell)

Paragraph

Table

Block content control

Table cell

Common table cell properties, current table row properties:\
[ApiTableCellPr](/docbuilder/textdocumentapi/apitablecellpr), [ApiTableCell](/docbuilder/textdocumentapi/apitablecell)

Paragraph

Table

Block content control

Block content control

Common text properties, current block content control properties:\
[ApiTextPr](/docbuilder/textdocumentapi/apitextpr), [ApiBlockLvlSdt](/docbuilder/textdocumentapi/apiblocklvlsdt)

Paragraph

Table

Block content control

Range

Common text properties, current range properties:\
[ApiTextPr](/docbuilder/textdocumentapi/apitextpr), [ApiRange](/docbuilder/textdocumentapi/apirange)

Paragraph

Table

Block content control

 

## Creating a new text document

The simplest example text document with a single paragraph containing centered "Center" text can be built with the help of **ONLYOFFICE Document Builder** using the following code:

```
builder.CreateFile("docx");                 // create a text document file in the .docx format with ONLYOFFICE Document Builder
var oDocument = Api.GetDocument();          // create a new 'oDocument' variable and get the created text document contents
var oParagraph;                             // create the 'oParagraph' variable
oParagraph = Api.CreateParagraph();         // create a new paragraph
oParagraph.SetJc("center");                 // set the paragraph justification to center the text
oParagraph.AddText("Center");               // add a text containing a single 'Center' word to the paragraph
oDocument.Push(oParagraph);                 // push the created paragraph contents with the 'Center' word to the document
builder.SaveFile("docx", "example.docx");   // save the resulting text document as a file in the .docx format with the 'example.docx' name
builder.CloseFile();                        // close the text document file and finish work with ONLYOFFICE Document Builder
```

Actually in the above example the created text document will have two paragraphs, as the first paragraph is created by default for an empty text document, i.e. a new empty text document always contains at least one paragraph. You can address the first paragraph to change it using the *Api.GetElement(0)* method, so that line 4 of the above code looked like this:

```
oParagraph = oDocument.GetElement(0);
```

and line 7 (*oDocument.Push(oParagraph);*) is not needed.

## Opening an existing text document

If you want to edit an already existing text document, you can open it using **ONLYOFFICE Document Builder**, get its elements and change them however you need. The only difference from a document editor in this case will be that you will not need this text document editor. The document is opened the following way:

```
builder.OpenFile("https://example.com/mydocument.docx");        // use a path to an existing 'mydocument.docx' text document file to open it with ONLYOFFICE Document Builder
var oDocument = Api.GetDocument();          // create a new 'oDocument' variable and get the created text document contents
var oParagraph;                             // create the 'oParagraph' variable
oParagraph = oDocument.GetElement(0);       // get the contents of the document first paragraph
oParagraph.SetJc("center");                 // set the paragraph justification to center the text
oParagraph.AddText("Center");               // add a text containing a single 'Center' word to the paragraph
builder.SaveFile("docx", "example.docx");   // save the resulting text document as a file in the .docx format with a new 'example.docx' name
builder.CloseFile();                        // close the text document file and finish work with ONLYOFFICE Document Builder
```

As you can see you just need to use the *builder.OpenFile();* method of the [CDocBuilder](/docbuilder/integrationapi/cdocbuilder) class with the path to the necessary text document as an argument to open it. In the above example we open **mydocument.docx** document, get its first paragraph and change the text in it to the centered "Center" text. The same way any other text document element can be changed.

Use the appropriate API documentation sections to find out which methods allow you to change certain document and spreadsheet element formatting properties.
