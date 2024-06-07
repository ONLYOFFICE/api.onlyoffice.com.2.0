<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Structure of a text document</span>
</h1>

<p class="dscr">Although a text document consists of various elements, most of them are nested in each other and three main elements can be outlined: <em>paragraph</em>, <em>table</em> and <em>block content control</em>. All the other elements are a part of these three larger ones.</p>
<p>The text itself can be added directly to a paragraph, block content control, inline text content control, range or table cell, which is a part of a table structure. But, for the sake of convenience (as it is always easier to work with smaller blocks than with larger ones) the text is usually divided into small text portions called <em>runs</em>. Each paragraph can consist either of only one text run or have dozens of them inside, depending on the paragraph complexity.</p>
<p>The text runs, in their turn, have text itself and other elements which can be a part of text: <em>images</em>, <em>shapes</em>, <em>charts</em>.</p>
<p>Besides the text runs, paragraphs can also contain <em>inline text content controls</em> and <em>hyperlinks</em>.</p>
<p>A table has a little bit more complex structure, as it comprises <em>table rows</em>, which in their turn include <em>table cells</em> within their structure. <em>Table cells</em> can have the whole <em>paragraph</em>, <em>table</em> or <em>block content control</em> structure inside them.</p>
<p>A block content control can also contain the <em>paragraph</em>, <em>table</em> or another <em>block content control</em> inside it.</p>
<p>Thus any text document structure with <b>Office JavaScript API</b> used to create it can be outlined like this:</p>

