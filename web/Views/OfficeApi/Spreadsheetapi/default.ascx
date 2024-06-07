<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Structure of a spreadsheet</span>
</h1>

<p class="dscr">A spreadsheet document has a more simple structure than that of a text document, most of the spreadsheet elements are nested within the <em>worksheet</em> element with all the other elements placed on it.</p>
<p>The <em>cells</em> can be given various values, some of the cell text properties can also be changed.</p>
<p>The <em>range</em> element can contain <em>areas</em> and <em>comments</em>.</p>
<p>Some drawn objects - <em>images</em>, <em>shapes</em>, <em>charts</em> - can be placed directly to the <em>worksheet</em>.</p>
<p>The text that does not pertain to the cell values, can be grouped to <em>paragraphs</em> and added to the <em>shapes</em>. For the sake of convenience (as it is always easier to work with smaller blocks than with larger ones) the text is usually divided into small text portions called <em>runs</em>. Each paragraph can consist either of only one text run or have dozens of them inside, depending on the paragraph complexity.</p>
<p>Thus any spreadsheet document structure with <b>Office JavaScript API</b> used to create it can be outlined like this:</p>

<div class="spreadsheet_document">
<div class="document_structure">
        <p class="node_label"><b>Office JavaScript API</b></p>
        <p class="node_description">Spreadsheet creation, global color and fill/stroke settings:<br />
            <a href="<%= Url.Action("spreadsheetapi/api") %>">Api</a>, <a href="<%= Url.Action("spreadsheetapi/apifill") %>">ApiFill</a>, <a href="<%= Url.Action("spreadsheetapi/apibullet") %>">ApiBullet</a>, <a href="<%= Url.Action("spreadsheetapi/apistroke") %>">ApiStroke</a>, <a href="<%= Url.Action("spreadsheetapi/apigradientstop") %>">ApiGradientStop</a>, <a href="<%= Url.Action("spreadsheetapi/apiunicolor") %>">ApiUniColor</a>, <a href="<%= Url.Action("spreadsheetapi/apipresetcolor") %>">ApiPresetColor</a>, <a href="<%= Url.Action("spreadsheetapi/apirgbcolor") %>">ApiRGBColor</a>, <a href="<%= Url.Action("spreadsheetapi/apischemecolor") %>">ApiSchemeColor</a>, <a href="<%= Url.Action("spreadsheetapi/apiname") %>">ApiName</a>
        </p>
        <div class="document_structure document_node">
            <p class="node_label">Worksheet</p>
            <p class="node_description">
                Sheet name, cell format as table, columng width, charts:
                <br />
                <a href="<%= Url.Action("spreadsheetapi/apiworksheet") %>">ApiWorksheet</a>
            </p>
            <div class="document_structure section_node">
                <p class="node_label">Range</p>
                <p class="node_description">
                    Cell text properties, cell text format (color, font family, size, alignment), cell text value:
                    <br />
                    <a href="<%= Url.Action("spreadsheetapi/apirange") %>">ApiRange</a>
                </p>
                <div class="document_structure section_node">
                <p class="node_label">Areas</p>
                <p class="node_description">
                    Current areas properties:
                    <br />
                    <a href="<%= Url.Action("spreadsheetapi/apiareas") %>">ApiAreas</a>
                </p>
                </div>
                <div class="document_structure section_node">
                <p class="node_label">Comment</p>
                <p class="node_description">
                    Current comment properties:
                    <br />
                    <a href="<%= Url.Action("spreadsheetapi/apicomment") %>">ApiComment</a>
                </p>
                </div>
            </div>
            <div class="document_structure image_node">
                <p class="node_label">Image</p>
                <p class="node_description">
                    Common object properties, current image properties:
                                <br />
                    <a href="<%= Url.Action("spreadsheetapi/apidrawing") %>">ApiDrawing</a>, <a href="<%= Url.Action("spreadsheetapi/apiimage") %>">ApiImage</a>
                </p>
            </div>
            <div class="document_structure chart_node">
                <p class="node_label">Chart</p>
                <p class="node_description">
                    Common object properties, current chart properties:
                                <br />
                    <a href="<%= Url.Action("spreadsheetapi/apidrawing") %>">ApiDrawing</a>, <a href="<%= Url.Action("spreadsheetapi/apichart") %>">ApiChart</a>
                </p>
            </div>
            <div class="document_structure shape_node">
                <p class="node_label">Shape</p>
                <p class="node_description">
                    Common object properties, current shape properties:
                    <br />
                    <a href="<%= Url.Action("spreadsheetapi/apidrawing") %>">ApiDrawing</a>, <a href="<%= Url.Action("spreadsheetapi/apishape") %>">ApiShape</a>.
                </p>
                <div class="document_structure paragraph_node">
                    <p class="node_label">Paragraph</p>
                    <p class="node_description">
                        Common paragraph properties, current paragraph properties, paragraph numbering:
                        <br />
                        <a href="<%= Url.Action("spreadsheetapi/apiparapr") %>">ApiParaPr</a>, <a href="<%= Url.Action("spreadsheetapi/apiparagraph") %>">ApiParagraph</a>
                    </p>
                    <div class="document_structure textrun_node">
                        <p class="node_label">Text run</p>
                        <p class="node_description">
                            Common text properties, current text run properties:
                            <br />
                            <a href="<%= Url.Action("spreadsheetapi/apitextpr") %>">ApiTextPr</a>, <a href="<%= Url.Action("spreadsheetapi/apirun") %>">ApiRun</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="global-type-definitions">
