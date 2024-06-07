<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Structure of a presentation</span>
</h1>

<p class="dscr">A presentation document has a more simple structure than that of a text document, most of the presentation elements are nested within the <em>slide</em> element with all the other elements placed on it. The single or multiple <em>slide</em> elements are a part of the <em>presentation</em> element.</p>
<p>If you need all the slides to contain the same fonts and images, the <em>slide master</em> should be used. It consists of the same elements as the <em>slide</em>.</p>
<p>The <em>layout</em> can be added to the <em>slide</em> to specify its structure. Also some drawn objects - <em>images</em>, <em>shapes</em>, <em>charts</em> - can be placed directly to the <em>slide</em> or slide <em>layout</em>. The <em>placeholder</em> element can be added to the <em>shape</em>.</p>
<p>The text cannot be placed directly to the <em>slide</em>, it can be only grouped to <em>paragraphs</em> and added to the <em>shapes</em> or <em>tables</em>. For the sake of convenience (as it is always easier to work with smaller blocks than with larger ones) the text is usually divided into small text portions called <em>runs</em>. Each paragraph can consist either of only one text run or have dozens of them inside, depending on the paragraph complexity.</p>
<p>Thus any presentation document structure with <b>Office JavaScript API</b> used to create it can be outlined like this:</p>
<div class="presentation_document">
<div class="document_structure">
        <p class="node_label"><b>Office JavaScript API</b></p>
        <p class="node_description">Presentation creation, global color, theme and fill/stroke settings:<br />
            <a href="<%= Url.Action("presentationapi/api") %>">Api</a>, <a href="<%= Url.Action("presentationapi/apifill") %>">ApiFill</a>, <a href="<%= Url.Action("presentationapi/apibullet") %>">ApiBullet</a>, <a href="<%= Url.Action("presentationapi/apistroke") %>">ApiStroke</a>, <a href="<%= Url.Action("presentationapi/apigradientstop") %>">ApiGradientStop</a>, <a href="<%= Url.Action("presentationapi/apiunicolor") %>">ApiUniColor</a>, <a href="<%= Url.Action("presentationapi/apipresetcolor") %>">ApiPresetColor</a>, <a href="<%= Url.Action("presentationapi/apirgbcolor") %>">ApiRGBColor</a>, <a href="<%= Url.Action("presentationapi/apischemecolor") %>">ApiSchemeColor</a>, <a href="<%= Url.Action("presentationapi/apitheme") %>">ApiTheme</a>, <a href="<%= Url.Action("presentationapi/apithemecolorscheme") %>">ApiThemeColorScheme</a>, <a href="<%= Url.Action("presentationapi/apithemefontscheme") %>">ApiThemeFontScheme</a>, <a href="<%= Url.Action("presentationapi/apithemeformatscheme") %>">ApiThemeFormatScheme</a>
        </p>
        <div class="document_structure document_node">
            <p class="node_label">Presentation</p>
            <p class="node_description">
                Set presentation sizes, get current slide:
                <br />
                <a href="<%= Url.Action("presentationapi/apipresentation") %>">ApiPresentation</a>
            </p>
            <div class="document_structure section_node">
                <p class="node_label">Slide</p>
                <p class="node_description">
                    Add objects to the slide, set background:
                    <br />
                    <a href="<%= Url.Action("presentationapi/apislide") %>">ApiSlide</a>
                </p>
                <div class="document_structure section_node">
                    <p class="node_label">Layout</p>
                    <p class="node_description">
                        Add objects to the layout, set background:
                        <br />
                        <a href="<%= Url.Action("presentationapi/apilayout") %>">ApiLayout</a>
                    </p>
                    <div class="document_structure image_node">
                        <p class="node_label">Image</p>
                        <p class="node_description">
                            Common object properties, current image properties:
                                    <br />
                            <a href="<%= Url.Action("presentationapi/apidrawing") %>">ApiDrawing</a>, <a href="<%= Url.Action("presentationapi/apiimage") %>">ApiImage</a>
                        </p>
                    </div>
                    <div class="document_structure chart_node">
                        <p class="node_label">Chart</p>
                        <p class="node_description">
                            Common object properties, current chart properties:
                                    <br />
                            <a href="<%= Url.Action("presentationapi/apidrawing") %>">ApiDrawing</a>, <a href="<%= Url.Action("presentationapi/apichart") %>">ApiChart</a>
                        </p>
                    </div>
                    <div class="document_structure shape_node">
                        <p class="node_label">Shape</p>
                        <p class="node_description">
                            Common object properties, current shape properties:
                        <br />
                            <a href="<%= Url.Action("presentationapi/apidrawing") %>">ApiDrawing</a>, <a href="<%= Url.Action("presentationapi/apishape") %>">ApiShape</a>.
                        </p>
                        <div class="document_structure paragraph_node">
                            <p class="node_label">Paragraph</p>
                            <p class="node_description">
                                Common paragraph properties, current paragraph properties:
                            <br />
                                <a href="<%= Url.Action("presentationapi/apiparapr") %>">ApiParaPr</a>, <a href="<%= Url.Action("presentationapi/apiparagraph") %>">ApiParagraph</a>
                            </p>
                            <div class="document_structure textrun_node">
                                <p class="node_label">Text run</p>
                                <p class="node_description">
                                    Common text properties, current text run properties:
                                <br />
                                    <a href="<%= Url.Action("presentationapi/apitextpr") %>">ApiTextPr</a>, <a href="<%= Url.Action("presentationapi/apirun") %>">ApiRun</a>
                                </p>
                            </div>
                        </div>
                        <div class="document_structure paragraph_node">
                            <p class="node_label">Placeholder</p>
                            <p class="node_description">
                                Current placeholder properties:
                            <br />
                                <a href="<%= Url.Action("presentationapi/apiplaceholder") %>">ApiPlaceholder</a>
                            </p>
                        </div>
                    </div>
                    <div class="document_structure table_node">
                        <p class="node_label">Table</p>
                        <p class="node_description">
                            Common object properties, current table properties:
                            <br />
                            <a href="<%= Url.Action("presentationapi/apidrawing") %>">ApiDrawing</a>, <a href="<%= Url.Action("presentationapi/apitable") %>">ApiTable</a>.
                        </p>
                        <div class="document_structure tablerow_node">
                            <p class="node_label">Table row</p>
                            <p class="node_description">
                                Current table row properties:
                                <br />
                                <a href="<%= Url.Action("textdocumentapi/apitablerow") %>">ApiTableRow</a>
                            </p>
                            <div class="document_structure tablecell_node">
                                <p class="node_label">Table cell</p>
                                <p class="node_description">
                                    Current table cell properties:
                                    <br />
                                    <a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>
                                </p>
                                <div class="document_structure paragraph_node">
                                    <p class="node_label">Paragraph</p>
                                    <p class="node_description">
                                        Common paragraph properties, current paragraph properties:
                                    <br />
                                        <a href="<%= Url.Action("presentationapi/apiparapr") %>">ApiParaPr</a>, <a href="<%= Url.Action("presentationapi/apiparagraph") %>">ApiParagraph</a>
                                    </p>
                                    <div class="document_structure textrun_node">
                                        <p class="node_label">Text run</p>
                                        <p class="node_description">
                                            Common text properties, current text run properties:
                                        <br />
                                            <a href="<%= Url.Action("presentationapi/apitextpr") %>">ApiTextPr</a>, <a href="<%= Url.Action("presentationapi/apirun") %>">ApiRun</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="document_structure tablecell_node">
                                <p class="node_label">Table cell</p>
                                <p class="node_description">
                                    Current table cell properties:
                                    <br />
                                    <a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>
                                </p>
                                <div class="document_structure paragraph_node">
                                    <p class="node_label">Paragraph</p>
                                    <p class="node_description">
                                        Common paragraph properties, current paragraph properties:
                                    <br />
                                        <a href="<%= Url.Action("presentationapi/apiparapr") %>">ApiParaPr</a>, <a href="<%= Url.Action("presentationapi/apiparagraph") %>">ApiParagraph</a>
                                    </p>
                                    <div class="document_structure textrun_node">
                                        <p class="node_label">Text run</p>
                                        <p class="node_description">
                                            Common text properties, current text run properties:
                                        <br />
                                            <a href="<%= Url.Action("presentationapi/apitextpr") %>">ApiTextPr</a>, <a href="<%= Url.Action("presentationapi/apirun") %>">ApiRun</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="document_structure section_node">
                <p class="node_label">Slide master</p>
                <p class="node_description">
                    Add objects to the slide master, set background:
                    <br />
                    <a href="<%= Url.Action("presentationapi/apimaster") %>">ApiMaster</a>
                </p>
                <div class="document_structure section_node">
                    <p class="node_label">Layout</p>
                    <p class="node_description">
                        Add objects to the layout, set background:
                        <br />
                        <a href="<%= Url.Action("presentationapi/apilayout") %>">ApiLayout</a>
                    </p>
                    <div class="document_structure image_node">
                        <p class="node_label">Image</p>
                        <p class="node_description">
                            Common object properties, current image properties:
                                    <br />
                            <a href="<%= Url.Action("presentationapi/apidrawing") %>">ApiDrawing</a>, <a href="<%= Url.Action("presentationapi/apiimage") %>">ApiImage</a>
                        </p>
                    </div>
                    <div class="document_structure chart_node">
                        <p class="node_label">Chart</p>
                        <p class="node_description">
                            Common object properties, current chart properties:
                                    <br />
                            <a href="<%= Url.Action("presentationapi/apidrawing") %>">ApiDrawing</a>, <a href="<%= Url.Action("presentationapi/apichart") %>">ApiChart</a>
                        </p>
                    </div>
                    <div class="document_structure shape_node">
                        <p class="node_label">Shape</p>
                        <p class="node_description">
                            Common object properties, current shape properties:
                        <br />
                            <a href="<%= Url.Action("presentationapi/apidrawing") %>">ApiDrawing</a>, <a href="<%= Url.Action("presentationapi/apishape") %>">ApiShape</a>.
                        </p>
                        <div class="document_structure paragraph_node">
                            <p class="node_label">Paragraph</p>
                            <p class="node_description">
                                Common paragraph properties, current paragraph properties:
                            <br />
                                <a href="<%= Url.Action("presentationapi/apiparapr") %>">ApiParaPr</a>, <a href="<%= Url.Action("presentationapi/apiparagraph") %>">ApiParagraph</a>
                            </p>
                            <div class="document_structure textrun_node">
                                <p class="node_label">Text run</p>
                                <p class="node_description">
                                    Common text properties, current text run properties:
                                <br />
                                    <a href="<%= Url.Action("presentationapi/apitextpr") %>">ApiTextPr</a>, <a href="<%= Url.Action("presentationapi/apirun") %>">ApiRun</a>
                                </p>
                            </div>
                        </div>
                        <div class="document_structure paragraph_node">
                            <p class="node_label">Placeholder</p>
                            <p class="node_description">
                                Current placeholder properties:
                            <br />
                                <a href="<%= Url.Action("presentationapi/apiplaceholder") %>">ApiPlaceholder</a>
                            </p>
                        </div>
                    </div>
                    <div class="document_structure table_node">
                        <p class="node_label">Table</p>
                        <p class="node_description">
                            Common object properties, current table properties:
                            <br />
                            <a href="<%= Url.Action("presentationapi/apidrawing") %>">ApiDrawing</a>, <a href="<%= Url.Action("presentationapi/apitable") %>">ApiTable</a>.
                        </p>
                        <div class="document_structure tablerow_node">
                            <p class="node_label">Table row</p>
                            <p class="node_description">
                                Current table row properties:
                                <br />
                                <a href="<%= Url.Action("textdocumentapi/apitablerow") %>">ApiTableRow</a>
                            </p>
                            <div class="document_structure tablecell_node">
                                <p class="node_label">Table cell</p>
                                <p class="node_description">
                                    Current table cell properties:
                                    <br />
                                    <a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>
                                </p>
                                <div class="document_structure paragraph_node">
                                    <p class="node_label">Paragraph</p>
                                    <p class="node_description">
                                        Common paragraph properties, current paragraph properties:
                                    <br />
                                        <a href="<%= Url.Action("presentationapi/apiparapr") %>">ApiParaPr</a>, <a href="<%= Url.Action("presentationapi/apiparagraph") %>">ApiParagraph</a>
                                    </p>
                                    <div class="document_structure textrun_node">
                                        <p class="node_label">Text run</p>
                                        <p class="node_description">
                                            Common text properties, current text run properties:
                                        <br />
                                            <a href="<%= Url.Action("presentationapi/apitextpr") %>">ApiTextPr</a>, <a href="<%= Url.Action("presentationapi/apirun") %>">ApiRun</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="document_structure tablecell_node">
                                <p class="node_label">Table cell</p>
                                <p class="node_description">
                                    Current table cell properties:
                                    <br />
                                    <a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>
                                </p>
                                <div class="document_structure paragraph_node">
                                    <p class="node_label">Paragraph</p>
                                    <p class="node_description">
                                        Common paragraph properties, current paragraph properties:
                                    <br />
                                        <a href="<%= Url.Action("presentationapi/apiparapr") %>">ApiParaPr</a>, <a href="<%= Url.Action("presentationapi/apiparagraph") %>">ApiParagraph</a>
                                    </p>
                                    <div class="document_structure textrun_node">
                                        <p class="node_label">Text run</p>
                                        <p class="node_description">
                                            Common text properties, current text run properties:
                                        <br />
                                            <a href="<%= Url.Action("presentationapi/apitextpr") %>">ApiTextPr</a>, <a href="<%= Url.Action("presentationapi/apirun") %>">ApiRun</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="global-type-definitions">
