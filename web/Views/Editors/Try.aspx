﻿<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Try now
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Try now</span>
    </h1>

    <p class="dscr">
        Click the buttons with the format names below to try the main functionality of ONLYOFFICE Docs.
        You can open various file types for editing, viewing, co-editing, review or see how the rebranding works.
        Use the <span class="try-icon-code"></span> buttons to view the corresponding example source code.
    </p>

    <table class="try-now-table">
        <thead>
            <tr>
                <th></th>
                <th>Documents</th>
                <th>Spreadsheets</th>
                <th>Presentations</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>Edit</th>
                <td>
                    <div><a title="Open DOCX file for editing" href="<%= Url.Action("editor") %>?method=docxEditor" class="button button-upper doc" target="blank">DOCX</a><a title="View source code" class="button-popap-try" data-code="docxEditorCode"></a></div>
                    <br />
                    <div><a title="Open DOCXF file for editing" href="<%= Url.Action("editor") %>?method=docxfEditor" class="button button-upper doc" target="blank">DOCXF</a><a title="View source code" class="button-popap-try" data-code="docxfEditorCode"></a></div>
                    <br />
                    <div><a title="Open DOC file for editing" href="<%= Url.Action("editor") %>?method=docEditor" class="button button-upper doc" target="blank">DOC</a><a title="View source code" class="button-popap-try" data-code="docEditorCode"></a></div>
                    <br />
                    <div><a title="Open ODT file for editing" href="<%= Url.Action("editor") %>?method=odtEditor" class="button button-upper doc" target="blank">ODT</a><a title="View source code" class="button-popap-try" data-code="odtEditorCode"></a></div>
                    <br />
                    <div><a title="Open TXT file for editing" href="<%= Url.Action("editor") %>?method=txtEditor" class="button button-upper doc" target="blank">TXT</a><a title="View source code" class="button-popap-try" data-code="txtEditorCode"></a></div>
                </td>
                <td>
                    <div><a title="Open XLSX file for editing" href="<%= Url.Action("editor") %>?method=xlsxEditor" class="button button-upper spread" target="blank">XLSX</a><a title="View source code" class="button-popap-try" data-code="xlsxEditorCode"></a></div>
                    <br />
                    <div><a title="Open XLS file for editing" href="<%= Url.Action("editor") %>?method=xlsEditor" class="button button-upper spread" target="blank">XLS</a><a title="View source code" class="button-popap-try" data-code="xlsEditorCode"></a></div>
                    <br />
                    <div><a title="Open ODS file for editing" href="<%= Url.Action("editor") %>?method=odsEditor" class="button button-upper spread" target="blank">ODS</a><a title="View source code" class="button-popap-try" data-code="odsEditorCode"></a></div>
                    <br />
                    <div><a title="Open CSV file for editing" href="<%= Url.Action("editor") %>?method=csvEditor" class="button button-upper spread" target="blank">CSV</a><a title="View source code" class="button-popap-try" data-code="csvEditorCode"></a></div>
                </td>
                <td>
                    <div><a title="Open PPTX file for editing" href="<%= Url.Action("editor") %>?method=pptxEditor" class="button button-upper present" target="blank">PPTX</a><a title="View source code" class="button-popap-try" data-code="pptxEditorCode"></a></div>
                    <br />
                    <div><a title="Open PPSX file for editing" href="<%= Url.Action("editor") %>?method=ppsxEditor" class="button button-upper present" target="blank">PPSX</a><a title="View source code" class="button-popap-try" data-code="ppsxEditorCode"></a></div>
                    <br />
                    <div><a title="Open PPT file for editing" href="<%= Url.Action("editor") %>?method=pptEditor" class="button button-upper present" target="blank">PPT</a><a title="View source code" class="button-popap-try" data-code="pptEditorCode"></a></div>
                    <br />
                    <div><a title="Open ODP file for editing" href="<%= Url.Action("editor") %>?method=odpEditor" class="button button-upper present" target="blank">ODP</a><a title="View source code" class="button-popap-try" data-code="odpEditorCode"></a></div>
                </td>
            </tr>
            <tr>
                <th>Co-Edit</th>
                <td>
                    <div><a title="Open DOCX file for co-editing" class="button button-upper button-coediting doc" data-type="docxCoediting">DOCX</a><a title="View source code" class="button-popap-try" data-code="docxCoeditorCode"></a></div>
                </td>
                <td>
                    <div><a title="Open XLSX file for co-editing" class="button button-upper button-coediting spread" data-type="xlsxCoediting">XLSX</a><a title="View source code" class="button-popap-try" data-code="xlsxCoeditorCode"></a></div>
                </td>
                <td>
                    <div><a title="Open PPTX file for co-editing" class="button button-upper button-coediting present" data-type="pptxCoediting">PPTX</a><a title="View source code" class="button-popap-try" data-code="pptxCoeditorCode"></a></div>
                </td>
            </tr>
            <tr>
                <th>Strict Co-Edit</th>
                <td>
                    <div><a title="Open DOCX file for co-editing" class="button button-upper button-coediting doc" data-type="docxStrictCoediting">DOCX</a><a title="View source code" class="button-popap-try" data-code="docxStrictCoeditorCode"></a></div>
                </td>
                <td>
                    <div><a title="Open XLSX file for co-editing" class="button button-upper button-coediting spread" data-type="xlsxStrictCoediting">XLSX</a><a title="View source code" class="button-popap-try" data-code="xlsxStrictCoeditorCode"></a></div>
                </td>
                <td>
                    <div><a title="Open PPTX file for co-editing" class="button button-upper button-coediting present" data-type="pptxStrictCoediting">PPTX</a><a title="View source code" class="button-popap-try" data-code="pptxStrictCoeditorCode"></a></div>
                </td>
            </tr>
            <tr>
                <th>Local filter</th>
                <td></td>
                <td>
                    <div><a title="Open XLSX file without access to change the filter" class="button button-upper button-coediting spread" data-type="modifyFilter">XLSX</a><a title="View source code" class="button-popap-try" data-code="modifyFilterCode"></a></div>
                </td>
                <td></td>
            </tr>
            <tr>
                <th>Review</th>
                <td>
                    <div><a title="Open DOCX file for review" href="<%= Url.Action("editor") %>?method=docxReview" class="button button-upper doc" target="blank">DOCX</a><a title="View source code" class="button-popap-try" data-code="docxReviewCode"></a></div>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>Restricted review</th>
                <td>
                    <div><a title="Open DOCX file for restricted review" href="<%= Url.Action("editor") %>?method=docxReviewGroups" class="button button-upper doc" target="blank">DOCX</a><a title="View source code" class="button-popap-try" data-code="docxReviewGroupsCode"></a></div>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>Filling in forms</th>
                <td>
                    <div><a title="Open PDF file for filling in forms" href="<%= Url.Action("editor") %>?method=fillForms" class="button button-upper doc" target="blank">PDF</a><a title="View source code" class="button-popap-try" data-code="fillFormsCode"></a></div>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>Content control<br /> settings restricted</th>
                <td>
                    <div><a title="Open DOCX file without access to the settings of the content control" href="<%= Url.Action("editor") %>?method=modifyContentControl" class="button button-upper doc" target="blank">DOCX</a><a title="View source code" class="button-popap-try" data-code="modifyContentControl"></a></div>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>Comment</th>
                <td>
                    <div><a title="Open DOCX file for commenting" href="<%= Url.Action("editor") %>?method=docxComment" class="button button-upper doc" target="blank">DOCX</a><a title="View source code" class="button-popap-try" data-code="docxCommentCode"></a></div>
                </td>
                <td>
                    <div><a title="Open XLSX file for commenting" href="<%= Url.Action("editor") %>?method=xlsxComment" class="button button-upper spread" target="blank">XLSX</a><a title="View source code" class="button-popap-try" data-code="xlsxCommentCode"></a></div>
                </td>
                <td>
                    <div><a title="Open PPTX file for commenting" href="<%= Url.Action("editor") %>?method=pptxComment" class="button button-upper present" target="blank">PPTX</a><a title="View source code" class="button-popap-try" data-code="pptxCommentCode"></a></div>
                </td>
            </tr>
            <tr>
                <th>Restricted comment</th>
                <td>
                    <div><a title="Open DOCX file for restricted commenting" href="<%= Url.Action("editor") %>?method=docxCommentGroups" class="button button-upper doc" target="blank">DOCX</a><a title="View source code" class="button-popap-try" data-code="docxCommentGroupsCode"></a></div>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>View</th>
                <td>
                    <div><a title="Open DOCX file for viewing" href="<%= Url.Action("editor") %>?method=docxViewer" class="button button-upper doc" target="blank">DOCX</a><a title="View source code" class="button-popap-try" data-code="docxViewerCode"></a></div>
                    <br />
                    <div><a title="Open PDF file for viewing" href="<%= Url.Action("editor") %>?method=pdfViewer" class="button button-upper doc" target="blank">PDF</a><a title="View source code" class="button-popap-try" data-code="pdfViewerCode"></a></div>
                </td>
                <td>
                    <div><a title="Open XLSX file for viewing" href="<%= Url.Action("editor") %>?method=xlsxViewer" class="button button-upper spread" target="blank">XLSX</a><a title="View source code" class="button-popap-try" data-code="xlsxViewerCode"></a></div>
                </td>
                <td>
                    <div><a title="Open PPTX file for viewing" href="<%= Url.Action("editor") %>?method=pptxViewer" class="button button-upper present" target="blank">PPTX</a><a title="View source code" class="button-popap-try" data-code="pptxViewerCode"></a></div>
                </td>
            </tr>
            <tr>
                <th>Rebranding</th>
                <td>
                    <div><a title="Open DOCX file with rebranding" href="<%= Url.Action("editor") %>?method=rebrandingDocxEditor" class="button button-upper doc" target="blank">DOCX</a><a title="View source code" class="button-popap-try" data-code="rebrandingDocxEditorCode"></a></div>
                </td>
                <td>
                    <div><a title="Open XLSX file with rebranding" href="<%= Url.Action("editor") %>?method=rebrandingXlsxEditor" class="button button-upper spread" target="blank">XLSX</a><a title="View source code" class="button-popap-try" data-code="rebrandingXlsxEditorCode"></a></div>
                </td>
                <td>
                    <div><a title="Open PPTX file with rebranding" href="<%= Url.Action("editor") %>?method=rebrandingPptxEditor" class="button button-upper present" target="blank">PPTX</a><a title="View source code" class="button-popap-try" data-code="rebrandingPptxEditorCode"></a></div>
                </td>
            </tr>