<span class="anchor-position" id="CreateSheet">&nbsp;</span>
    <h2>Creating a new spreadsheet</h2>
    <p>The simplest example spreadsheet with a sheet named 'sheet 1' and the first column 140 pixels wide and A1 cell set to 'New cell' value can be built with the help of <b>ONLYOFFICE Document Builder</b> using the following code:</p>
<pre>builder.CreateFile("xlsx");                      // create a spreadsheet file in the .xlsx format with ONLYOFFICE Document Builder
var oWorksheet = Api.GetActiveSheet();           // create a new 'oWorksheet' variable and get the created spreadsheet contents
oWorksheet.SetName("sheet 1");                   // set the 'sheet 1' name for the current active sheet
oWorksheet.SetColumnWidth(0, 20);                // set the width of the first column to 140 pixels
oWorksheet.GetRange("A1").SetValue("New cell");  // set the 'New cell' value to the A1 spreadsheet cell
builder.SaveFile("xlsx", "example.xlsx");        // save the resulting spreadsheet as a file in the .xlsx format with a new 'example.xlsx' name
builder.CloseFile();                             // close the spreadsheet file and finish work with ONLYOFFICE Document Builder</pre>
    </div>
    <h2 id="OpenSheet">Opening an existing spreadsheet</h2>
    <p>If you want to edit an already existing spreadsheet, you can open it using <b>ONLYOFFICE Document Builder</b>, get its elements and change them however you need. The only difference from a spreadsheet editor in this case will be that you will not need this spreadsheet editor. The spreadsheet is opened the following way:</p>
<pre>builder.OpenFile("https://example.com/myspreadsheet.xlsx");          // use a path to an existing 'myspreadsheet.xlsx' spreadsheet file to open it with ONLYOFFICE Document Builder
var oWorksheet = Api.GetActiveSheet();           // create a new 'oWorksheet' variable and get the created spreadsheet contents
oWorksheet.SetName("sheet 1 renamed");           // set the 'sheet 1 renamed' name for the current active sheet
oWorksheet.SetColumnWidth(0, 20);                // set the width of the first column to 140 pixels
oWorksheet.GetRange("A1").SetValue("New cell");  // set the 'New cell' value to the A1 spreadsheet cell
builder.SaveFile("xlsx", "example.xlsx");        // save the resulting spreadsheet as a file in the .xlsx format with a new 'example.xlsx' name
builder.CloseFile();                             // close the spreadsheet file and finish work with ONLYOFFICE Document Builder</pre>
    <p>As you can see you just need to use the <em>builder.OpenFile();</em> method of the <a href="<%= Url.Action("integrationapi/cdocbuilder", "docbuilder") %>">CDocBuilder</a> class with the path to the necessary spreadsheet as an argument to open it. In the above example we open <b>myspreadsheet.xlsx</b> spreadsheet, get its first sheet and change the sheet name, first column width and enter the new value into its A1 cell. The same way any other spreadsheet element can be changed.</p>
    <p>Use the appropriate API documentation sections to find out which methods allow you to change certain document and spreadsheet element formatting properties.</p>