<div class="document_structure">
        <p class="node_label"><b>Office JavaScript API</b></p>
        <p class="node_description">
            Document and document elements creation:
            <br />
            <a href="<%= Url.Action("textdocumentapi/api") %>">Api</a>
        </p>
        <div class="document_structure document_node">
            <p class="node_label">Document</p>
            <p class="node_description">
                The main document properties, global color and fill/stroke settings, styles used throughout the document:
                <br />
                <a href="<%= Url.Action("textdocumentapi/apidocumentcontent") %>">ApiDocumentContent</a>, <a href="<%= Url.Action("textdocumentapi/apidocument") %>">ApiDocument</a>, <a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>, <a href="<%= Url.Action("textdocumentapi/apifill") %>">ApiFill</a>, <a href="<%= Url.Action("textdocumentapi/apistroke") %>">ApiStroke</a>, <a href="<%= Url.Action("textdocumentapi/apigradientstop") %>">ApiGradientStop</a>, <a href="<%= Url.Action("textdocumentapi/apiunicolor") %>">ApiUniColor</a>, <a href="<%= Url.Action("textdocumentapi/apipresetcolor") %>">ApiPresetColor</a>, <a href="<%= Url.Action("textdocumentapi/apirgbcolor") %>">ApiRGBColor</a>, <a href="<%= Url.Action("textdocumentapi/apischemecolor") %>">ApiSchemeColor</a>
            </p>
            <div class="document_structure section_node">
                <p class="node_label">Section</p>
                <p class="node_description">
                    Document section properties:
                    <br />
                    <a href="<%= Url.Action("textdocumentapi/apisection") %>">ApiSection</a>
                </p>
                <div class="document_structure paragraph_node">
                    <p class="node_label">Paragraph</p>
                    <p class="node_description">
                        Common paragraph properties, common text properties, current paragraph properties, paragraph numbering:
                        <br />
                        <a href="<%= Url.Action("textdocumentapi/apiparapr") %>">ApiParaPr</a>, <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>, <a href="<%= Url.Action("textdocumentapi/apiparagraph") %>">ApiParagraph</a>, <a href="<%= Url.Action("textdocumentapi/apinumbering") %>">ApiNumbering</a>, <a href="<%= Url.Action("textdocumentapi/apinumberinglevel") %>">ApiNumberingLevel</a>
                    </p>
                    <div class="document_structure textrun_node">
                        <p class="node_label">Text run</p>
                        <p class="node_description">
                            Common text properties, current text run properties:
                            <br />
                            <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>, <a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>
                        </p>
                        <div class="document_structure image_node">
                            <p class="node_label">Image</p>
                            <p class="node_description">
                                Common object properties, current image properties:
                                <br />
                                <a href="<%= Url.Action("textdocumentapi/apidrawing") %>">ApiDrawing</a>, <a href="<%= Url.Action("textdocumentapi/apiimage") %>">ApiImage</a>
                            </p>
                        </div>
                        <div class="document_structure chart_node">
                            <p class="node_label">Chart</p>
                            <p class="node_description">
                                Common object properties, current chart properties:
                                <br />
                                <a href="<%= Url.Action("textdocumentapi/apidrawing") %>">ApiDrawing</a>, <a href="<%= Url.Action("textdocumentapi/apichart") %>">ApiChart</a>
                            </p>
                        </div>
                        <div class="document_structure shape_node">
                            <p class="node_label">Shape</p>
                            <p class="node_description">
                                Common object properties, current shape properties:
                                <br />
                                <a href="<%= Url.Action("textdocumentapi/apidrawing") %>">ApiDrawing</a>, <a href="<%= Url.Action("textdocumentapi/apishape") %>">ApiShape</a>.
                                <div class="docnote">If a place for text is provided inside the shape, the whole paragraph structure can be inserted into it.</div>
                            </p>
                        </div>
                    </div>
                    <div class="document_structure inlinecontentcontrol_node">
                        <p class="node_label">Inline text content control</p>
                        <p class="node_description">
                            Common text properties, current inline text content control properties:
                            <br />
                            <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>, <a href="<%= Url.Action("textdocumentapi/apiinlinelvlsdt") %>">ApiInlineLvlSdt</a>
                        </p>
                        <div class="document_structure textrun_node">
                            <p class="node_label">Text run</p>
                        </div>
                        <div class="document_structure inlinecontentcontrol_node">
                            <p class="node_label">Inline text content control</p>
                        </div>
                        <div class="document_structure hyperlink_node">
                            <p class="node_label">Hyperlink</p>
                        </div>
                    </div>
                    <div class="document_structure hyperlink_node">
                        <p class="node_label">Hyperlink</p>
                        <p class="node_description">
                            Current hyperlink properties:
                            <br />
                            <a href="<%= Url.Action("textdocumentapi/apihyperlink") %>">ApiHyperlink</a>
                        </p>
                    </div>
                </div>
                <div class="document_structure table_node">
                    <p class="node_label">Table</p>
                    <p class="node_description">
                        Common table styles, common table properties, current table properties:
                        <br />
                        <a href="<%= Url.Action("textdocumentapi/apitablestylepr") %>">ApiTableStylePr</a>, <a href="<%= Url.Action("textdocumentapi/apitablepr") %>">ApiTablePr</a>, <a href="<%= Url.Action("textdocumentapi/apitable") %>">ApiTable</a>
                    </p>
                    <div class="document_structure tablerow_node">
                        <p class="node_label">Table row</p>
                        <p class="node_description">
                            Common table row properties, current table row properties:
                            <br />
                            <a href="<%= Url.Action("textdocumentapi/apitablerowpr") %>">ApiTableRowPr</a>, <a href="<%= Url.Action("textdocumentapi/apitablerow") %>">ApiTableRow</a>
                        </p>
                        <div class="document_structure tablecell_node">
                            <p class="node_label">Table cell</p>
                            <p class="node_description">
                                Common table cell properties, current table row properties:
                                <br />
                                <a href="<%= Url.Action("textdocumentapi/apitablecellpr") %>">ApiTableCellPr</a>, <a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>
                            </p>
                            <div class="document_structure paragraph_node">
                                <p class="node_label">Paragraph</p>
                            </div>
                            <div class="document_structure table_node">
                                <p class="node_label">Table</p>
                            </div>
                            <div class="document_structure blockcontentcontrol_node">
                                <p class="node_label">Block content control</p>
                            </div>
                        </div>
                        <div class="document_structure tablecell_node">
                            <p class="node_label">Table cell</p>
                            <p class="node_description">
                                Common table cell properties, current table row properties:
                                <br />
                                <a href="<%= Url.Action("textdocumentapi/apitablecellpr") %>">ApiTableCellPr</a>, <a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>
                            </p>
                            <div class="document_structure paragraph_node">
                                <p class="node_label">Paragraph</p>
                            </div>
                            <div class="document_structure table_node">
                                <p class="node_label">Table</p>
                            </div>
                            <div class="document_structure blockcontentcontrol_node">
                                <p class="node_label">Block content control</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="document_structure blockcontentcontrol_node">
                    <p class="node_label">Block content control</p>
                    <p class="node_description">
                        Common text properties, current block content control properties:
                        <br />
                        <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>, <a href="<%= Url.Action("textdocumentapi/apiblocklvlsdt") %>">ApiBlockLvlSdt</a>
                    </p>
                    <div class="document_structure paragraph_node">
                        <p class="node_label">Paragraph</p>
                    </div>
                    <div class="document_structure table_node">
                        <p class="node_label">Table</p>
                    </div>
                    <div class="document_structure blockcontentcontrol_node">
                        <p class="node_label">Block content control</p>
                    </div>
                </div>
            </div>
            <div class="document_structure range_node">
                <p class="node_label">Range</p>
                <p class="node_description">
                    Common text properties, current range properties:
                    <br />
                    <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>, <a href="<%= Url.Action("textdocumentapi/apirange") %>">ApiRange</a>
                </p>
                <div class="document_structure paragraph_node">
                    <p class="node_label">Paragraph</p>
                </div>
                <div class="document_structure table_node">
                    <p class="node_label">Table</p>
                </div>
                <div class="document_structure blockcontentcontrol_node">
                    <p class="node_label">Block content control</p>
                </div>
            </div>
        </div>
    </div>