<span class="anchor-position" id="CreatePresentation">&nbsp;</span>
    <h2>Creating a new presentation</h2>
    <p>The simplest example presentation with a single slide without any objects can be built with the help of <b>ONLYOFFICE Document Builder</b> using the following code:</p>
<pre>builder.CreateFile("pptx");                      // create a presentation file in the .pptx format with ONLYOFFICE Document Builder
var oPresentation = Api.GetPresentation();       // create a new 'oPresentation' variable and get the created presentation contents
var oSlide = oPresentation.GetSlideByIndex(0);   // get the first slide
oSlide.RemoveAllObjects();                       // remove all objects from the first slide
builder.SaveFile("pptx", "example.pptx");        // save the resulting presentation as a file in the .pptx format with a new 'example.pptx' name
builder.CloseFile();                             // close the presentation file and finish work with ONLYOFFICE Document Builder</pre>
    </div>
    <h2 id="OpenPresentation">Opening an existing presentation</h2>
    <p>If you want to edit an already existing presentation, you can open it using <b>ONLYOFFICE Document Builder</b>, get its elements and change them however you need. The only difference from a presentation editor in this case will be that you will not need this presentation editor. The presentation is opened the following way:</p>
<pre>builder.OpenFile("https://example.com/mypresentation.pptx");         // use a path to an existing 'mypresentation.pptx' presentation file to open it with ONLYOFFICE Document Builder
var oPresentation = Api.GetPresentation();       // create a new 'oPresentation' variable and get the created presentation contents
var oSlide = oPresentation.GetSlideByIndex(0);   // get the first slide
oSlide.RemoveAllObjects();                       // remove all objects from the first slide
builder.SaveFile("pptx", "example.pptx");        // save the resulting presentation as a file in the .pptx format with a new 'example.pptx' name
builder.CloseFile();                             // close the presentation file and finish work with ONLYOFFICE Document Builder</pre>
    <p>As you can see you just need to use the <em>builder.OpenFile();</em> method of the <a href="<%= Url.Action("integrationapi/cdocbuilder", "docbuilder") %>">CDocBuilder</a> class with the path to the necessary presentation as an argument to open it. In the above example we open <b>mypresentation.pptx</b> presentation, get its first slide and remove all objects from it. The same way any other presentation element can be changed.</p>
    <p>Use the appropriate API documentation sections to find out which methods allow you to change certain document and presentation element formatting properties.</p>
