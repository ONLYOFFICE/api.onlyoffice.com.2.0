---
title: Spreadsheet
layout: page/page.webc
order: -2
---
# Structure of a spreadsheet

A spreadsheet document has a more simple structure than that of a text document, most of the spreadsheet elements are nested within the *worksheet* element with all the other elements placed on it.

The *cells* can be given various values, some of the cell text properties can also be changed.

The *range* element can contain *areas* and *comments*.

Some drawn objects - *images*, *shapes*, *charts* - can be placed directly to the *worksheet*.

The text that does not pertain to the cell values, can be grouped to *paragraphs* and added to the *shapes*. For the sake of convenience (as it is always easier to work with smaller blocks than with larger ones) the text is usually divided into small text portions called *runs*. Each paragraph can consist either of only one text run or have dozens of them inside, depending on the paragraph complexity.

Thus any spreadsheet document structure with **ONLYOFFICE Document Builder** API used to create it can be outlined like this:

**ONLYOFFICE Document Builder API**

Spreadsheet creation, global color and fill/stroke settings:\
[Api](/docbuilder/spreadsheetapi/api), [ApiFill](/docbuilder/spreadsheetapi/apifill), [ApiBullet](/docbuilder/spreadsheetapi/apibullet), [ApiStroke](/docbuilder/spreadsheetapi/apistroke), [ApiGradientStop](/docbuilder/spreadsheetapi/apigradientstop), [ApiUniColor](/docbuilder/spreadsheetapi/apiunicolor), [ApiPresetColor](/docbuilder/spreadsheetapi/apipresetcolor), [ApiRGBColor](/docbuilder/spreadsheetapi/apirgbcolor), [ApiSchemeColor](/docbuilder/spreadsheetapi/apischemecolor), [ApiName](/docbuilder/spreadsheetapi/apiname)

Worksheet

Sheet name, cell format as table, columng width, charts:\
[ApiWorksheet](/docbuilder/spreadsheetapi/apiworksheet)

Range

Cell text properties, cell text format (color, font family, size, alignment), cell text value:\
[ApiRange](/docbuilder/spreadsheetapi/apirange)

Areas

Current areas properties:\
[ApiAreas](/docbuilder/spreadsheetapi/apiareas)

Comment

Current comment properties:\
[ApiComment](/docbuilder/spreadsheetapi/apicomment)

Image

Common object properties, current image properties:\
[ApiDrawing](/docbuilder/spreadsheetapi/apidrawing), [ApiImage](/docbuilder/spreadsheetapi/apiimage)

Chart

Common object properties, current chart properties:\
[ApiDrawing](/docbuilder/spreadsheetapi/apidrawing), [ApiChart](/docbuilder/spreadsheetapi/apichart)

Shape

Common object properties, current shape properties:\
[ApiDrawing](/docbuilder/spreadsheetapi/apidrawing), [ApiShape](/docbuilder/spreadsheetapi/apishape).

Paragraph

Common paragraph properties, current paragraph properties, paragraph numbering:\
[ApiParaPr](/docbuilder/spreadsheetapi/apiparapr), [ApiParagraph](/docbuilder/spreadsheetapi/apiparagraph)

Text run

Common text properties, current text run properties:\
[ApiTextPr](/docbuilder/spreadsheetapi/apitextpr), [ApiRun](/docbuilder/spreadsheetapi/apirun)

 

## Creating a new spreadsheet

The simplest example spreadsheet with a sheet named 'sheet 1' and the first column 140 pixels wide and A1 cell set to 'New cell' value can be built with the help of **ONLYOFFICE Document Builder** using the following code:

```
builder.CreateFile("xlsx");                      // create a spreadsheet file in the .xlsx format with ONLYOFFICE Document Builder
var oWorksheet = Api.GetActiveSheet();           // create a new 'oWorksheet' variable and get the created spreadsheet contents
oWorksheet.SetName("sheet 1");                   // set the 'sheet 1' name for the current active sheet
oWorksheet.SetColumnWidth(0, 20);                // set the width of the first column to 140 pixels
oWorksheet.GetRange("A1").SetValue("New cell");  // set the 'New cell' value to the A1 spreadsheet cell
builder.SaveFile("xlsx", "example.xlsx");        // save the resulting spreadsheet as a file in the .xlsx format with a new 'example.xlsx' name
builder.CloseFile();                             // close the spreadsheet file and finish work with ONLYOFFICE Document Builder
```

## Opening an existing spreadsheet

If you want to edit an already existing spreadsheet, you can open it using **ONLYOFFICE Document Builder**, get its elements and change them however you need. The only difference from a spreadsheet editor in this case will be that you will not need this spreadsheet editor. The spreadsheet is opened the following way:

```
builder.OpenFile("https://example.com/myspreadsheet.xlsx");          // use a path to an existing 'myspreadsheet.xlsx' spreadsheet file to open it with ONLYOFFICE Document Builder
var oWorksheet = Api.GetActiveSheet();           // create a new 'oWorksheet' variable and get the created spreadsheet contents
oWorksheet.SetName("sheet 1 renamed");           // set the 'sheet 1 renamed' name for the current active sheet
oWorksheet.SetColumnWidth(0, 20);                // set the width of the first column to 140 pixels
oWorksheet.GetRange("A1").SetValue("New cell");  // set the 'New cell' value to the A1 spreadsheet cell
builder.SaveFile("xlsx", "example.xlsx");        // save the resulting spreadsheet as a file in the .xlsx format with a new 'example.xlsx' name
builder.CloseFile();                             // close the spreadsheet file and finish work with ONLYOFFICE Document Builder
```

As you can see you just need to use the *builder.OpenFile();* method of the [CDocBuilder](/docbuilder/integrationapi/cdocbuilder) class with the path to the necessary spreadsheet as an argument to open it. In the above example we open **myspreadsheet.xlsx** spreadsheet, get its first sheet and change the sheet name, first column width and enter the new value into its A1 cell. The same way any other spreadsheet element can be changed.

Use the appropriate API documentation sections to find out which methods allow you to change certain document and spreadsheet element formatting properties.