<div class="global-type-definitions">
<span class="anchor-position" id="CreateNewDoc">&nbsp;</span>
<h2>Creating a new text document</h2>
    <p>The simplest example text document with a single paragraph containing centered "Center" text can be built with the help of <b>ONLYOFFICE Document Builder</b> using the following code:</p>
    <pre>builder.CreateFile("docx");                 // create a text document file in the .docx format with ONLYOFFICE Document Builder
var oDocument = Api.GetDocument();          // create a new 'oDocument' variable and get the created text document contents
var oParagraph;                             // create the 'oParagraph' variable
oParagraph = Api.CreateParagraph();         // create a new paragraph
oParagraph.SetJc("center");                 // set the paragraph justification to center the text
oParagraph.AddText("Center");               // add a text containing a single 'Center' word to the paragraph
oDocument.Push(oParagraph);                 // push the created paragraph contents with the 'Center' word to the document
builder.SaveFile("docx", "example.docx");   // save the resulting text document as a file in the .docx format with the 'example.docx' name
builder.CloseFile();                        // close the text document file and finish work with ONLYOFFICE Document Builder</pre>
    <div class="note">
        Actually in the above example the created text document will have two paragraphs, as the first paragraph is created by default for an empty text document, i.e. a new empty text document always contains at least one paragraph. You can address the first paragraph to change it using the <em>Api.GetElement(0)</em> method, so that line 4 of the above code looked like this:
<pre>oParagraph = oDocument.GetElement(0);</pre>
        and line 7 (<em>oDocument.Push(oParagraph);</em>) is not needed.
    </div>
    </div>
    <h2 id="OpenDoc">Opening an existing text document</h2>
    <p>If you want to edit an already existing text document, you can open it using <b>ONLYOFFICE Document Builder</b>, get its elements and change them however you need. The only difference from a document editor in this case will be that you will not need this text document editor. The document is opened the following way:</p>
    <pre>builder.OpenFile("https://example.com/mydocument.docx");        // use a path to an existing 'mydocument.docx' text document file to open it with ONLYOFFICE Document Builder
var oDocument = Api.GetDocument();          // create a new 'oDocument' variable and get the created text document contents
var oParagraph;                             // create the 'oParagraph' variable
oParagraph = oDocument.GetElement(0);       // get the contents of the document first paragraph
oParagraph.SetJc("center");                 // set the paragraph justification to center the text
oParagraph.AddText("Center");               // add a text containing a single 'Center' word to the paragraph
builder.SaveFile("docx", "example.docx");   // save the resulting text document as a file in the .docx format with a new 'example.docx' name
builder.CloseFile();                        // close the text document file and finish work with ONLYOFFICE Document Builder</pre>
    <p>As you can see you just need to use the <em>builder.OpenFile();</em> method of the <a href="<%= Url.Action("integrationapi/c/cdocbuilder", "docbuilder") %>">CDocBuilder</a> class with the path to the necessary text document as an argument to open it. In the above example we open <b>mydocument.docx</b> document, get its first paragraph and change the text in it to the centered "Center" text. The same way any other text document element can be changed.</p>
    <p>Use the appropriate API documentation sections to find out which methods allow you to change certain document and spreadsheet element formatting properties.</p>
