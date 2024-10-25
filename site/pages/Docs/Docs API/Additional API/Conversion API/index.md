For the interaction with the **document conversion service** the POST requests are used. The request parameters are entered in JSON format in the request body. The requests are sent to the `https://documentserver/converter` address where **documentserver** is the name of the server with the ONLYOFFICE Docs installed.

> Please note that prior to version 5.5, the `https://documentserver/ConvertService.ashx` address was used to send requests.

Starting from version 8.1, it is recommended to add the [shardkey](../../Get%20Started/How%20It%20Works/index.md#shard-key) parameter to the URL *QueryString* with the *key* value in it. For example, *?shardkey=Khirz6zTPdfd7*. This allows you to load balance requests.

> In **ONLYOFFICE Docs** prior to version 4.2 the GET request with the parameters in the *QueryString* were used.

## Request parameters and their description

- [async](#async)
- [codePage](#codepage)
- [delimiter](#delimiter)
- [documentLayout](#documentlayout)
- [documentRenderer](#documentrenderer)
- [filetype](#filetype)
- [key](#key)
- [outputtype](#outputtype)
- [password](#password)
- [pdf](#pdf)
- [region](#region)
- [spreadsheetLayout](#spreadsheetlayout)
- [thumbnail](#thumbnail)
- [title](#title)
- [token](#token)
- [url](#url)
- [watermark](#watermark)

### async

Defines the conversion request type: asynchronous or not.

Supported values:

- **true**
- **false**

When the asynchronous request type is used, the response is formed instantly. In this case to get the result it is necessary to send requests without parameter change until the conversion is finished. The default value is **false**.

Type: boolean

Presence: optional

> If the conversion is synchronous and the file takes a long time to be converted, a web request timeout error may occur. Although the conversion can be eventually completed, the result can only be obtained by sending the request again with the same key.

### codePage

Defines the file encoding when converting from *csv* or *txt* format.

Main supported values:

- **932** - Japanese (Shift-JIS);
- **950** - Chinese Traditional (Big5);
- **1250** - Central European (Windows);
- **1251** - Cyrillic (Windows);
- **65001** - Unicode (UTF-8).

You can find all the supported values [in this file](https://github.com/ONLYOFFICE/server/blob/master/Common/sources/commondefines.js).

Type: integer

Presence: optional

### delimiter

Defines the delimiter characters for separating values when converting from *csv* format.

Supported values:

- **0** - no delimiter;
- **1** - tab;
- **2** - semicolon;
- **3** - colon;
- **4** - comma;
- **5** - space.

Type: integer

Presence: optional

### documentLayout

Defines the document layout which specifies parameters for printing forms as *pdf* documents or images.

Type: object

Presence: optional

#### documentLayout.drawPlaceHolders

Defines if placeholders will be drawn or not.

Type: boolean

Presence: optional

#### documentLayout.drawFormHighlight

Defines if forms will be highlighted or not.

Type: boolean

Presence: optional

#### documentLayout.isPrint

Defines if the print mode is turned on or off. This parameter is used only for converting *docx/docxf* into *pdf*. If this parameter is equal to **true**, the *drawPlaceHolders* and *drawFormHighlight* flags are used as described above. If this parameter is **false**, the *drawFormHighlight* flag does not work and the *drawPlaceHolders* parameter allows saving the forms in the *pdf* format. The default value is **false**.

Type: boolean

Presence: optional

### documentRenderer

Defines the document renderer when converting from *pdf*, *xps*, *oxps*.

Type: object

Presence: optional

#### documentRenderer.textAssociation

Defines the rendering mode that can have the following values:

- **blockChar** - all text is converted by single characters. Each character is in its own frame (like a textbox);
- **blockLine** - all text is converted by separate lines. Each text line is in its own frame. Lines can be combined within the same block;
- **plainLine** - all text is converted as a plain text. But each line is a separate paragraph;
- **plainParagraph** - all text is converted as a plain text. Lines are combined into paragraphs.

The default value is **plainLine**.

Type: string

Presence: optional

### filetype

Defines the type of the document file to be converted.

> In the tables below you can see possibility of conversion your documents into the most known file formats, where the **Input format** column corresponds to the values of the **filetype** parameter and the **Output format** columns correspond to the values of the **outputtype** parameter.

Type: string

Presence: required

### key

Defines the document identifier used to unambiguously identify the document file.

Type: string

Presence: required

### outputtype

Defines the resulting converted document type. Starting from version 7.0, file formats can be specified instead of extensions. They are used when we do not know in advance what extension is required:

- **ooxml** - defines that the file will be converted into *docx*, *docm*, *xlsx*, *xlsm*, *pptx* or *pptm*. For example, when the *doc* file is converted into the OOXML format, the resulting file can be *docx* or *docm* if this file contains macros (the same for *xls* and *ppt*). It is also applied when converting XML files into OOXML formats (*docx*, *xlsx* or *pptx* depending on the content);
- **odf** - defines that the file will be converted into *odt*, *ods* or *odp*. For example, it is used when converting XML files into ODF formats (*odt*, *ods* or *odp* depending on the content).

> In the tables below you can see possibility of conversion your documents into the most known file formats, where the **Input format** column corresponds to the values of the **filetype** parameter and the **Output format** columns correspond to the values of the **outputtype** parameter.

Type: string

Presence: required

### password

Defines the password for the document file if it is protected with a password.

Type: string

Presence: optional

### pdf

Defines settings for converting document files to pdf.

Type: object

Presence: optional

#### pdf.form

Defines whether the document will be converted to the *pdf* form (**true**) or to a regular *pdf* file (**false**). If this parameter is omitted, the document contents will not be changed. If the document has fields, they will remain in the converted document. If has not, the converted document will not contain them either. For example, you don't need to specify this parameter when converting *docxf* and *oform* formats to *pdf*. They will always be converted to *pdf* forms.

Type: boolean

Presence: optional

### region

Defines the default display format for currency and date and time when converting from *Spreadsheet format* to *pdf*. Is set using the four letter (**en-US**, **fr-FR**, etc.) language codes. The default value is **en-US**.

Type: string

Presence: optional

### spreadsheetLayout

Defines settings for converting the spreadsheet to pdf.

> Please note that the maximum number of pages that can be returned at once after converting a spreadsheet into pdf or image formats is no more than 1500.

Type: object

Presence: optional

#### spreadsheetLayout.fitToHeight

Sets the height of the converted area, measured in the number of pages. The default value is **0**.

Type: integer

Presence: optional

#### spreadsheetLayout.fitToWidth

Sets the width of the converted area, measured in the number of pages. The default value is **0**.

Type: integer

Presence: optional

#### spreadsheetLayout.gridLines

Allows to include grid lines to the output PDF file or not. The default value is **false**.

Type: boolean

Presence: optional

#### spreadsheetLayout.headings

Allows to include the headings to the output PDF file or not. The default value is **false**.

Type: boolean

Presence: optional

#### spreadsheetLayout.ignorePrintArea

Determines whether to ignore the print area chosen for the spreadsheet file or not. The default value is **true**.

Type: boolean

Presence: optional

#### spreadsheetLayout.margins

Sets the margins of the output PDF file.

Type: object

Presence: optional

#### spreadsheetLayout.margins.bottom

Sets the bottom margin of the output PDF file. The default value is **19.1mm**.

Type: string

Presence: optional

#### spreadsheetLayout.margins.left

Sets the left margin of the output PDF file. The default value is **17.8mm**.

Type: string

Presence: optional

#### spreadsheetLayout.margins.right

Sets the right margin of the output PDF file. The default value is **17.8mm**.

Type: string

Presence: optional

#### spreadsheetLayout.margins.top

Sets the top margin of the output PDF file. The default value is **19.1mm**.

Type: string

Presence: optional

#### spreadsheetLayout.orientation

Sets the orientation of the output PDF file. May be **landscape**, **portrait**. The default value is **portrait**.

Type: string

Presence: optional

#### spreadsheetLayout.pageSize

Sets the page size of the output PDF file.

Type: object

Presence: optional

#### spreadsheetLayout.pageSize.height

Sets the page height of the output PDF file. The default value is **297mm**.

Type: string

Presence: optional

#### spreadsheetLayout.pageSize.width

Sets the page width of the output PDF file. The default value is **210mm**.

Type: string

Presence: optional

#### spreadsheetLayout.scale

Allows to set the scale of the output PDF file. The default value is **100**.

Type: integer

Presence: optional

### thumbnail

Defines the settings for the thumbnail when specifying the image formats (*bmp*, *gif*, *jpg*, *png*) as **outputtype**.

Type: object

Presence: optional

#### thumbnail.aspect

Defines the mode to fit the image to the height and width specifyed. Supported values:

- **0** - stretch file to fit height and width;
- **1** - keep the aspect for the image;
- **2** - in this case, the width and height settings are not used. Instead of that, metric sizes of the page are converted into pixels with 96dpi. E.g., the A4 (210x297mm) page will turn out to be a picture with the 794x1123pix dimensions.

The default value is **2**.

Type: integer

Presence: optional

#### thumbnail.first

Defines if the thumbnails should be generated for the first page only or for all the document pages. If false, the zip archive containing thumbnails for all the pages will be created. The default value is **true**.

Type: boolean

Presence: optional

#### thumbnail.height

Defines the thumbnail height in pixels. The default value is **100**.

Type: integer

Presence: optional

#### thumbnail.width

Defines the thumbnail width in pixels. The default value is **100**.

Type: integer

Presence: optional

### title

Defines the converted file name.

Type: string

Presence: optional

### token

Defines the encrypted signature added to the **ONLYOFFICE Docs** config in the form of a [token](../../Additional%20API/Signature/Request/Token%20in%20body/index.md#request-to-convert-the-document).

Type: string

Presence: required by configuration

### url

Defines the absolute URL to the document to be converted. Be sure to add a [token](../../Get%20Started/How%20It%20Works/Security/index.md) when using local links. Otherwise, an error will occur.

Type: string

Presence: required

### watermark

Defines a JSON object containing the properties of a watermark which is inserted into the pdf and image files during conversion.

Type: object

Presence: optional

#### watermark.transparent

Defines the watermark transparency degree.

Type: float

Presence: optional

#### watermark.type

Defines the shape type which specifies the preset shape geometry for the current watermark.

Type: string

Presence: optional

#### watermark.width

Defines the watermark width measured in millimeters.

Type: integer

Presence: optional

#### watermark.height

Defines the watermark height measured in millimeters.

Type: integer

Presence: optional

#### watermark.rotate

Defines the watermark rotation angle measured in degrees.

Type: integer

Presence: optional

#### watermark.margins

Defines the text margins measured in millimeters in the watermark shape.

Type: array of integers

Presence: optional

#### watermark.fill

Defines the watermark fill color in the RGB format, or the URL to image (base64 support: *data:image/png;...*). The empty array \[] means that the watermark has no fill.

Type: array of integers \| string

Presence: optional

#### watermark.stroke-width

Defines the watermark stroke width measured in millimeters.

Type: integer

Presence: optional

#### watermark.stroke

Defines the watermark stroke color in the RGB format. The empty array \[] means that the watermark stroke has no fill.

Type: array of integers

Presence: optional

#### watermark.align

Defines the vertical text align in the watermark shape: **0** - bottom, **1** - center, **4** - top.

Type: integer

Presence: optional

#### watermark.paragraphs

Defines the array with paragraphs from the current watermark with their properties.

Type: array of objects

Presence: optional

#### watermark.paragraphs.align

Defines the horizontal text align in the current paragraph: **0** - right, **1** - left, **2** - center, **3** - justify.

Type: integer

Presence: optional

#### watermark.paragraphs.fill

Defines the paragraph highlight in the RGB format. The empty array \[] means that the paragraph is not highlighted.

Type: array of integers

Presence: optional

#### watermark.paragraphs.linespacing

Defines the text linespacing in the current paragraph.

Type: integer

Presence: optional

#### watermark.paragraphs.runs

Defines the array with runs from the current paragraph with their properties.

Type: array of objects

Presence: optional

#### watermark.paragraphs.runs.text

Defines the run text.

Type: string

Presence: optional

#### watermark.paragraphs.runs.fill

Defines the text highlight in the RGB format. The empty array \[] means that the text is not highlighted.

Type: array of integers

Presence: optional

#### watermark.paragraphs.runs.font-family

Defines the text font family.

Type: string

Presence: optional

#### watermark.paragraphs.runs.font-size

Defines the text font size measured in points (pt).

Type: string

Presence: optional

#### watermark.paragraphs.runs.bold

Defines if the current text is displayed bold or not.

Type: boolean

Presence: optional

#### watermark.paragraphs.runs.italic

Defines if the current text is displayed italic or not.

Type: boolean

Presence: optional

#### watermark.paragraphs.runs.strikeout

Defines if the current text is displayed struck through or not.

Type: boolean

Presence: optional

#### watermark.paragraphs.runs.underline

Defines if the current text is displayed underlined or not.

Type: boolean

Presence: optional

## Text document file formats

|       | bmp | docm | docx | docxf | dotm | dotx | epub | fb2 | gif | html | jpg | odt | ott | pdf | pdfa | png | rtf | txt |
| ----- | --- | ---- | ---- | ----- | ---- | ---- | ---- | --- | --- | ---- | --- | --- | --- | --- | ---- | --- | --- | --- |
| djvu  | +   |      |      |       |      |      |      |     | +   |      | +   |     |     | +   | +    | +   |     |     |
| doc   | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| docm  | +   |      | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| docx  | +   | +    |      | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| docxf | +   | +    | +    |       | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| dot   | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| dotm  | +   | +    | +    | +     |      | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| dotx  | +   | +    | +    | +     | +    |      | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| epub  | +   | +    | +    | +     | +    | +    |      | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| fb2   | +   | +    | +    | +     | +    | +    | +    |     | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| fodt  | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| htm   | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| html  | +   | +    | +    | +     | +    | +    | +    | +   | +   |      | +   | +   | +   | +   | +    | +   | +   | +   |
| mht   | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| mhtml | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| odt   | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   |     | +   | +   | +    | +   | +   | +   |
| ott   | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    |     | +   | +   | +   | +    | +   | +   | +   |
| oxps  | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| pdf   | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   |     | +    | +   | +   | +   |
| rtf   | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   |     | +   |
| stw   | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| sxw   | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| txt   | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   |     |
| wps   | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| wpt   | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| xml   | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |
| xps   | +   | +    | +    | +     | +    | +    | +    | +   | +   | +    | +   | +   | +   | +   | +    | +   | +   | +   |

## Spreadsheet file formats

|      | bmp | csv | gif | jpg | ods | ots | pdf | pdfa | png | xlsm | xlsx | xltm | xltx |
| ---- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | ---- | ---- | ---- | ---- |
| csv  | +   |     | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    |
| et   | +   | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    |
| ett  | +   | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    |
| fods | +   | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    |
| ods  | +   | +   | +   | +   |     | +   | +   | +    | +   | +    | +    | +    | +    |
| ots  | +   | +   | +   | +   | +   |     | +   | +    | +   | +    | +    | +    | +    |
| sxc  | +   | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    |
| xls  | +   | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    |
| xlsb | +   | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    |
| xlsm | +   | +   | +   | +   | +   | +   | +   | +    | +   |      | +    | +    | +    |
| xlsx | +   | +   | +   | +   | +   | +   | +   | +    | +   | +    |      | +    | +    |
| xlt  | +   | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    |
| xltm | +   | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    |      | +    |
| xltx | +   | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    |      |
| xml  | +   | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    |

## Presentation file formats

|      | bmp | gif | jpg | odp | otp | pdf | pdfa | png | potm | potx | ppsm | ppsx | pptm | pptx |
| ---- | --- | --- | --- | --- | --- | --- | ---- | --- | ---- | ---- | ---- | ---- | ---- | ---- |
| dps  | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    | +    | +    |
| dpt  | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    | +    | +    |
| fodp | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    | +    | +    |
| odp  | +   | +   | +   |     | +   | +   | +    | +   | +    | +    | +    | +    | +    | +    |
| otp  | +   | +   | +   | +   |     | +   | +    | +   | +    | +    | +    | +    | +    | +    |
| pot  | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    | +    | +    |
| potm | +   | +   | +   | +   | +   | +   | +    | +   |      | +    | +    | +    | +    | +    |
| potx | +   | +   | +   | +   | +   | +   | +    | +   | +    |      | +    | +    | +    | +    |
| pps  | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    | +    | +    |
| ppsm | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    |      | +    | +    | +    |
| ppsx | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    |      | +    | +    |
| ppt  | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    | +    | +    |
| pptm | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    |      | +    |
| pptx | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    | +    |      |
| sxi  | +   | +   | +   | +   | +   | +   | +    | +   | +    | +    | +    | +    | +    | +    |

## Examples of requests

### Sample of JSON object sent to **document conversion service** used to convert the file from *docx* format to *pdf* format

``` json
{
  "async": false,
  "filetype": "docx",
  "key": "Khirz6zTPdfd7",
  "outputtype": "pdf",
  "title": "Example Document Title.docx",
  "url": "https://example.com/url-to-example-document.docx"
}
```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

### Sample of JSON object sent to **document conversion service** used to convert the password-protected file from *docx* format to *pdf* format

``` json
{
  "async": false,
  "filetype": "docx",
  "key": "Khirz6zTPdfd7",
  "outputtype": "pdf",
  "password": "123456",
  "title": "Example Document Title.docx",
  "url": "https://example.com/url-to-example-document.docx"
}
```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

### Sample of JSON object sent to **document conversion service** used to convert the file from *docx* format to *pdf* form

``` json
{
  "async": false,
  "filetype": "docx",
  "key": "Khirz6zTPdfd7",
  "outputtype": "pdf",
  "pdf": {
    "form": true
  },
  "title": "Example Document Title.docx",
  "url": "https://example.com/url-to-example-document.docx"
}
```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

### Sample of JSON object sent to **document conversion service** used to convert the file from *docx* format to *pdf* format with a watermark inserted

``` json
{
  "async": false,
  "filetype": "docx",
  "key": "Khirz6zTPdfd7",
  "outputtype": "pdf",
  "title": "Example Document Title.docx",
  "url": "https://example.com/url-to-example-document.docx",
  "watermark": {
    "align": 1,
    "fill": [255, 0, 0],
    "height": 100,
    "margins": [10, 10, 10, 10],
    "paragraphs": [
      {
        "align": 2,
        "fill": [255, 0, 0],
        "linespacing": 1,
        "runs": [
          {
            "bold": true,
            "italic": false,
            "fill": [0, 0, 0],
            "font-family": "Arial",
            "font-size": 40,
            "strikeout": false,
            "text": "Watermark",
            "underline": false
          },
          {
            "text": "<%br%>"
          }
        ]
      }
    ],
    "rotate": -45,
    "transparent": 0.3,
    "type": "rect",
    "stroke-width": 1,
    "stroke": [0, 0, 255],
    "width": 100
  }
}
```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

### Sample of JSON object sent to **document conversion service** used to generate *png* thumbnail of file in *docx* format

``` json
{
  "filetype": "docx",
  "key": "Khirz6zTPdfd7",
  "outputtype": "png",
  "thumbnail": {
    "aspect": 0,
    "first": true,
    "height": 150,
    "width": 100
  },
  "title": "Example Document Title.docx",
  "url": "https://example.com/url-to-example-document.docx"
}
```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

### Sample of JSON object sent to **document conversion service** used to convert the *spreadsheet* file to *pdf* format

``` json
{
  "filetype": "xlsx",
  "key": "Khirz6zTPdfd7",
  "outputtype": "pdf",
  "region": "en-US",
  "spreadsheetLayout": {
    "ignorePrintArea": true,
    "orientation": "portrait",
    "fitToWidth": 0,
    "fitToHeight": 0,
    "scale": 100,
    "headings": false,
    "gridLines": false,
    "pageSize": {
      "width": "210mm",
      "height": "297mm"
    },
    "margins": {
      "left": "17.8mm",
      "right": "17.8mm",
      "top": "19.1mm",
      "bottom": "19.1mm"
    }
  },
  "title": "Example Document Title.docx",
  "url": "https://example.com/url-to-example-spreadsheet.xlsx"
}
```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

### Sample of JSON object contains the JSON Web Token sent to **document conversion service** used to convert the file from *docx* format to *pdf* format

``` json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxldHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3Iiwib3V0cHV0dHlwZSI6InBkZiIsInRpdGxlIjoiRXhhbXBsZSBEb2N1bWVudCBUaXRsZS5kb2N4IiwidXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.U-YAfuuy7clWjn-xOncfJ-sxVG5DlcYn0AOzJYkoR0M"
}
```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

## Response parameters and their description

The request result is returned in XML format. To receive a response in JSON format you need to specify the *Accept* header with the **application/json** value in the HTTP request (available from version 4.3). When forming the link to the resulting file, the same server name is used which was made the conversion request to.

| Parameter  | Type    | Example                                                | Description                                                                                                                             |
| ---------- | ------- | ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------- |
| endConvert | boolean | true                                                   | Defines if the conversion is completed or not.                                                                                          |
| error      | integer | -3                                                     | Defines an error occurred during the conversion. Possible error codes can be found [here](#possible-error-codes-and-their-description). |
| fileType   | string  | "docm"                                                 | Defines an extension of the converted file.                                                                                             |
| fileUrl    | string  | `https://documentserver/url-to-converted-document.pdf` | Defines the link to the converted document. This parameter will be received only when the *endConvert* parameter is set to **true**.    |
| percent    | integer | 100                                                    | Defines the percentage of the file conversion. If the *endConvert* parameter is set to **true**, the *percent* is equal to **100**.     |

## Examples of responses

### Sample of the response in XML format

When forming the link to the resulting file, the same server name is used which was made the conversion request to.

``` xml
<?xml version="1.0" encoding="utf-8"?>
<FileResult>
    <EndConvert>True</EndConvert>
    <FileType>docm</FileType>
    <FileUrl>https://documentserver/url-to-converted-document.pdf</FileUrl>
    <Percent>100</Percent>
</FileResult>
```

### Sample of the response in JSON format

When forming the link to the resulting file, the same server name is used which was made the conversion request to.

``` json
{
  "endConvert": true,
  "fileType": "docm",
  "fileUrl": "https://documentserver/url-to-converted-document.pdf",
  "percent": 100
}
```

### Sample of the intermediate response to the asynchronous request (with the parameter *async=true*) in XML format

```xml
<?xml version="1.0" encoding="utf-8"?>
<FileResult>
    <EndConvert>False</EndConvert>
    <FileType></FileType>
    <FileUrl></FileUrl>
    <Percent>95</Percent>
</FileResult>
```

### Sample of the intermediate response to the asynchronous request (with the parameter *async=true*) in JSON format

```json
{
  "endConvert": false,
  "percent": 95
}
```

### Sample of the response when an error occurred in XML format

```xml
<?xml version="1.0" encoding="utf-8"?>
<FileResult>
    <Error>-3</Error>
</FileResult>
```

### Sample of the response when an error occurred in JSON format

``` json
{
  "error": -3
}
```

## Possible error codes and their description

| Error code | Description                                                                                                                                                                                                                                                                               |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| -1         | Unknown error.                                                                                                                                                                                                                                                                            |
| -2         | Conversion timeout error.                                                                                                                                                                                                                                                                 |
| -3         | Conversion error.                                                                                                                                                                                                                                                                         |
| -4         | Error while downloading the document file to be converted.                                                                                                                                                                                                                                |
| -5         | Incorrect password.                                                                                                                                                                                                                                                                       |
| -6         | Error while accessing the conversion result database.                                                                                                                                                                                                                                     |
| -7         | Input error.                                                                                                                                                                                                                                                                              |
| -8         | Invalid token.                                                                                                                                                                                                                                                                            |
| -9         | Error when the converter cannot automatically determine the output file format. This error means that the client must explicitly specify in which format the file should be converted (text document or spreadsheet). It is used to convert XML to OOXML in case the XML type is unknown. |
| -10        | Size limit exceeded.                                                                                                                                                                                                                                                                      |
