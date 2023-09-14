<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Conversion API
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Conversion API</span>
    </h1>

    <p class="dscr">
        For the interaction with the <b>document conversion service</b> the POST requests are used.
        The request parameters are entered in JSON format in the request body.
        The requests are sent to the <span class="fakelink">https://documentserver/ConvertService.ashx</span> address where <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.
    </p>

    <div class="note">In <b>ONLYOFFICE Document Server</b> prior to version 4.2 the GET request with the parameters in the <em>QueryString</em> were used.</div>

    <h2 id="request" class="copy-link">Request parameters and their description</h2>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Parameter</td>
                <td>Description</td>
                <td>Type</td>
                <td>Presence</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="async" class="copy-link">async</td>
                <td>
                    Defines the conversion request type: asynchronous or not.<br />
                    Supported values:
                    <ul>
                        <li><b>true</b></li>
                        <li><b>false</b></li>
                    </ul>
                    When the asynchronous request type is used, the response is formed instantly.
                    In this case to get the result it is necessary to send requests without parameter change until the conversion is finished.
                    The default value is <b>false</b>.
                </td>
                <td>boolean</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow tablerow-note">
                <td colspan="4">
                    <div class="note">If the conversion is synchronous and the file takes a long time to be converted, a web request timeout error may occur.
                        Although the conversion can be eventually completed, the result can only be obtained by sending the request again with the same key.</div>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="codePage" class="copy-link">codePage</td>
                <td>
                    Defines the file encoding when converting from <em>csv</em> or <em>txt</em> format.<br />
                    Main supported values:
                    <ul>
                        <li><b>932</b> - Japanese (Shift-JIS),</li>
                        <li><b>950</b> - Chinese Traditional (Big5),</li>
                        <li><b>1250</b> - Central European (Windows),</li>
                        <li><b>1251</b> - Cyrillic (Windows),</li>
                        <li><b>65001</b> - Unicode (UTF-8).</li>
                    </ul>
                    You can find all the supported values <a target="_blank" href="https://github.com/ONLYOFFICE/server/blob/master/Common/sources/commondefines.js">in this file</a>.
                </td>
                <td>integer</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="delimiter" class="copy-link">delimiter</td>
                <td>
                    Defines the delimiter characters for separating values when converting from <em>csv</em> format.<br />
                    Supported values:
                    <ul>
                        <li><b>0</b> - no delimiter,</li>
                        <li><b>1</b> - tab,</li>
                        <li><b>2</b> - semicolon,</li>
                        <li><b>3</b> - colon,</li>
                        <li><b>4</b> - comma,</li>
                        <li><b>5</b> - space.</li>
                    </ul>
                </td>
                <td>integer</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="documentLayout" class="copy-link">documentLayout</td>
                <td>Defines the document layout which specifies parameters for printing forms as <em>pdf</em> documents or images.</td>
                <td>object</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="drawPlaceHolders" class="copy-link">documentLayout.drawPlaceHolders</td>
                <td>Defines if placeholders will be drawn or not.</td>
                <td>boolean</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="drawFormHighlight" class="copy-link">documentLayout.drawFormHighlight</td>
                <td>Defines if forms will be highlighted or not.</td>
                <td>boolean</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="isPrint" class="copy-link">documentLayout.isPrint</td>
                <td>Defines if the print mode is turned on or off. This parameter is used only for converting <em>docx/docxf</em> into <em>pdf</em>.
                    If this parameter is equal to <b>true</b>, the <em>drawPlaceHolders</em> and <em>drawFormHighlight</em> flags are used as described above.
                    If this parameter is <b>false</b>, the <em>drawFormHighlight</em> flag does not work and the <em>drawPlaceHolders</em> parameter allows saving the forms in the <em>pdf</em> format.
                    The default value is <b>false</b>.</td>
                <td>boolean</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="documentRenderer" class="copy-link">documentRenderer</td>
                <td>Defines the document renderer when converting from <em>pdf</em>, <em>xps</em>, <em>oxps</em>.</td>
                <td>object</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="textAssociation" class="copy-link">documentRenderer.textAssociation</td>
                <td>
                    Defines the rendering mode that can have the following values:
                    <ul>
                        <li>
                            <b>blockChar</b> - all text is converted by single characters.
                            Each character is in its own frame (like a textbox),
                        </li>
                        <li>
                            <b>blockLine</b> - all text is converted by separate lines.
                            Each text line is in its own frame. Lines can be combined within the same block,
                        </li>
                        <li>
                            <b>plainLine</b> - all text is converted as a plain text.
                            But each line is a separate paragraph,
                        </li>
                        <li>
                            <b>plainParagraph</b> - all text is converted as a plain text.
                            Lines are combined into paragraphs.
                        </li>
                    </ul>
                    The default value is <b>plainLine</b>.
                </td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="filetype" class="copy-link">filetype<a href="#requiredDescr" class="required">*</a></td>
                <td>Defines the type of the document file to be converted.</td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td id="key" class="copy-link">key</td>
                <td>Defines the document identifier used to unambiguously identify the document file.</td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td id="outputtype" class="copy-link">outputtype<a href="#requiredDescr" class="required">*</a></td>
                <td>
                    Defines the resulting converted document type.
                    Starting from version 7.0, file formats can be specified instead of extensions.
                    They are used when we do not know in advance what extension is required:
                    <ul>
                        <li>
                            <b>ooxml</b> - defines that the file will be converted into <em>docx</em>, <em>docm</em>, <em>xlsx</em>, <em>xlsm</em>, <em>pptx</em> or <em>pptm</em>.
                            For example, when the <em>doc</em> file is converted into the OOXML format, the resulting file can be <em>docx</em> or <em>docm</em> if this file contains macros (the same for <em>xls</em> and <em>ppt</em>).
                            It is also applied when converting XML files into OOXML formats (<em>docx</em>, <em>xlsx</em> or <em>pptx</em> depending on the content);
                        </li>
                        <li>
                            <b>odf</b> - defines that the file will be converted into <em>odt</em>, <em>ods</em> or <em>odp</em>.
                            For example, it is used when converting XML files into ODF formats (<em>odt</em>, <em>ods</em> or <em>odp</em> depending on the content).
                        </li>
                    </ul>
                </td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td id="password" class="copy-link">password</td>
                <td>Defines the password for the document file if it is protected with a password.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="region" class="copy-link">region</td>
                <td>
                    Defines the default display format for currency and date and time when converting from <em>Spreadsheet format</em> to <em>pdf</em>.
                    Is set using the four letter (<b>en-US</b>, <b>fr-FR</b>, etc.) language codes.
                    The default value is <b>en-US</b>.
                </td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr>
                <td id="spreadsheetLayout" class="copy-link">spreadsheetLayout</td>
                <td>Defines settings for converting the spreadsheet to pdf.</td>
                <td>object</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow tablerow-note">
                <td colspan="4">
                    <div class="note">Please note that the maximum number of pages that can be returned at once after converting a spreadsheet into pdf or image formats is no more than 1500.</div>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="fitToHeight" class="copy-link">spreadsheetLayout.fitToHeight</td>
                <td>
                    Sets the height of the converted area, measured in the number of pages.
                    The default value is <b>0</b>.
                </td>
                <td>integer</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="fitToWidth" class="copy-link">spreadsheetLayout.fitToWidth</td>
                <td>
                    Sets the width of the converted area, measured in the number of pages.
                    The default value is <b>0</b>.
                </td>
                <td>integer</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="gridLines" class="copy-link">spreadsheetLayout.gridLines</td>
                <td>
                    Allows to include grid lines to the output PDF file or not.
                    The default value is <b>false</b>.
                </td>
                <td>boolean</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="headings" class="copy-link">spreadsheetLayout.headings</td>
                <td>
                    Allows to include the headings to the output PDF file or not.
                    The default value is <b>false</b>.
                </td>
                <td>boolean</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="ignorePrintArea" class="copy-link">spreadsheetLayout.ignorePrintArea</td>
                <td>
                    Determines whether to ignore the print area chosen for the spreadsheet file or not.
                    The default value is <b>true</b>.
                </td>
                <td>boolean</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="margins" class="copy-link">spreadsheetLayout.margins</td>
                <td>Sets the margins of the output PDF file.</td>
                <td>object</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="margins-bottom" class="copy-link">spreadsheetLayout.margins.bottom</td>
                <td>
                    Sets the bottom margin of the output PDF file.
                    The default value is <b>19.1mm</b>.
                </td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="margins-left" class="copy-link">spreadsheetLayout.margins.left</td>
                <td>
                    Sets the left margin of the output PDF file.
                    The default value is <b>17.8mm</b>.
                </td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="margins-right" class="copy-link">spreadsheetLayout.margins.right</td>
                <td>
                    Sets the right margin of the output PDF file.
                    The default value is <b>17.8mm</b>.
                </td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="margins-top" class="copy-link">spreadsheetLayout.margins.top</td>
                <td>
                    Sets the top margin of the output PDF file.
                    The default value is <b>19.1mm</b>.
                </td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="orientation" class="copy-link">spreadsheetLayout.orientation</td>
                <td>
                    Sets the orientation of the output PDF file. 
                    May be <b>landscape</b>, <b>portrait</b>. The default value is <b>portrait</b>.
                </td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="pageSize" class="copy-link">spreadsheetLayout.pageSize</td>
                <td>Sets the page size of the output PDF file.</td>
                <td>object</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="pageSize-height" class="copy-link">spreadsheetLayout.pageSize.height</td>
                <td>
                    Sets the page height of the output PDF file.
                    The default value is <b>297mm</b>.
                </td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="pageSize-width" class="copy-link">spreadsheetLayout.pageSize.width</td>
                <td>
                    Sets the page width of the output PDF file.
                    The default value is <b>210mm</b>.
                </td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="scale" class="copy-link">spreadsheetLayout.scale</td>
                <td>
                    Allows to set the scale of the output PDF file.
                    The default value is <b>100</b>.
                </td>
                <td>integer</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail" class="copy-link">thumbnail</td>
                <td>Defines the settings for the thumbnail when specifying the image formats (<em>bmp</em>, <em>gif</em>, <em>jpg</em>, <em>png</em>) as <b>outputtype</b>.</td>
                <td>object</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail-aspect" class="copy-link">thumbnail.aspect</td>
                <td>
                    Defines the mode to fit the image to the height and width specifyed.
                    Supported values:
                    <ul>
                        <li><b>0</b> - stretch file to fit height and width,</li>
                        <li><b>1</b> - keep the aspect for the image,</li>
                        <li>
                            <b>2</b> - in this case, the width and height settings are not used.
                            Instead of that, metric sizes of the page are converted into pixels with 96dpi.
                            E.g., the A4 (210x297mm) page will turn out to be a picture with the 794x1123pix dimensions.
                        </li>
                    </ul>
                    The default value is <b>2</b>.
                </td>
                <td>integer</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail-first" class="copy-link">thumbnail.first</td>
                <td>
                    Defines if the thumbnails should be generated for the first page only or for all the document pages.
                    If false, the zip archive containing thumbnails for all the pages will be created.
                    The default value is <b>true</b>,
                </td>
                <td>boolean</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail-height" class="copy-link">thumbnail.height</td>
                <td>
                    Defines the thumbnail height in pixels.
                    The default value is <b>100</b>.
                </td>
                <td>integer</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail-width" class="copy-link">thumbnail.width</td>
                <td>
                    Defines the thumbnail width in pixels.
                    The default value is <b>100</b>.
                </td>
                <td>integer</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="title" class="copy-link">title</td>
                <td>Defines the converted file name.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="token" class="copy-link">token</td>
                <td>Defines the encrypted signature added to the <b>Document Server</b> config in the form of a <a href="<%= Url.Action("signature/body") %>#conversion">token</a>.</td>
                <td>string</td>
                <td>required by configuration</td>
            </tr>
            <tr class="tablerow">
                <td id="url" class="copy-link">url</td>
                <td>
                    Defines the absolute URL to the document to be converted.
                    Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links.
                    Otherwise, an error will occur.
                </td>
                <td>string</td>
                <td>required</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>
    <span id="requiredDescr" class="required-descr"><span class="required">*</span><em> - in the tables below you can see possibility of conversion your documents into the most known file formats, where the <b>Input format</b> column corresponds to the values of the <b>filetype</b> parameter and the  <b>Output format</b> columns correspond to the values of the <b>outputtype</b> parameter.</em></span>

    <h2 id="text-matrix" class="copy-link">Text document file formats</h2>
    <table class="table-conversion-matrix-text">
        <tbody>
            <tr class="scroll-arrow" style="margin-top:247px;"></tr>
            <tr>
                <th rowspan="2">Input format</th>
                <th colspan="18">Output format</th>
            </tr>
            <tr>
                <td>bmp</td>
                <td>docm</td>
                <td>docx</td>
                <td>docxf</td>
                <td>dotm</td>
                <td>dotx</td>
                <td>epub</td>
                <td>fb2</td>
                <td>gif</td>
                <td>html</td>
                <td>jpg</td>
                <td>odt</td>
                <td>ott</td>
                <td>pdf</td>
                <td>pdfa</td>
                <td>png</td>
                <td>rtf</td>
                <td>txt</td>
            </tr>
            <tr>
                <td>djvu</td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
            </tr>
            <tr>
                <td>doc</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>docm</td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>docx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>docxf</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>dot</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>dotm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>dotx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>epub</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>fb2</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>fodt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>htm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>html</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>mht</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>mhtml</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>odt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ott</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>oxps</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>pdf</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>rtf</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>stw</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>sxw</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>txt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
            </tr>
            <tr>
                <td>wps</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>wpt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xml</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xps</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <h2 id="spreadsheet-matrix" class="copy-link">Spreadsheet file formats</h2>
    <table class="table-conversion-matrix-spreadsheet">
        <tbody>
            <tr class="scroll-arrow" style="margin-top:150px;"></tr>
            <tr>
                <th rowspan="2">Input format</th>
                <th colspan="13">Output format</th>
            </tr>
            <tr>
                <td>bmp</td>
                <td>csv</td>
                <td>gif</td>
                <td>jpg</td>
                <td>ods</td>
                <td>ots</td>
                <td>pdf</td>
                <td>pdfa</td>
                <td>png</td>
                <td>xlsm</td>
                <td>xlsx</td>
                <td>xltm</td>
                <td>xltx</td>
            </tr>
            <tr>
                <td>csv</td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>et</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ett</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>fods</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ods</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ots</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>sxc</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xls</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xlsb</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xlsm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xlsx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xlt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xltm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xltx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
            </tr>
            <tr>
                <td>xml</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <h2 id="presentation-matrix" class="copy-link">Presentation file formats</h2>
    <table class="table-conversion-matrix-presentation">
        <tr class="scroll-arrow" style="margin-top:183px;"></tr>
        <tbody>
            <tr>
                <th rowspan="2">Input format</th>
                <th colspan="14">Output format</th>
            </tr>
            <tr>
                <td>bmp</td>
                <td>gif</td>
                <td>jpg</td>
                <td>odp</td>
                <td>otp</td>
                <td>pdf</td>
                <td>pdfa</td>
                <td>png</td>
                <td>potm</td>
                <td>potx</td>
                <td>ppsm</td>
                <td>ppsx</td>
                <td>pptm</td>
                <td>pptx</td>
            </tr>
            <tr>
                <td>dps</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>dpt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>fodp</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>odp</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>otp</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>pot</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>potm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>potx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>pps</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ppsm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ppsx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ppt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>pptm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>pptx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
            </tr>
            <tr>
                <td>sxi</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div id="sample-conversion" class="header-gray copy-link">Sample of JSON object sent to <b>document conversion service</b> used to convert the file from <em>docx</em> format to <em>pdf</em> format</div>
    <pre>
{
    "async": false,
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "pdf",
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
    <p>
        Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </p>

    <div id="sample-password-conversion" class="header-gray copy-link">Sample of JSON object sent to <b>document conversion service</b> used to convert the password-protected file from <em>docx</em> format to <em>pdf</em> format</div>
    <pre>
{
    "async": false,
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "pdf",
    "password": "123456",
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
    <p>
        Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </p>

    <div id="sample-thumbnail" class="header-gray copy-link">Sample of JSON object sent to <b>document conversion service</b> used to generate <em>png</em> thumbnail of file in <em>docx</em> format</div>
    <pre>
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
</pre>
    <p>
        Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </p>

    <div id="sample-spreadsheet-to-pdf" class="header-gray copy-link">Sample of JSON object sent to <b>document conversion service</b> used to convert the <em>spreadsheet</em> file to <em>pdf</em> format</div>
    <pre>
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
</pre>
    <p>
        Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </p>

    <div id="sample-conversion-token" class="header-gray copy-link">Sample of JSON object contains the JSON Web Token sent to <b>document conversion service</b> used to convert the file from <em>docx</em> format to <em>pdf</em> format</div>
    <pre>
{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxldHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3Iiwib3V0cHV0dHlwZSI6InBkZiIsInRpdGxlIjoiRXhhbXBsZSBEb2N1bWVudCBUaXRsZS5kb2N4IiwidXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.U-YAfuuy7clWjn-xOncfJ-sxVG5DlcYn0AOzJYkoR0M"
}
</pre>
    <p>
        Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </p>

    <h2 id="response" class="copy-link">Response parameters and their description</h2>
    <p>
        The request result is returned in XML format.
        To receive a response in JSON format you need to specify the <em>Accept</em> header with the <b>application/json</b> value in the HTTP request (available from version 4.3).
        When forming the link to the resulting file, the same server name is used which was made the conversion request to.
    </p>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Parameter</td>
                <td>Description</td>
                <td>Type</td>
                <td>Example</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td id="endConvert" class="copy-link">endConvert</td>
                <td>Defines if the conversion is completed or not.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="error" class="copy-link">error</td>
                <td>Defines an error occurred during the conversion. Possible error codes can be found <a href="#error-codes">here</a>.</td>
                <td>integer</td>
                <td>-3</td>
            </tr>
            <tr class="tablerow">
                <td id="fileType" class="copy-link">fileType</td>
                <td>Defines an extension of the converted file.</td>
                <td>string</td>
                <td>"docm"</td>
            </tr>
            <tr class="tablerow">
                <td id="fileUrl" class="copy-link">fileUrl</td>
                <td>Defines the link to the converted document. This parameter will be received only when the <em>endConvert</em> parameter is set to <b>true</b>.</td>
                <td>string</td>
                <td>"https://documentserver/url-to-converted-document.pdf"</td>
            </tr>
            <tr class="tablerow">
                <td id="percent" class="copy-link">percent</td>
                <td>Defines the percentage of the file conversion. If the <em>endConvert</em> parameter is set to <b>true</b>, the <em>percent</em> is equal to <b>100</b>.</td>
                <td>integer</td>
                <td>100</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Sample of the response in XML format</div>
    <p>When forming the link to the resulting file, the same server name is used which was made the conversion request to.</p>
    <pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;FileResult&gt;
    &lt;EndConvert&gt;True&lt;/EndConvert&gt;
    &lt;FileType&gt;docm&lt;/FileType&gt;
    &lt;FileUrl&gt;https://documentserver/url-to-converted-document.pdf&lt;/FileUrl&gt;
    &lt;Percent&gt;100&lt;/Percent&gt;
&lt;/FileResult&gt;
</pre>
    <div class="header-gray">Sample of the response in JSON format</div>
    <p>When forming the link to the resulting file, the same server name is used which was made the conversion request to.</p>
    <pre>
{
    "endConvert": true,
    "fileType": "docm",
    "fileUrl": "https://documentserver/url-to-converted-document.pdf",
    "percent": 100
}
</pre>

    <div class="header-gray">Sample of the intermediate response to the asynchronous request (with the parameter <em>async=true</em>) in XML format</div>
    <pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;FileResult&gt;
    &lt;EndConvert&gt;False&lt;/EndConvert&gt;
    &lt;FileType&gt;&lt;/FileType&gt;
    &lt;FileUrl&gt;&lt;/FileUrl&gt;
    &lt;Percent&gt;95&lt;/Percent&gt;
&lt;/FileResult&gt;
</pre>
    <div class="header-gray">Sample of the intermediate response to the asynchronous request (with the parameter <em>async=true</em>) in JSON format</div>
    <pre>
{
    "endConvert": false,
    "percent": 95
}
</pre>

    <div class="header-gray">Sample of the response when an error occurred in XML format</div>
    <pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;FileResult&gt;
    &lt;Error&gt;-3&lt;/Error&gt;
&lt;/FileResult&gt;
</pre>
    <div class="header-gray">Sample of the response when an error occurred in JSON format</div>
    <pre>
{
    "error": -3
}
</pre>

    <div id="error-codes" class="copy-link header-gray">Possible error codes and their description</div>
    <table class="error-table">
        <colgroup>
            <col class="table-name" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Error code</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>-1</td>
                <td>Unknown error.</td>
            </tr>
            <tr class="tablerow">
                <td>-2</td>
                <td>Conversion timeout error.</td>
            </tr>
            <tr class="tablerow">
                <td>-3</td>
                <td>Conversion error.</td>
            </tr>
            <tr class="tablerow">
                <td>-4</td>
                <td>Error while downloading the document file to be converted.</td>
            </tr>
            <tr class="tablerow">
                <td>-5</td>
                <td>Incorrect password.</td>
            </tr>
            <tr class="tablerow">
                <td>-6</td>
                <td>Error while accessing the conversion result database.</td>
            </tr>
            <tr class="tablerow">
                <td>-7</td>
                <td>Input error.</td>
            </tr>
            <tr class="tablerow">
                <td>-8</td>
                <td>Invalid token.</td>
            </tr>
            <%--<tr class="tablerow">
                <td>-21</td>
                <td>Token signature is expired.</td>
            </tr>--%>
        </tbody>
    </table>
</asp:Content>
