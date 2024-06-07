<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Structure of a form</span>
</h1>

<p class="dscr">A form document has exactly the same structure as a <a href="<%= Url.Action("textdocumentapi") %>">text document</a>.
The only difference is a new <em>forms</em> entity placed with other paragraph elements – text runs, inline text content controls and hyperlinks.
There are seven form types: <em>text field</em>, <em>combo box</em>, <em>dropdown list</em>, <em>checkbox</em>, <em>radio button</em>, <em>picture form</em>, and <em>complex field</em>.</p>
<p>Thus any form document structure with <b>Office JavaScript API</b> used to create it can be outlined like this:</p>

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
                    <div class="document_structure textform_node">
                        <p class="node_label">Text field</p>
                        <p class="node_description">
                            Common object properties, common text properties, current text field properties:
                            <br />
                            <a href="<%= Url.Action("textdocumentapi/apiformbase") %>">ApiFormBase</a>, <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>, <a href="<%= Url.Action("textdocumentapi/apitextform") %>">ApiTextForm</a>
                        </p>
                    </div>
                    <div class="document_structure combobox_node">
                        <p class="node_label">Combo box / dropdown list</p>
                        <p class="node_description">
                            Common object properties, common text properties, current combo box / dropdown list properties:
                            <br />
                            <a href="<%= Url.Action("textdocumentapi/apiformbase") %>">ApiFormBase</a>, <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>, <a href="<%= Url.Action("textdocumentapi/apicomboboxform") %>">ApiComboBoxForm</a>
                        </p>
                    </div>
                    <div class="document_structure checkbox_node">
                        <p class="node_label">Checkbox / radio button</p>
                        <p class="node_description">
                            Common object properties, current checkbox / radio button properties:
                            <br />
                            <a href="<%= Url.Action("textdocumentapi/apiformbase") %>">ApiFormBase</a>, <a href="<%= Url.Action("textdocumentapi/apicheckboxform") %>">ApiCheckBoxForm</a>
                        </p>
                    </div>
                    <div class="document_structure picture_node">
                        <p class="node_label">Picture form</p>
                        <p class="node_description">
                            Common object properties, current picture form properties:
                            <br />
                            <a href="<%= Url.Action("textdocumentapi/apiformbase") %>">ApiFormBase</a>, <a href="<%= Url.Action("textdocumentapi/apipictureform") %>">ApiPictureForm</a>
                        </p>
                    </div>
                    <div class="document_structure complex_node">
                        <p class="node_label">Complex field</p>
                        <p class="node_description">
                            Common object properties, common text properties, current complex field properties:
                            <br />
                            <a href="<%= Url.Action("textdocumentapi/apiformbase") %>">ApiFormBase</a>, <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>, <a href="<%= Url.Action("textdocumentapi/apicomplexform") %>">ApiComplexForm</a>
                        </p>
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
<h2>Creating a new form document</h2>
    <p>To create a form document, the <a href="<%= Url.Action("integrationapi/c/cdocbuilder/createfile", "docbuilder") %>">CreateFile</a> method with the <em>"pdf"</em> extension must be used.</p>
    <p>To save the ready document as a form, you need to use the <a href="<%= Url.Action("integrationapi/c/cdocbuilder/savefile", "docbuilder") %>">SaveFile</a> method with the <em>"pdf"</em> extension.</p>
    <p>The simplest example form document with a single text form containing the "John Smith" text can be built with the help of <b>ONLYOFFICE Document Builder</b> using the following code:</p>
    <pre>builder.CreateFile("pdf");                      // create a form document file in the .pdf format with ONLYOFFICE Document Builder
var oDocument = Api.GetDocument();                // create a new 'oDocument' variable and get the created text document contents
var oTextForm = Api.CreateTextForm();             // create an empty text form
var oParagraph = oDocument.GetElement(0);         // get the first empty paragraph from the created document
oParagraph.AddElement(oTextForm);                 // add the created text form to the first paragraph
oTextForm.SetText("John Smith");                  // add the "John Smith" text to the text form
builder.SaveFile("pdf", "example.pdf");        // save the resulting form document as a file in the pdf format with the 'example.pdf' name
builder.CloseFile();                              // close the form document file and finish work with ONLYOFFICE Document Builder</pre>
    </div>
    <h2 id="OpenDoc">Opening an existing form document</h2>
    <p>If you want to edit an already existing form document, you can open it using <b>ONLYOFFICE Document Builder</b>, get its elements and change them however you need. The only difference from a document editor in this case will be that you will not need this document editor. The document is opened the following way:</p>
    <pre>builder.OpenFile("https://example.com/myformdocument.pdf");        // use a path to an existing 'myformdocument.pdf' form document file to open it with ONLYOFFICE Document Builder
var oDocument = Api.GetDocument();                // create a new 'oDocument' variable and get the created text document contents
var oTextForm = Api.CreateTextForm();             // create an empty text form
var oParagraph = oDocument.GetElement(0);         // get the first empty paragraph from the created document
oParagraph.AddElement(oTextForm);                 // add the created text form to the first paragraph
oTextForm.SetText("John Smith");                  // add the "John Smith" text to the text form
builder.SaveFile("pdf", "example.pdf");       // save the resulting form document as a file in the pdf format with the 'example.pdf' name
builder.CloseFile();                              // close the form document file and finish work with ONLYOFFICE Document Builder</pre>
    <p>As you can see you just need to use the <em>builder.OpenFile();</em> method of the <a href="<%= Url.Action("integrationapi/cdocbuilder", "docbuilder") %>">CDocBuilder</a> class with the path to the necessary form document as an argument to open it. In the above example we open <b>myformdocument.pdf</b> document, get its first paragraph and add the text form with the "John Smith" text to it. The same way any other form document element can be changed.</p>
    <p>Use the appropriate API documentation sections to find out which methods allow you to change certain document and spreadsheet element formatting properties.</p>
