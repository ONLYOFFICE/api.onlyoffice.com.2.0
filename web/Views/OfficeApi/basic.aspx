<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Overview
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Overview</span>
    </h1>

    <div class="pvl_wrapper">
        <span class="pvl_product">Office JavaScript API</span><span class="pvl_version">v<%= Products.Get("officeapi").Version %></span>
    </div>

    <p class="dscr">As any document is a composite object consisting of a tree of larger nodes (paragraphs and tables) where it is possible to insert smaller document elements (text runs, images, charts, shapes),
        <b>Office API</b> allows to insert the content and format it to your liking quickly and easily.
    </p>
    <p>
        Office API is the JavaScript library which is used to work with the document editor.
        It contains classes and methods for every document type: <a href="<%= Url.Action("textdocumentapi") %>">Text document API</a>,
        <a href="<%= Url.Action("spreadsheetapi") %>">Spreadsheet API</a>, <a href="<%= Url.Action("presentationapi") %>">Presentation API</a>, and <a href="<%= Url.Action("formapi") %>">Form API</a>.
    </p>

    <h2>Where to use</h2>
    <p>Here are some examples of where you can use Office API:</p>
    <ul>
        <li>build <a href="<%= Url.Action("structure", "plugin") %>">plugins</a> using Office API in the plugin code <em>.js</em> file
            to interact with the editor content and web services;</li>
        <li>write <a href="<%= Url.Action("macros", "plugin") %>">macros</a> using the JavaScript syntax and Office API scripting notation;</li>
        <li>generate documents using Office API in the <a href="<%= Url.Action("basic", "docbuilder") %>">Document Builder scripts</a>.</li>
    </ul>

    <h2>Where to start</h2>
    <p>If you are not sure where to start, you can use the list of most common tasks below to find where to go and start creating your document:</p>
    
    <div class="buider_page_methods_list">
    <div class="kb_index_page">    
    <h5>Basic document actions</h5>
    <ul>
        <li><a href="#" class="button-popap-open" data-body="body1">create a new document</a></li>
        <li><a href="#" class="button-popap-open" data-body="body2">edit an existing document</a></li>
    </ul>
    </div>
    <div class="kb_index_page">
    <h5>Main paragraph actions</h5>
    <ul>
        <li><a href="#" class="button-popap-open" data-body="body3">create a paragraph</a></li>
        <li><a href="#" class="button-popap-open" data-body="body4">edit the text in the existing paragraph</a></li>
        <li><a href="#" class="button-popap-open" data-body="body5">change the paragraph properties (text documents)</a></li>
        <li><a href="#" class="button-popap-open" data-body="body6">change the paragraph properties (spreadsheet)</a></li>
        <li><a href="#" class="button-popap-open" data-body="body7">change the paragraph properties (presentations)</a></li>
        <li><a href="#" class="button-popap-open" data-body="body8">edit the paragraph borders</a></li>
        <li><a href="#" class="button-popap-open" data-body="body9">create a paragraph with an existing style</a></li>
    </ul>
    </div>
    <div class="kb_index_page">
    <h5>Modifying fonts</h5>
    <ul>
        <li><a href="#" class="button-popap-open" data-body="body10">change the text font family</a></li>
        <li><a href="#" class="button-popap-open" data-body="body11">change the text font size</a></li>
        <li><a href="#" class="button-popap-open" data-body="body12">make the text font italic</a></li>
        <li><a href="#" class="button-popap-open" data-body="body61">make the text font bold</a></li>
        <li><a href="#" class="button-popap-open" data-body="body13">make the text font strikeout</a></li>
        <li><a href="#" class="button-popap-open" data-body="body14">make the text font double strikeout</a></li>
        <li><a href="#" class="button-popap-open" data-body="body15">make the text font underlined</a></li>
        <li><a href="#" class="button-popap-open" data-body="body16">change the text font color</a></li>
        <li><a href="#" class="button-popap-open" data-body="body17">change the text font background color</a></li>
        <li><a href="#" class="button-popap-open" data-body="body62">change the text font highlighting</a></li>
        <li><a href="#" class="button-popap-open" data-body="body18">make the text font capitalized</a></li>
        <li><a href="#" class="button-popap-open" data-body="body19">make the text font small capitalized</a></li>
        <li><a href="#" class="button-popap-open" data-body="body20">make the text font spacing</a></li>
    </ul>
    </div>
    <div class="kb_index_page">
    <h5>Creating and editing tables</h5>
    <ul>
        <li><a href="#" class="button-popap-open" data-body="body21">create a table</a></li>
        <li><a href="#" class="button-popap-open" data-body="body22">create a table with an existing style</a></li>
        <li><a href="#" class="button-popap-open" data-body="body23">add a new row</a></li>
        <li><a href="#" class="button-popap-open" data-body="body24">add a new column</a></li>
        <li><a href="#" class="button-popap-open" data-body="body25">get a specific row</a></li>
        <li><a href="#" class="button-popap-open" data-body="body26">get a specific cell</a></li>
        <li><a href="#" class="button-popap-open" data-body="body27">add some text to the cell</a></li>
        <li><a href="#" class="button-popap-open" data-body="body28">set the table width</a></li>
        <li><a href="#" class="button-popap-open" data-body="body29">set the table borders</a></li>
        <li><a href="#" class="button-popap-open" data-body="body30">set the table background</a></li>
        <li><a href="#" class="button-popap-open" data-body="body31">set the table cell margins</a></li>
        <li><a href="#" class="button-popap-open" data-body="body32">set borders to a single table cell</a></li>
        <li><a href="#" class="button-popap-open" data-body="body33">set the background to a single table cell</a></li>
        <li><a href="#" class="button-popap-open" data-body="body34">set width to the table column</a></li>
        <li><a href="#" class="button-popap-open" data-body="body35">set the text direction in a table cell</a></li>
    </ul>
    </div>
    <div class="kb_index_page">
    <h5>Working with lists</h5>
    <ul>
        <li><a href="#" class="button-popap-open" data-body="body36">add a bulleted list</a></li>
        <li><a href="#" class="button-popap-open" data-body="body37">add a numbered list</a></li>
    </ul>
    </div>
    <div class="kb_index_page">
    <h5>Columns</h5>
    <ul>
        <li><a href="#" class="button-popap-open" data-body="body38">add columns</a></li>
    </ul>
    </div>
    <div class="kb_index_page">
    <h5>Page breaks</h5>
    <ul>
        <li><a href="#" class="button-popap-open" data-body="body39">add a page break</a></li>
    </ul>
    </div>
    <div class="kb_index_page">
    <h5>Headers and footers</h5>
    <ul>
        <li><a href="#" class="button-popap-open" data-body="body40">get and edit a page header</a></li>
        <li><a href="#" class="button-popap-open" data-body="body41">get and edit a page footer</a></li>
    </ul>
    </div>
    <div class="kb_index_page">
    <h5>Using shapes, images and charts</h5>
    <ul>
        <li><a href="#" class="button-popap-open" data-body="body42">create a shape</a></li>
        <li><a href="#" class="button-popap-open" data-body="body43">add text to the shape</a></li>
        <li><a href="#" class="button-popap-open" data-body="body44">create a chart</a></li>
        <li><a href="#" class="button-popap-open" data-body="body45">add an image to the document</a></li>
    </ul>
    </div>
    <div class="kb_index_page">
    <h5>Text language</h5>
    <ul>
        <li><a href="#" class="button-popap-open" data-body="body46">set the text language</a></li>
    </ul>
    </div>
    <div class="kb_index_page">
    <h5>Page size and margins</h5>
    <ul>
        <li><a href="#" class="button-popap-open" data-body="body47">set the page size</a></li>
        <li><a href="#" class="button-popap-open" data-body="body48">set the page margins</a></li>
    </ul>
    </div>
    <div class="kb_index_page">
        <h5>Creating and editing forms</h5>
        <ul>
            <li><a href="#" class="button-popap-open" data-body="body49">create a form</a></li>
            <li><a href="#" class="button-popap-open" data-body="body50">set the border color to the form</a></li>
            <li><a href="#" class="button-popap-open" data-body="body51">set the placeholder text to the form</a></li>
            <li><a href="#" class="button-popap-open" data-body="body52">set the text properties to the form</a></li>
            <li><a href="#" class="button-popap-open" data-body="body53">clear the form</a></li>
            <li><a href="#" class="button-popap-open" data-body="body54">get the tip text from the form</a></li>
            <li><a href="#" class="button-popap-open" data-body="body55">get the text from the form</a></li>
            <li><a href="#" class="button-popap-open" data-body="body56">make a form fixed size</a></li>
            <li><a href="#" class="button-popap-open" data-body="body57">set the picture position inside the form</a></li>
            <li><a href="#" class="button-popap-open" data-body="body58">set the radio group key to the checkbox</a></li>
            <li><a href="#" class="button-popap-open" data-body="body59">set the list values to the combo box</a></li>
            <li><a href="#" class="button-popap-open" data-body="body60">select the specified value from the combo box list values</a></li>
            
        </ul>
        </div>
    </div>
        
    <div id="containerDialog" class="popap-dialog">
        <div class="popap-container">
            <div id="body1" class="tags_content">
                <h5>Learn how to <span class="tag_name">create a new document</span></h5>
                <div>
                   <ul>
                       <li><a target="blank" href="<%= Url.Action("textdocumentapi") %>#CreateNewDoc">Creating a new text document</a></li>
                       <li><a target="blank" href="<%= Url.Action("spreadsheetapi") %>#CreateSheet">Creating a new spreadsheet</a></li>
                       <li><a target="blank" href="<%= Url.Action("presentationapi") %>#CreatePresentation">Creating a new presentation</a></li>
                   </ul>
                </div>
            </div>
            <div id="body2" class="tags_content">
                <h5>Learn how to <span class="tag_name">edit an existing document</span></h5>
                <div>
                   <ul>
                       <li><a target="blank" href="<%= Url.Action("textdocumentapi") %>#OpenDoc">Opening an existing text document</a></li>
                       <li><a target="blank" href="<%= Url.Action("spreadsheetapi") %>#OpenSheet">Opening an existing spreadsheet</a></li>
                       <li><a target="blank" href="<%= Url.Action("presentationapi") %>#OpenPresentation">Opening an existing presentation</a></li>
                   </ul>
                </div>
            </div>
            <div id="body3" class="tags_content">
                <h5>Learn how to <span class="tag_name">create a paragraph</span></h5>
                <div>
                   <ul>
                       <li>Create a paragraph (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/api/createparagraph") %>">Api.CreateParagraph</a></li>
                       <li>Create a paragraph (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/api/createparagraph") %>">Api.CreateParagraph</a></li>
                       <li>Create a paragraph (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/api/createparagraph") %>">Api.CreateParagraph</a></li>
                       <li>Push the created paragraph (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apidocument/push") %>">ApiDocument.Push</a></li>
                       <li>Push the created paragraph (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apidocumentcontent/push") %>">ApiDocumentContent.Push</a></li>
                       <li>Push the created paragraph (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apidocumentcontent/push") %>">ApiDocumentContent.Push</a></li>
                   </ul>
                </div>
            </div>
            <div id="body4" class="tags_content">
                <h5>Learn how to <span class="tag_name">edit the text in the existing paragraph</span></h5>
                <div>
                   <ul>
                       <li>Get paragraph in document (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apidocument/getelement") %>">ApiDocument.GetElement</a></li>
                       <li>Get paragraph in document (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apidocumentcontent/getelement") %>">ApiDocumentContent.GetElement</a></li>
                       <li>Get paragraph in document (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apidocumentcontent/getelement") %>">ApiDocumentContent.GetElement</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body5" class="tags_content">
                <h5>Learn how to <span class="tag_name">change the paragraph properties (text documents)</span></h5>
                <div>
                   <ul>
                       <li>Set text alignment in paragraph &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apiparagraph/setjc") %>">ApiParagraph.SetJc</a></li>
                       <li>Set first line indentation &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apiparagraph/setindfirstline") %>">ApiParagraph.SetIndFirstLine</a></li>
                       <li>Set paragraph left side indentation &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apiparagraph/setindleft") %>">ApiParagraph.SetIndLeft</a></li>
                       <li>Set paragraph right side indentation &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apiparagraph/setindright") %>">ApiParagraph.SetIndRight</a></li>
                       <li>Set paragraph spacing &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apiparagraph/setspacingbefore") %>">ApiParagraph.SetSpacingBefore</a>/<a target="blank" href="<%= Url.Action("textdocumentapi/apiparagraph/setspacingafter") %>">SetSpacingAfter</a></li>
                       <li>Set paragraph background &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apiparagraph/setshd") %>">ApiParagraph.SetShd</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body6" class="tags_content">
                <h5>Learn how to <span class="tag_name">change the paragraph properties (spreadsheet)</span></h5>
                <div>
                   <ul>
                       <li>Set text alignment in paragraph &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apiparagraph/setjc") %>">ApiParagraph.SetJc</a></li>
                       <li>Set first line indentation &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apiparagraph/setindfirstline") %>">ApiParagraph.SetIndFirstLine</a></li>
                       <li>Set paragraph left side indentation &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apiparagraph/setindleft") %>">ApiParagraph.SetIndLeft</a></li>
                       <li>Set paragraph right side indentation &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apiparagraph/setindright") %>">ApiParagraph.SetIndRight</a></li>
                       <li>Set paragraph spacing &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apiparagraph/setspacingbefore") %>">ApiParagraph.SetSpacingBefore</a>/<a target="blank" href="<%= Url.Action("spreadsheetapi/apiparagraph/setspacingafter") %>">SetSpacingAfter</a></li>
                   </ul>
                </div>
            </div>
            <div id="body7" class="tags_content">
                <h5>Learn how to <span class="tag_name">change the paragraph properties (presentations)</span></h5>
                <div>
                   <ul>
                       <li>Set text alignment in paragraph &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apiparagraph/setjc") %>">ApiParagraph.SetJc</a></li>
                       <li>Set first line indentation &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apiparagraph/setindfirstline") %>">ApiParagraph.SetIndFirstLine</a></li>
                       <li>Set paragraph left side indentation &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apiparagraph/setindleft") %>">ApiParagraph.SetIndLeft</a></li>
                       <li>Set paragraph right side indentation &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apiparagraph/setindright") %>">ApiParagraph.SetIndRight</a></li>
                       <li>Set paragraph spacing &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apiparagraph/setspacingbefore") %>">ApiParagraph.SetSpacingBefore</a>/<a target="blank" href="<%= Url.Action("presentationapi/apiparagraph/setspacingafter") %>">SetSpacingAfter</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body8" class="tags_content">
                <h5>Learn how to <span class="tag_name">edit the paragraph borders</span></h5>
                <div>
                   <ul>
                       <li>Set paragraph between borders &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apiparagraph/setbetweenborder") %>">ApiParagraph.SetBetweenBorder</a></li>
                       <li>Set top border &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apiparagraph/settopborder") %>">ApiParagraph.SetTopBorder</a></li>
                       <li>Set bottom border &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apiparagraph/setbottomborder") %>">ApiParagraph.SetBottomBorder</a></li>
                       <li>Set right border &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apiparagraph/setrightborder") %>">ApiParagraph.SetRightBorder</a></li>
                       <li>Set left border &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apiparagraph/setleftborder") %>">ApiParagraph.SetLeftBorder</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body9" class="tags_content">
                <h5>Learn how to <span class="tag_name">create a paragraph with an existing style</span></h5>
                <div>
                   <ul>
                       <li>Create a paragraph with a style (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apiparapr") %>">ApiParaPr</a></li>
                       <li>Create a paragraph with a style (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apiparapr") %>">ApiParaPr</a></li>
                       <li>Create a paragraph with a style (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apiparapr") %>">ApiParaPr</a></li>
                   </ul>
                </div>
            </div>
            <div id="body10" class="tags_content">
                <h5>Learn how to <span class="tag_name">change the text font family</span></h5>
                <div>
                   <ul>
                       <li>Set font family for part of text or single word (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apirun/setfontfamily") %>">ApiRun.SetFontFamily</a></li>
                       <li>Set font family for part of text or single word (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apirun/setfontfamily") %>">ApiRun.SetFontFamily</a></li>
                       <li>Set font family for part of text or single word (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apirun/setfontfamily") %>">ApiRun.SetFontFamily</a></li>
                       <li>Set font family for whole text (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextpr/setfontfamily") %>">ApiTextPr.SetFontFamily</a></li>
                       <li>Set font family for whole text (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apitextpr/setfontfamily") %>">ApiTextPr.SetFontFamily</a></li>
                       <li>Set font family for whole text (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apitextpr/setfontfamily") %>">ApiTextPr.SetFontFamily</a></li>
                   </ul>
                </div>
            </div>
            <div id="body11" class="tags_content">
                <h5>Learn how to <span class="tag_name">change the text font size</span></h5>
                <div>
                   <ul>
                       <li>Set font size for part of text or single word (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apirun/setfontsize") %>">ApiRun.SetFontSize</a></li>
                       <li>Set font size for part of text or single word (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apirun/setfontsize") %>">ApiRun.SetFontSize</a></li>
                       <li>Set font size for part of text or single word (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apirun/setfontsize") %>">ApiRun.SetFontSize</a></li>
                       <li>Set font size for whole text (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextpr/setfontsize") %>">ApiTextPr.SetFontSize</a></li>
                       <li>Set font size for whole text (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apitextpr/setfontsize") %>">ApiTextPr.SetFontSize</a></li>
                       <li>Set font size for whole text (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apitextpr/setfontsize") %>">ApiTextPr.SetFontSize</a></li>
                   </ul>
                </div>
            </div>
            <div id="body12" class="tags_content">
                <h5>Learn how to <span class="tag_name">make the text font italic</span></h5>
                <div>
                   <ul>
                       <li>Make font italic for part of text or single word (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apirun/setitalic") %>">ApiRun.SetItalic</a></li>
                       <li>Make font italic for part of text or single word (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apirun/setitalic") %>">ApiRun.SetItalic</a></li>
                       <li>Make font italic for part of text or single word (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apirun/setitalic") %>">ApiRun.SetItalic</a></li>
                       <li>Make font italic for whole text (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextpr/setitalic") %>">ApiTextPr.SetItalic</a></li>
                       <li>Make font italic for whole text (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apitextpr/setitalic") %>">ApiTextPr.SetItalic</a></li>
                       <li>Make font italic for whole text (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apitextpr/setitalic") %>">ApiTextPr.SetItalic</a></li>
                   </ul>
                </div>
            </div>
            <div id="body61" class="tags_content">
                <h5>Learn how to <span class="tag_name">make the text font bold</span></h5>
                <div>
                   <ul>
                       <li>Make font bold for part of text or single word (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apirun/setbold") %>">ApiRun.SetBold</a></li>
                       <li>Make font bold for part of text or single word (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apirun/setbold") %>">ApiRun.SetBold</a></li>
                       <li>Make font bold for part of text or single word (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apirun/setbold") %>">ApiRun.SetBold</a></li>
                       <li>Make font bold for whole text (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextpr/setbold") %>">ApiTextPr.SetBold</a></li>
                       <li>Make font bold for whole text (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apitextpr/setbold") %>">ApiTextPr.SetBold</a></li>
                       <li>Make font bold for whole text (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apitextpr/setbold") %>">ApiTextPr.SetBold</a></li>
                   </ul>
                </div>
            </div>
            <div id="body13" class="tags_content">
                <h5>Learn how to <span class="tag_name">make the text font strikeout</span></h5>
                <div>
                   <ul>
                       <li>Make font strikeout for part of text or single word (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apirun/setstrikeout") %>">ApiRun.SetStrikeout</a></li>
                       <li>Make font strikeout for part of text or single word (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apirun/setstrikeout") %>">ApiRun.SetStrikeout</a></li>
                       <li>Make font strikeout for part of text or single word (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apirun/setstrikeout") %>">ApiRun.SetStrikeout</a></li>
                       <li>Make font strikeout for whole text (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextpr/setstrikeout") %>">ApiTextPr.SetStrikeout</a></li>
                       <li>Make font strikeout for whole text (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apitextpr/setstrikeout") %>">ApiTextPr.SetStrikeout</a></li>
                       <li>Make font strikeout for whole text (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apitextpr/setstrikeout") %>">ApiTextPr.SetStrikeout</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body14" class="tags_content">
                <h5>Learn how to <span class="tag_name">make the text font double strikeout</span></h5>
                <div>
                   <ul>
                       <li>Make font double strikeout for part of text or single word (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apirun/setdoublestrikeout") %>">ApiRun.SetDoubleStrikeout</a></li>
                       <li>Make font double strikeout for part of text or single word (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apirun/setdoublestrikeout") %>">ApiRun.SetDoubleStrikeout</a></li>
                       <li>Make font double strikeout for part of text or single word (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apirun/setdoublestrikeout") %>">ApiRun.SetDoubleStrikeout</a></li>
                       <li>Make font double strikeout for whole text (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextpr/setdoublestrikeout") %>">ApiTextPr.SetDoubleStrikeout</a></li>
                       <li>Make font double strikeout for whole text (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apitextpr/setdoublestrikeout") %>">ApiTextPr.SetDoubleStrikeout</a></li>
                       <li>Make font double strikeout for whole text (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apitextpr/setdoublestrikeout") %>">ApiTextPr.SetDoubleStrikeout</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body15" class="tags_content">
                <h5>Learn how to <span class="tag_name">make the text font underlined</span></h5>
                <div>
                   <ul>
                       <li>Make font underlined for part of text or single word (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apirun/setunderline") %>">ApiRun.SetUnderline</a></li>
                       <li>Make font underlined for part of text or single word (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apirun/setunderline") %>">ApiRun.SetUnderline</a></li>
                       <li>Make font underlined for part of text or single word (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apirun/setunderline") %>">ApiRun.SetUnderline</a></li>
                       <li>Make font underlined for whole text (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextpr/setunderline") %>">ApiTextPr.SetUnderline</a></li>
                       <li>Make font underlined for whole text (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apitextpr/setunderline") %>">ApiTextPr.SetUnderline</a></li>
                       <li>Make font underlined for whole text (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apitextpr/setunderline") %>">ApiTextPr.SetUnderline</a></li>
                   </ul>
                </div>
            </div>
            <div id="body16" class="tags_content">
                <h5>Learn how to <span class="tag_name">change the text font color</span></h5>
                <div>
                   <ul>
                      <li>Set font color for part of text or single word (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apirun/setcolor") %>">ApiRun.SetColor</a></li>
                      <li>Set font color for part of text or single word (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apirun/setfill") %>">ApiRun.SetFill</a></li>
                      <li>Set font color for part of text or single word (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apirun/setfill") %>">ApiRun.SetFill</a></li>
                      <li>Set font color for whole text (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextpr/setcolor") %>">ApiTextPr.SetColor</a></li>
                      <li>Set font color for whole text (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apitextpr/setfill") %>">ApiTextPr.SetFill</a></li>
                      <li>Set font color for whole text (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apitextpr/setfill") %>">ApiTextPr.SetFill</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body17" class="tags_content">
                <h5>Learn how to <span class="tag_name">change the text font background color</span></h5>
                <div>
                   <ul>
                       <li>Set font background color for part of text or single word &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apirun/setshd") %>">ApiRun.SetShd</a></li>
                       <li>Set font background color for whole text &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextpr/setshd") %>">ApiTextPr.SetShd</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body62" class="tags_content">
                <h5>Learn how to <span class="tag_name">change the text font highlighting</span></h5>
                <div>
                   <ul>
                      <li>Set font highlighting for part of text or single word (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apirun/sethighlight") %>">ApiRun.SetHighlight</a></li>
                      <li>Set font highlighting for part of text or single word (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apirun/sethighlight") %>">ApiRun.SetHighlight</a></li>
                      <li>Set font highlighting for part of text or single word (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apirun/sethighlight") %>">ApiRun.SetHighlight</a></li>
                      <li>Set font highlighting for whole text (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextpr/sethighlight") %>">ApiTextPr.SetHighlight</a></li>
                    </ul>
                </div>
            </div>
            <div id="body18" class="tags_content">
                <h5>Learn how to <span class="tag_name">make the text font capitalized</span></h5>
                <div>
                   <ul>
                       <li>Make font capitalized for part of text or single word (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apirun/setcaps") %>">ApiRun.SetCaps</a></li>
                       <li>Make font capitalized for part of text or single word (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apirun/setcaps") %>">ApiRun.SetCaps</a></li>
                       <li>Make font capitalized for part of text or single word (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apirun/setcaps") %>">ApiRun.SetCaps</a></li>
                       <li>Make font capitalized for whole text (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextpr/setcaps") %>">ApiTextPr.SetCaps</a></li>
                       <li>Make font capitalized for whole text (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apitextpr/setcaps") %>">ApiTextPr.SetCaps</a></li>
                       <li>Make font capitalized for whole text (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apitextpr/setcaps") %>">ApiTextPr.SetCaps</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body19" class="tags_content">
                <h5>Learn how to <span class="tag_name">make the text font small capitalized</span></h5>
                <div>
                   <ul>
                       <li>Make font small capitalized for part of text or single word (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apirun/setsmallcaps") %>">ApiRun.SetSmallCaps</a></li>
                       <li>Make font small capitalized for part of text or single word (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apirun/setsmallcaps") %>">ApiRun.SetSmallCaps</a></li>
                       <li>Make font small capitalized for part of text or single word (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apirun/setsmallcaps") %>">ApiRun.SetSmallCaps</a></li>
                       <li>Make font small capitalized for whole text (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextpr/setsmallcaps") %>">ApiTextPr.SetSmallCaps</a></li>
                       <li>Make font small capitalized for whole text (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apitextpr/setsmallcaps") %>">ApiTextPr.SetSmallCaps</a></li>
                       <li>Make font small capitalized for whole text (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apitextpr/setsmallcaps") %>">ApiTextPr.SetSmallCaps</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body20" class="tags_content">
                <h5>Learn how to <span class="tag_name">make the text font spacing</span></h5>
                <div>
                   <ul>
                       <li>Set font spacing for part of text or single word (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apirun/setspacing") %>">ApiRun.SetSpacing</a></li>
                       <li>Set font spacing for part of text or single word (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apirun/setspacing") %>">ApiRun.SetSpacing</a></li>
                       <li>Set font spacing for part of text or single word (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apirun/setspacing") %>">ApiRun.SetSpacing</a></li>
                       <li>Set font spacing for whole text (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextpr/setspacing") %>">ApiTextPr.SetSpacing</a></li>
                       <li>Set font spacing for whole text (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apitextpr/setspacing") %>">ApiTextPr.SetSpacing</a></li>
                       <li>Set font spacing for whole text (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apitextpr/setspacing") %>">ApiTextPr.SetSpacing</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body21" class="tags_content">
                <h5>Learn how to <span class="tag_name">create a table</span></h5>
                <div>
                   <ul>
                       <li>Create a table &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/api/createtable") %>">Api.CreateTable</a></li>
                       <li>Push the created table &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apidocument/push") %>">ApiDocument.Push</a></li>
                   </ul>
                </div>
            </div>  
            <div id="body22" class="tags_content">
                <h5>Learn how to <span class="tag_name">create a table with an existing style</span></h5>
                <div>
                   <ul>
                       <li>Create table with existing style &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/setstyle") %>">ApiTable.SetStyle</a></li>
                       <li>Create table and base style on existing one &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apistyle/setbasedon") %>">ApiStyle.SetBasedOn</a></li>
                   </ul>
                </div>
            </div>
            <div id="body23" class="tags_content">
                <h5>Learn how to <span class="tag_name">add a new row</span></h5>
                <div>
                   <ul>
                       <li>Add a new row &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/addrow") %>">ApiTable.AddRow</a></li>
                   </ul>
                </div>
            </div>  
            <div id="body24" class="tags_content">
                <h5>Learn how to <span class="tag_name">add a new column</span></h5>
                <div>
                   <ul>
                       <li>Add a new column &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/addcolumn") %>">ApiTable.AddColumn</a></li>
                   </ul>
                </div>
            </div>   
            <div id="body25" class="tags_content">
                <h5>Learn how to <span class="tag_name">get a specific row</span></h5>
                <div>
                   <ul>
                       <li>Get a specific existing/created row &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/getrow") %>">ApiTable.GetRow</a></li>
                   </ul>
                </div>
            </div>
            <div id="body26" class="tags_content">
                <h5>Learn how to <span class="tag_name">get a specific cell</span></h5>
                <div>
                   <ul>
                       <li>Get a specific existing cell &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitablerow/getcell") %>">ApiTableRow.GetCell</a></li>
                   </ul>
                </div>
            </div>
            <div id="body27" class="tags_content">
                <h5>Learn how to <span class="tag_name">add some text to the cell</span></h5>
                <div>
                   <ul>
                       <li>Add text to table cell &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitablecell/getcontent") %>">ApiTableCell.GetContent</a></li>
                   </ul>
                </div>
            </div>
            <div id="body28" class="tags_content">
                <h5>Learn how to <span class="tag_name">set the table width</span></h5>
                <div>
                   <ul>
                       <li>Set table width &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/setwidth") %>">ApiTable.SetWidth</a></li>
                   </ul>
                </div>
            </div>
            <div id="body29" class="tags_content">
                <h5>Learn how to <span class="tag_name">set the table borders</span></h5>
                <div>
                   <ul>
                       <li>Set table top border &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/settablebordertop") %>">ApiTable.SetTableBorderTop</a></li>
                       <li>Set table bottom border &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/settableborderbottom") %>">ApiTable.SetTableBorderBottom</a></li>
                       <li>Set table right border &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/settableborderright") %>">ApiTable.SetTableBorderRight</a></li>
                       <li>Set table left border &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/settableborderleft") %>">ApiTable.SetTableBorderLeft</a></li>
                       <li>Set table inside horizontal border &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/settableborderinsideh") %>">ApiTable.SetTableBorderInsideH</a></li>
                       <li>Set table inside vertical border &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/settableborderinsidev") %>">ApiTable.SetTableBorderInsideV</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body30" class="tags_content">
                <h5>Learn how to <span class="tag_name">set the table background</span></h5>
                <div>
                   <ul>
                       <li>Set table background &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/setshd") %>">ApiTable.SetShd</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body31" class="tags_content">
                <h5>Learn how to <span class="tag_name">set the table cell margins</span></h5>
                <div>
                   <ul>
                       <li>Set table cell top margin &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/settablecellmargintop") %>">ApiTable.SetTableCellMarginTop</a></li>
                       <li>Set table cell bottom margin &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/settablecellmarginbottom") %>">ApiTable.SetTableCellMarginBottom</a></li>
                       <li>Set table cell right margin &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/settablecellmarginright") %>">ApiTable.SetTableCellMarginRight</a></li>
                       <li>Set table cell left margin &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitable/settablecellmarginleft") %>">ApiTable.SetTableCellMarginLeft</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body32" class="tags_content">
                <h5>Learn how to <span class="tag_name">set borders to a single table cell</span></h5>
                <div>
                   <ul>
                       <li>Set table cell top border &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitablecell/setcellbordertop") %>">ApiTableCell.SetCellBorderTop</a></li>
                       <li>Set table cell bottom border &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitablecell/setcellborderbottom") %>">ApiTableCell.SetCellBorderBottom</a></li>
                       <li>Set table cell right border &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitablecell/setcellborderright") %>">ApiTableCell.SetCellBorderRight</a></li>
                       <li>Set table cell left border &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitablecell/setcellborderleft") %>">ApiTableCell.SetCellBorderLeft</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body33" class="tags_content">
                <h5>Learn how to <span class="tag_name">set the background to a single table cell</span></h5>
                <div>
                   <ul>
                       <li>Set table cell background &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitablecell/setshd") %>">ApiTableCell.SetShd</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body34" class="tags_content">
                <h5>Learn how to <span class="tag_name">set width to the table column</span></h5>
                <div>
                   <ul>
                       <li>Set table column width &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitablecell/setwidth") %>">ApiTableCell.SetWidth</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body35" class="tags_content">
                <h5>Learn how to <span class="tag_name">set the text direction in a table cell</span></h5>
                <div>
                   <ul>
                       <li>Set table cell text direction &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitablecell/settextdirection") %>">ApiTableCell.SetTextDirection</a></li>
                   </ul>
                </div>
            </div>
            <div id="body36" class="tags_content">
                <h5>Learn how to <span class="tag_name">add a bulleted list</span></h5>
                <div>
                   <ul>
                       <li>Create bulleted list (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apidocument/createnumbering") %>">ApiDocument.CreateNumbering</a></li>
                       <li>Create bulleted list (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apiparagraph/setbullet") %>">ApiParagraph.SetBullet</a></li>
                       <li>Create bulleted list (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apiparagraph/setbullet") %>">ApiParagraph.SetBullet</a></li>
                       <li>Set and edit list levels &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apinumbering") %>">ApiNumbering</a>/<a target="blank" href="<%= Url.Action("textdocumentapi/apinumberinglevel") %>">ApiNumberingLevel</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body37" class="tags_content">
                <h5>Learn how to <span class="tag_name">add a numbered list</span></h5>
                <div>
                   <ul>
                       <li>Create numbered list &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apidocument/createnumbering") %>">ApiDocument.CreateNumbering</a></li>
                       <li>Set and edit list levels &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apinumbering") %>">ApiNumbering</a>/<a target="blank" href="<%= Url.Action("textdocumentapi/apinumberinglevel") %>">ApiNumberingLevel</a></li>
                   </ul>
                </div>
            </div>
            <div id="body38" class="tags_content">
                <h5>Learn how to <span class="tag_name">add columns</span></h5>
                <div>
                   <ul>
                       <li>Create equal columns &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apisection/setequalcolumns") %>">ApiSection.SetEqualColumns</a></li>
                       <li>Create non-equal columns &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apisection/setnotequalcolumns") %>">ApiSection.SetNotEqualColumns</a></li>
                       <li>Set column break &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apiparagraph/addcolumnbreak") %>">ApiParagraph.AddColumnBreak</a></li>
                   </ul>
                </div>
            </div>
            <div id="body39" class="tags_content">
                <h5>Learn how to <span class="tag_name">add a page break</span></h5>
                <div>
                   <ul>
                       <li>Set page break &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apiparagraph/addpagebreak") %>">ApiParagraph.AddPageBreak</a></li>
                   </ul>
                </div>
            </div> 
            <div id="body40" class="tags_content">
                <h5>Learn how to <span class="tag_name">get and edit a page header</span></h5>
                <div>
                   <ul>
                       <li>Get page header &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apisection/getheader") %>">ApiSection.GetHeader</a></li>
                       <li>Remove page header &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apisection/removeheader") %>">ApiSection.RemoveHeader</a></li>
                       <li>Edit page header &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apisection/setheaderdistance") %>">ApiSection.SetHeaderDistance</a></li>
                   </ul>
                </div>
            </div>
            <div id="body41" class="tags_content">
                <h5>Learn how to <span class="tag_name">get and edit a page footer</span></h5>
                <div>
                   <ul>
                       <li>Get page footer &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apisection/getfooter") %>">ApiSection.GetFooter</a></li>
                       <li>Remove page footer &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apisection/removefooter") %>">ApiSection.RemoveFooter</a></li>
                       <li>Edit page footer &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apisection/setfooterdistance") %>">ApiSection.SetFooterDistance</a></li>
                   </ul>
                </div>
            </div>
            <div id="body42" class="tags_content">
                <h5>Learn how to <span class="tag_name">create a shape</span></h5>
                <div>
                   <ul>
                       <li>Create a shape (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/api/createshape") %>">Api.CreateShape</a></li>
                       <li>Create a shape (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apiworksheet/addshape") %>">ApiWorksheet.AddShape</a></li>
                       <li>Create a shape (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/api/createshape") %>">Api.CreateShape</a></li>
                   </ul>
                </div>
            </div>
            <div id="body43" class="tags_content">
                <h5>Learn how to <span class="tag_name">add text to the shape</span></h5>
                <div>
                   <ul>
                       <li>Get shape content to add text (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apishape/getdoccontent") %>">ApiShape.GetDocContent</a></li>
                       <li>Get shape content to add text (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apishape/getdoccontent") %>">ApiShape.GetDocContent</a></li>
                       <li>Get shape content to add text (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apishape/getdoccontent") %>">ApiShape.GetDocContent</a></li>
                       <li>Position text in shape vertically (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apishape/setverticaltextalign") %>">ApiShape.SetVerticalTextAlign</a></li>
                       <li>Position text in shape vertically (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apishape/setverticaltextalign") %>">ApiShape.SetVerticalTextAlign</a></li>
                       <li>Position text in shape vertically (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apishape/setverticaltextalign") %>">ApiShape.SetVerticalTextAlign</a></li>
                       <li>Set the text paddings to the shape (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apishape/setpaddings") %>">ApiShape.SetPaddings</a></li>
                       <li>Set the text paddings to the shape (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apishape/setpaddings") %>">ApiShape.SetPaddings</a></li>
                   </ul>
                </div>
            </div>
            <div id="body44" class="tags_content">
                <h5>Learn how to <span class="tag_name">create a chart</span></h5>
                <div>
                   <ul>
                       <li>Create chart (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/api/createchart") %>">Api.CreateChart</a></li>
                       <li>Create chart (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apiworksheet/addchart") %>">ApiWorksheet.AddChart</a></li>
                       <li>Create chart (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/api/createchart") %>">Api.CreateChart</a></li>
                       <li>Setup chart and set its parameters (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apichart") %>">ApiChart</a></li>
                       <li>Setup chart and set its parameters (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apichart") %>">ApiChart</a></li>
                       <li>Setup chart and set its parameters (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apichart") %>">ApiChart</a></li>
                   </ul>
                </div>
            </div>
            <div id="body45" class="tags_content">
                <h5>Learn how to <span class="tag_name">add an image to the document</span></h5>
                <div>
                   <ul>
                       <li>Create image (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/api/createimage") %>">Api.CreateImage</a></li>
                       <li>Create image (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apiworksheet/addimage") %>">ApiWorksheet.AddImage</a></li>
                       <li>Create image (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/api/createimage") %>">Api.CreateImage</a></li>
                   </ul>
                </div>
            </div>
            <div id="body46" class="tags_content">
                <h5>Learn how to <span class="tag_name">set the text language</span></h5>
                <div>
                   <ul>
                       <li>Set language for part of text or single word (text documents) &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apirun/setlanguage") %>">ApiRun.SetLanguage</a></li>
                       <li>Set language for part of text or single word (spreadsheets) &mdash; <a target="blank" href="<%= Url.Action("spreadsheetapi/apirun/setlanguage") %>">ApiRun.SetLanguage</a></li>
                       <li>Set language for part of text or single word (presentations) &mdash; <a target="blank" href="<%= Url.Action("presentationapi/apirun/setlanguage") %>">ApiRun.SetLanguage</a></li>
                       <li>Set language for whole text &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextpr/setlanguage") %>">ApiTextPr.SetLanguage</a></li>
                   </ul>
                </div>
            </div>
            <div id="body47" class="tags_content">
                <h5>Learn how to <span class="tag_name">set the page size</span></h5>
                <div>
                   <ul>
                       <li>Set page size &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apisection/setpagesize") %>">ApiSection.SetPageSize</a></li>
                   </ul>
                </div>
            </div>
            <div id="body48" class="tags_content">
                <h5>Learn how to <span class="tag_name">set the page margins</span></h5>
                <div>
                   <ul>
                       <li>Set page margins &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apisection/setpagemargins") %>">ApiSection.SetPageMargins</a></li>
                   </ul>
                </div>
            </div>
            <div id="body49" class="tags_content">
                <h5>Learn how to <span class="tag_name">create a form</span></h5>
                <div>
                   <ul>
                       <li>Create a text form &mdash; <a target="blank" href="<%= Url.Action("formapi/api/createtextform") %>">Api.CreateTextForm</a></li>
                       <li>Create a combo box form &mdash; <a target="blank" href="<%= Url.Action("formapi/api/createcomboboxform") %>">Api.CreateComboBoxForm</a></li>
                       <li>Create a checkbox form &mdash; <a target="blank" href="<%= Url.Action("formapi/api/createcheckboxform") %>">Api.CreateCheckBoxForm</a></li>
                       <li>Create a picture form &mdash; <a target="blank" href="<%= Url.Action("formapi/api/createpictureform") %>">Api.CreatePictureForm</a></li>
                   </ul>
                </div>
            </div>
            <div id="body50" class="tags_content">
                <h5>Learn how to <span class="tag_name">set the border color to the form</span></h5>
                <div>
                   <ul>
                       <li>Set the border color to the text form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextform/setbordercolor") %>">ApiTextForm.SetBorderColor</a></li>
                       <li>Set the border color to the combo box form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicomboboxform/setbordercolor") %>">ApiComboBoxForm.SetBorderColor</a></li>
                       <li>Set the border color to the checkbox form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicheckboxform/setbordercolor") %>">ApiCheckBoxForm.SetBorderColor</a></li>
                       <li>Set the border color to the picture form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apipictureform/setbordercolor") %>">ApiPictureForm.SetBorderColor</a></li>
                   </ul>
                </div>
            </div>
            <div id="body51" class="tags_content">
                <h5>Learn how to <span class="tag_name">set the placeholder text to the form</span></h5>
                <div>
                   <ul>
                       <li>Set the placeholder text to the text form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextform/setplaceholdertext") %>">ApiTextForm.SetPlaceholderText</a></li>
                       <li>Set the placeholder text to the combo box form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicomboboxform/setplaceholdertext") %>">ApiComboBoxForm.SetPlaceholderText</a></li>
                       <li>Set the placeholder text to the checkbox form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicheckboxform/setplaceholdertext") %>">ApiCheckBoxForm.SetPlaceholderText</a></li>
                       <li>Set the placeholder text to the picture form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apipictureform/setplaceholdertext") %>">ApiPictureForm.SetPlaceholderText</a></li>
                   </ul>
                </div>
            </div>
            <div id="body52" class="tags_content">
                <h5>Learn how to <span class="tag_name">set the text properties to the form</span></h5>
                <div>
                   <ul>
                       <li>Set the text properties to the text form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextform/settextpr") %>">ApiTextForm.SetTextPr</a></li>
                       <li>Set the text properties to the combo box form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicomboboxform/settextpr") %>">ApiComboBoxForm.SetTextPr</a></li>
                       <li>Set the text properties to the checkbox form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicheckboxform/settextpr") %>">ApiCheckBoxForm.SetTextPr</a></li>
                       <li>Set the text properties to the picture form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apipictureform/settextpr") %>">ApiPictureForm.SetTextPr</a></li>
                   </ul>
                </div>
            </div>
            <div id="body53" class="tags_content">
                <h5>Learn how to <span class="tag_name">clear the form</span></h5>
                <div>
                   <ul>
                       <li>Clear the text form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextform/clear") %>">ApiTextForm.Clear</a></li>
                       <li>Clear the combo box form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicomboboxform/clear") %>">ApiComboBoxForm.Clear</a></li>
                       <li>Clear the checkbox form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicheckboxform/clear") %>">ApiCheckBoxForm.Clear</a></li>
                       <li>Clear the picture form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apipictureform/clear") %>">ApiPictureForm.Clear</a></li>
                   </ul>
                </div>
            </div>
            <div id="body54" class="tags_content">
                <h5>Learn how to <span class="tag_name">get the tip text from the form</span></h5>
                <div>
                   <ul>
                       <li>Get the tip text from the text form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextform/gettiptext") %>">ApiTextForm.GetTipText</a></li>
                       <li>Get the tip text from the combo box form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicomboboxform/gettiptext") %>">ApiComboBoxForm.GetTipText</a></li>
                       <li>Get the tip text from the checkbox form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicheckboxform/gettiptext") %>">ApiCheckBoxForm.GetTipText</a></li>
                       <li>Get the tip text from the picture form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apipictureform/gettiptext") %>">ApiPictureForm.GetTipText</a></li>
                   </ul>
                </div>
            </div>
            <div id="body55" class="tags_content">
                <h5>Learn how to <span class="tag_name">get the text from the form</span></h5>
                <div>
                   <ul>
                       <li>Get the text from the text form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextform/gettext") %>">ApiTextForm.GetText</a></li>
                       <li>Get the text from the combo box form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicomboboxform/gettext") %>">ApiComboBoxForm.GetText</a></li>
                   </ul>
                </div>
            </div>
            <div id="body56" class="tags_content">
                <h5>Learn how to <span class="tag_name">make a form fixed size</span></h5>
                <div>
                   <ul>
                       <li>Make a text form fixed size &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apitextform/tofixed") %>">ApiTextForm.ToFixed</a></li>
                       <li>Make a combo box form fixed size &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicomboboxform/tofixed") %>">ApiComboBoxForm.ToFixed</a></li>
                       <li>Make a checkbox form fixed size &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicheckboxform/tofixed") %>">ApiCheckBoxForm.ToFixed</a></li>
                       <li>Make a picture form fixed size &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apipictureform/tofixed") %>">ApiPictureForm.ToFixed</a></li>
                   </ul>
                </div>
            </div>
            <div id="body57" class="tags_content">
                <h5>Learn how to <span class="tag_name">set the picture position inside the form</span></h5>
                <div>
                   <ul>
                       <li>Set the picture position inside the form &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apipictureform/setpictureposition") %>">ApiPictureForm.SetPicturePosition</a></li>
                   </ul>
                </div>
            </div>
            <div id="body58" class="tags_content">
                <h5>Learn how to <span class="tag_name">set the radio group key to the checkbox</span></h5>
                <div>
                   <ul>
                       <li>Set the radio group key to the checkbox &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicheckboxform/setradiogroup") %>">ApiCheckBoxForm.SetRadioGroup</a></li>
                   </ul>
                </div>
            </div>
            <div id="body59" class="tags_content">
                <h5>Learn how to <span class="tag_name">set the list values to the combo box</span></h5>
                <div>
                   <ul>
                       <li>Set the list values to the combo box &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicomboboxform/setlistvalues") %>">ApiComboBoxForm.SetListValues</a></li>
                   </ul>
                </div>
            </div>
            <div id="body60" class="tags_content">
                <h5>Learn how to <span class="tag_name">select the specified value from the combo box list values</span></h5>
                <div>
                   <ul>
                       <li>Select the specified value from the combo box list values &mdash; <a target="blank" href="<%= Url.Action("textdocumentapi/apicomboboxform/selectlistvalue") %>">ApiComboBoxForm.SelectListValue</a></li>
                   </ul>
                </div>
            </div>
            <a class="button-close button">Close</a>
        </div>
        <div class="button-close popap-close" title="Close">&times;</div>
    </div>
    
    
</asp:Content>