<%--            <tr>
                <th>Edit on mobile</th>
                <td>
                    <div><a title="Open DOCX file for editing on mobile" href="<%= Url.Action("editor") %>?method=docxEditorMobile" class="button button-upper doc" target="blank">DOCX</a><a title="View source code" class="button-popap-try" data-code="docxEditorMobileCode"></a></div>
                </td>
                <td>
                    <div><a title="Open XLSX file for editing on mobile" href="<%= Url.Action("editor") %>?method=xlsxEditorMobile" class="button button-upper spread" target="blank">XLSX</a><a title="View source code" class="button-popap-try" data-code="xlsxEditorMobileCode"></a></div>
                </td>
                <td>
                    <div><a title="Open PPTX file for editing on mobile" href="<%= Url.Action("editor") %>?method=pptxEditorMobile" class="button button-upper present" target="blank">PPTX</a><a title="View source code" class="button-popap-try" data-code="pptxEditorMobileCode"></a></div>
                </td>
            </tr>
            <tr>
                <th>View on mobile</th>
                <td>
                    <div><a title="Open DOCX file for viewing on mobile" href="<%= Url.Action("editor") %>?method=docxViewerMobile" class="button button-upper doc" target="blank">DOCX</a><a title="View source code" class="button-popap-try" data-code="docxViewerMobileCode"></a></div>
                </td>
                <td>
                    <div><a title="Open XLSX file for viewing on mobile" href="<%= Url.Action("editor") %>?method=xlsxViewerMobile" class="button button-upper spread" target="blank">XLSX</a><a title="View source code" class="button-popap-try" data-code="xlsxViewerMobileCode"></a></div>
                </td>
                <td>
                    <div><a title="Open PPTX file for viewing on mobile" href="<%= Url.Action("editor") %>?method=pptxViewerMobile" class="button button-upper present" target="blank">PPTX</a><a title="View source code" class="button-popap-try" data-code="pptxViewerMobileCode"></a></div>
                </td>
            </tr>--%>
            <tr>
                <th>Embedded view</th>
                <td>
                    <div><a title="Open DOCX file for embedded viewing" href="<%= Url.Action("editor") %>?method=docxEmbed" class="button button-upper doc" target="blank">DOCX</a><a title="View source code" class="button-popap-try" data-code="docxEmbedCode"></a></div>
                </td>
                <td>
                    <div><a title="Open XLSX file for embedded viewing" href="<%= Url.Action("editor") %>?method=xlsxEmbed" class="button button-upper spread" target="blank">XLSX</a><a title="View source code" class="button-popap-try" data-code="xlsxEmbedCode"></a></div>
                </td>
                <td>
                    <div><a title="Open PPTX file for embedded viewing" href="<%= Url.Action("editor") %>?method=pptxEmbed" class="button button-upper present" target="blank">PPTX</a><a title="View source code" class="button-popap-try" data-code="pptxEmbedCode"></a></div>
                </td>
            </tr>
        </tbody>
    </table>


    <div id="trySourceCodeDialog" class="popap-dialog">
        <div class="popap-container">
            <div id="docxEditorCode">
                <div class="popap-header">Open docx for editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "E7FAFC9C22A8",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxfEditorCode">
                <div class="popap-header">Open docxf for editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docxf",
                    "key": "D05D6A33",
                    "title": "Example Form Template Title.docxf",
                    "url": "https://example.com/url-to-example-document.docxf"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="xlsxEditorCode">
                <div class="popap-header">Open xlsx for editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "53500B46FCA9",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pptxEditorCode">
                <div class="popap-header">Open pptx for editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "9E2BDFCD1D75",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="ppsxEditorCode">
                <div class="popap-header">Open ppsx for editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "ppsx",
                    "key": "3DAB8BAA68E4",
                    "title": "Example Presentation Title.ppsx",
                    "url": "https://example.com/url-to-example-presentation.ppsx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docEditorCode">
                <div class="popap-header">Open doc for editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "doc",
                    "key": "D21889C484E9",
                    "title": "Example Document Title.doc",
                    "url": "https://example.com/url-to-example-document.doc"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="xlsEditorCode">
                <div class="popap-header">Open xls for editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xls",
                    "key": "D01A6B57CD96",
                    "title": "Example Spreadsheet Title.xls",
                    "url": "https://example.com/url-to-example-spreadsheet.xls"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pptEditorCode">
                <div class="popap-header">Open ppt for editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "ppt",
                    "key": "EEE93333E5F3",
                    "title": "Example Presentation Title.ppt",
                    "url": "https://example.com/url-to-example-presentation.ppt"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="odtEditorCode">
                <div class="popap-header">Open odt for editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "odt",
                    "key": "B95B853D3B1E",
                    "title": "Example Document Title.odt",
                    "url": "https://example.com/url-to-example-document.odt"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="odsEditorCode">
                <div class="popap-header">Open ods for editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "ods",
                    "key": "000C2F39D5A4",
                    "title": "Example Spreadsheet Title.ods",
                    "url": "https://example.com/url-to-example-spreadsheet.ods"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="odpEditorCode">
                <div class="popap-header">Open odp for editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "odp",
                    "key": "47BAE2E8A54F",
                    "title": "Example Presentation Title.odp",
                    "url": "https://example.com/url-to-example-presentation.odp"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="txtEditorCode">
                <div class="popap-header">Open txt for editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "txt",
                    "key": "B2D7ACF65806",
                    "title": "Example Document Title.txt",
                    "url": "https://example.com/url-to-example-document.txt"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="csvEditorCode">
                <div class="popap-header">Open csv for editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "csv",
                    "key": "B04E56B18519",
                    "title": "Example Spreadsheet Title.csv",
                    "url": "https://example.com/url-to-example-spreadsheet.csv"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pdfViewerCode">
                <div class="popap-header">Open pdf for viewing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pdf",
                    "key": "9B9F6EFE8937",
                    "title": "Example Document Title.pdf",
                    "url": "https://example.com/url-to-example-document.pdf"
                },
                "documentType": "pdf",
                "editorConfig": {
                    "mode": "view"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxViewerCode">
                <div class="popap-header">Open docx for viewing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "D24A86BDE9A2",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "mode": "view"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="xlsxViewerCode">
                <div class="popap-header">Open xlsx for viewing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "138E9734B413",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "mode": "view"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pptxViewerCode">
                <div class="popap-header">Open pptx for viewing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "37195B2B9BF4",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "mode": "view"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxCoeditorCode">
                <div class="popap-header">Open docx for co-editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "B143195F47A0",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "78e1e841",
                        "name": "John Smith"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "B143195F47A0",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "F89d8069ba2b",
                        "name": "Kate Cage"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="xlsxCoeditorCode">
                <div class="popap-header">Open xlsx for co-editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "6FB60FE9E548",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "78e1e841",
                        "name": "John Smith"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "6FB60FE9E548",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "F89d8069ba2b",
                        "name": "Kate Cage"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pptxCoeditorCode">
                <div class="popap-header">Open pptx for co-editing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "B6C57F1FC447",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "78e1e841",
                        "name": "John Smith"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "B6C57F1FC447",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "F89d8069ba2b",
                        "name": "Kate Cage"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxStrictCoeditorCode">
                <div class="popap-header">Open docx for co-editing in strict mode</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "491BD667CABA",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "autosave": false
                    },
                    "user": {
                        "id": "78e1e841",
                        "name": "John Smith"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "491BD667CABA",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "autosave": false
                    },
                    "user": {
                        "id": "F89d8069ba2b",
                        "name": "Kate Cage"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="xlsxStrictCoeditorCode">
                <div class="popap-header">Open xlsx for co-editing in strict mode</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "DB1788E4AF4A",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "autosave": false
                    },
                    "user": {
                        "id": "78e1e841",
                        "name": "John Smith"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "DB1788E4AF4A",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "autosave": false
                    },
                    "user": {
                        "id": "F89d8069ba2b",
                        "name": "Kate Cage"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pptxStrictCoeditorCode">
                <div class="popap-header">Open pptx for co-editing in strict mode</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "5664FFF42E4E",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "autosave": false
                    },
                    "user": {
                        "id": "78e1e841",
                        "name": "John Smith"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "5664FFF42E4E",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "autosave": false
                    },
                    "user": {
                        "id": "F89d8069ba2b",
                        "name": "Kate Cage"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="rebrandingDocxEditorCode">
                <div class="popap-header">Open docx with rebranding</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "D97815D69205",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "customer": {
                            "address": "My City, 123a-45",
                            "info": "Some additional information",
                            "logo": "https://example.com/logo-big.png",
                            "mail": "john@example.com",
                            "name": "John Smith and Co.",
                            "www": "example.com"
                        },
                        "logo": {
                            "image": "https://example.com/logo.png",
                            "url": "https://example.com"
                        }
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="rebrandingXlsxEditorCode">
                <div class="popap-header">Open xlsx with rebranding</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "6CDE57CAF31F",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "customer": {
                            "address": "My City, 123a-45",
                            "info": "Some additional information",
                            "logo": "https://example.com/logo-big.png",
                            "mail": "john@example.com",
                            "name": "John Smith and Co.",
                            "www": "example.com"
                        },
                        "logo": {
                            "image": "https://example.com/logo.png",
                            "url": "https://example.com"
                        }
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="rebrandingPptxEditorCode">
                <div class="popap-header">Open pptx with rebranding</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "E9B24523F469",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "customer": {
                            "address": "My City, 123a-45",
                            "info": "Some additional information",
                            "logo": "https://example.com/logo-big.png",
                            "mail": "john@example.com",
                            "name": "John Smith and Co.",
                            "www": "example.com"
                        },
                        "logo": {
                            "image": "https://example.com/logo.png",
                            "url": "https://example.com"
                        }
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxReviewCode">
                <div class="popap-header">Open docx for review</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "9B5D4A67A9A9",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx",
                    "permissions": {
                        "edit": false,
                        "review": true
                    }
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxReviewGroupsCode">
                <div class="popap-header">Open docx for restricted review</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "CE661B77",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx",
                    "permissions": {
                        "edit": true,
                        "review": true,
                        "reviewGroups": [ "Group2", "" ]
                    }
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="fillFormsCode">
                <div class="popap-header">Open pdf for filling in forms</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pdf",
                    "key": "DEEC57D9",
                    "title": "Example Form Title.pdf",
                    "url": "https://example.com/url-to-example-document.pdf",
                    "permissions": {
                        "edit": false,
                        "fillForms": true
                    }
                },
                "documentType": "pdf",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxCommentCode">
                <div class="popap-header">Open docx for commenting</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "5C5D4CCA7674",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx",
                    "permissions": {
                        "comment": true,
                        "edit": false
                    }
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="xlsxCommentCode">
                <div class="popap-header">Open xlsx for commenting</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "B62D0C4B9C09",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx",
                    "permissions": {
                        "comment": true,
                        "edit": false
                    }
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pptxCommentCode">
                <div class="popap-header">Open pptx for commenting</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "DA7CC0B9",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx",
                    "permissions": {
                        "comment": true,
                        "edit": false
                    }
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxCommentGroupsCode">
                <div class="popap-header">Open docx for restricted commenting</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "CEEC2F6D",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx",
                    "permissions": {
                        "comment": true,
                        "commentGroups": [
                            "edit": ["Group2", ""],
                            "remove": ["Group2"],
                            "view": ""
                        ],
                        "edit": false
                    }
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="modifyFilterCode">
                <div class="popap-header">Open xlsx without access to change the filter</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "B0823482653D",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx",
                    "permissions": {
                        "edit": true,
                        "modifyFilter": false
                    }
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "78e1e841",
                        "name": "John Smith"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "B0823482653D",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx",
                    "permissions": {
                        "edit": true,
                        "modifyFilter": false
                    }
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "F89d8069ba2b",
                        "name": "Kate Cage"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="modifyContentControl">
                <div class="popap-header">Open docx without access to the content control settings</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "779591724609",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx",
                    "permissions": {
                        "edit": true,
                        "modifyContentControl": false
                    }
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxEditorMobileCode">
                <div class="popap-header">Open DOCX file for editing on mobile</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "16CD6FB5",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                },
                "height": "100%",
                "type": "mobile",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="xlsxEditorMobileCode">
                <div class="popap-header">Open XLSX file for editing on mobile</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "1259E255",
                    "title": "Example Spreadsheet Title.docx",
                    "url": "https://example.com/url-to-example-document.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                },
                "height": "100%",
                "type": "mobile",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pptxEditorMobileCode">
                <div class="popap-header">Open PPTX file for editing on mobile</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "0CA91EC8",
                    "title": "Example Presentation Title.docx",
                    "url": "https://example.com/url-to-example-document.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                },
                "height": "100%",
                "type": "mobile",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxViewerMobileCode">
                <div class="popap-header">Open DOCX file for viewing on mobile</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "EFF21C3C",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "view"
                },
                "height": "100%",
                "type": "mobile",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="xlsxViewerMobileCode">
                <div class="popap-header">Open XLSX file for viewing on mobile</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "ECDAF251",
                    "title": "Example Spreadsheet Title.docx",
                    "url": "https://example.com/url-to-example-document.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "view"
                },
                "height": "100%",
                "type": "mobile",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pptxViewerMobileCode">
                <div class="popap-header">Open PPTX file for viewing on mobile</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "7F789833",
                    "title": "Example Presentation Title.docx",
                    "url": "https://example.com/url-to-example-document.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "view"
                },
                "height": "100%",
                "type": "mobile",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxEmbedCode">
                <div class="popap-header">Open DOCX file for embedded viewing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "B949CB79",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "height": "100%",
                "type": "embedded",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="xlsxEmbedCode">
                <div class="popap-header">Open XLSX file for embedded viewing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "9CB47328",
                    "title": "Example Spreadsheet Title.docx",
                    "url": "https://example.com/url-to-example-document.xlsx"
                },
                "documentType": "cell",
                "height": "100%",
                "type": "embedded",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pptxEmbedCode">
                <div class="popap-header">Open PPTX file for embedded viewing</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "1CA69995",
                    "title": "Example Presentation Title.docx",
                    "url": "https://example.com/url-to-example-document.pptx"
                },
                "documentType": "slide",
                "height": "100%",
                "type": "embedded",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <a class="button copy-code">Copy code</a>
            <a class="button-close button">Close</a>
        </div>
        <div class="button-close popap-close" title="Close">&times;</div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceholder" runat="server">
    <script type="text/javascript">
        $(".button-coediting").click(function () {
            var documentType = $(this).attr("data-type");
            <% var key = Guid.NewGuid().ToString(); %>
            var addr1 = "<%= Url.Action("editor") %>?method=" + documentType + "&key=" + documentType + "<%= key %>&name=John%20Smith";
            var documentCoediting1 = window.open(addr1, "_blank");
            var addr2 = "<%= Url.Action("editor") %>?method=" + documentType + "&key=" + documentType + "<%= key %>&name=Kate%20Cage";
            var documentCoediting2 = window.open(addr2, "_blank");
            if (!documentCoediting2) {
                location.href = addr2;
            }
        });
    </script>
</asp:Content>
