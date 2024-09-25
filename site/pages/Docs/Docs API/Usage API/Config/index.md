---
order: -4
---

The config base section allows to change the platform type used, document display size (width and height) and type of the document opened.

## documentType

Defines the document type to be opened:

- **word** - text document (*.doc, .docm, .docx, .dot, .dotm, .dotx, .epub, .fb2, .fodt, .htm, .html, .mht, .mhtml, .odt, .ott, .rtf, .stw, .sxw, .txt, .wps, .wpt, .xml*);
- **cell** - spreadsheet (*.csv, .et, .ett, .fods, .ods, .ots, .sxc, .xls, .xlsb, .xlsm, .xlsx, .xlt, .xltm, .xltx, .xml*);
- **slide** - presentation (*.dps, .dpt, .fodp, .odp, .otp, .pot, .potm, .potx, .pps, .ppsm, .ppsx, .ppt, .pptm, .pptx, .sxi*);
- **pdf** - portable document format (*.djvu, .docxf, .oform, .oxps, .pdf, .xps*).

Type: string

Example: "cell"

> **text**, **spreadsheet** and **presentation** values are deprecated since version 6.1. Please use new values instead.

## height

Defines the document height (**100%** by default) in the browser window.

Type: string

Example: "100%"

## token

Defines the encrypted signature added to the **ONLYOFFICE Docs** config in the form of a [token](../../Additional%20API/Signature/Browser/index.md).

Type: string

Example: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.LwimMJA3puF3ioGeS-tfczR3370GXBZMIL-bdpu4hOU"

## type

Defines the platform type used to access the document. Can be:

- **desktop** - optimized to access the document from a desktop or laptop computer;
- **mobile** - optimized to access the document from a tablet or a smartphone;
- **embedded** - specifically formed to be easily embedded into a web page.

The default value is **desktop**.

Type: string

Example: "desktop"

## width

Defines the document width (**100%** by default) in the browser window.

Type: string

Example: "100%"

**Example**

## Example

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  documentType: "word",
  type: "desktop",
  height: "550px",
  width: "100%",
  token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.LwimMJA3puF3ioGeS-tfczR3370GXBZMIL-bdpu4hOU",
})
```
