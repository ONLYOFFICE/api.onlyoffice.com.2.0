<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Embedding forms into a web page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Embedding forms into a web page</span>
    </h1>
    <p class="dscr">Starting from version 7.0, ONLYOFFICE Docs offers the possibility to create, edit and collaborate on online forms, fill them out, and save forms as PDF.</p>
    <p>ONLYOFFICE forms are available in two main formats. DOCXF is intended for creating form templates from blank or any existing DOCX file.
        The OFORM format is used for filling out the ready forms.</p>
    <p>These instructions help you add an online form to your website, making it available for filling in and downloading as PDF.</p>
    <note>Please note that these instructions will only work when JWT is disabled. Starting from version 7.2, JWT is enabled by default, so you need to disable it.
        More information about token can be found <a href="<%= Url.Action("signature/") %>">here</a>.</note>

    <div class="container">
        <ul class="browser">
            <li class="browser tab active copy-link" id="editing">Editing forms</li>
            <li class="browser tab copy-link" id="filling">Filling forms</li>
        </ul>
        <div id="editing" class="content active">
            <h2 id="docxf" class="copy-link">How to open DOCXF for editing from website</h2>
            <p>To open an online form in the DOCXF format for editing from your website, follow the steps below:</p>
            <ol>
                <li>Find and open the <em>index.html</em> file of your ONLYOFFICE Docs.</li>
                <li>
                    <p>Connect it to the Document Server API by specifying the path to the API JavaScript file:</p>
                    <pre>
&lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;
</pre>
                </li>
                <li>
                    <p>Add the <em>button</em> element to open a form template:</p>
                    <pre>
&lt;button onclick="open_form_template()"&gt;Open Form Template&lt;/button&gt;
</pre>
                </li>
                <li>
                    <p>Add the <em>div</em> element where the editor will be opened:</p>
                    <pre>
&lt;div id="placeholder"&gt;&lt;/div&gt;
</pre>
                </li>
                <li>
                    <p>Add the script to close the editor in case it is open:</p>
                    <pre>
if (this.docEditor) {
    this.docEditor.destroyEditor()
}
</pre>
                </li>
                <li>
                    <p>Create the full URL address to the form template you need to open:</p>
                    <pre>
const url = "https://example.com/url-to-example-document.docxf";
</pre>
                </li>
                <li>
                    <p>Create the key to identify the file for co-editing:</p>
                    <pre>
const key = filename + ".docxf";
</pre>
                </li>
                <li>
                    <p>Add the script initializing the Document Editor with the configuration for the document you want to open and open the editor in the placeholder element:</p>
                    <pre>
this.docEditor = new DocsAPI.DocEditor("placeholder",
{
    "document": {
        "fileType": "docxf",
        "key": key,
        "title": "Form Template",
        "url": url
    },
    "documentType": "word"
});
</pre>
                </li>
            </ol>
            <p>The full code fragment looks like this:</p>
            <pre>
&lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;
&lt;button onclick="open_form_template()"&gt;Open Form Template&lt;/button&gt;
&lt;div id="placeholder"&gt;&lt;/div&gt;
&lt;script&gt;
    function open_form_template() {
        if (this.docEditor) {
            this.docEditor.destroyEditor()
        }
        const url = "https://example.com/url-to-example-document.docxf";
        const key = filename + ".docxf";
        this.docEditor = new DocsAPI.DocEditor("placeholder",
        {
            "document": {
                "fileType": "docxf",
                "key": key,
                "title": "Form Template",
                "url": url
            },
            "documentType": "word"
        });
    }
&lt;/script&gt;
</pre>
            <p>Once done, a form template can be opened for editing. After editing this file, you can get the form itself. To do so, click the <b>Save as oform</b> button.</p>
            <img class="screenshot max-width-832" alt="Embed docxf" src="<%= Url.Content("~/content/img/editor/embed-docxf.png") %>" />
        </div>
        <div id="filling" class="content">
            <h2 id="oform" class="copy-link">How to open OFORM for filling from website</h2>
            <p>To make an online form in the OFORM format available for filling in and downloading as PDF from your website, follow the steps below:</p>
            <ol>
                <li>Find and open the <em>index.html</em> file of your ONLYOFFICE Docs.</li>
                <li>
                    <p>Connect it to the Document Server API by specifying the path to the API JavaScript file:</p>
                    <pre>
&lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;
</pre>
                </li>
                <li>
                    <p>Add the <em>button</em> element to open the form:</p>
                    <pre>
&lt;button onclick="open_form()"&gt;Open Form&lt;/button&gt;
</pre>
                </li>
                <li>
                    <p>Add the <em>div</em> element where the editor will be opened:</p>
                    <pre>
&lt;div id="placeholder"&gt;&lt;/div&gt;
</pre>
                </li>
                <li>
                    <p>Add the script to close the editor in case it is open:</p>
                    <pre>
if (this.docEditor) {
    this.docEditor.destroyEditor()
}
</pre>
                </li>
                <li>
                    <p>Create the full URL address to the form template you need to open:</p>
                    <pre>
const url = "https://example.com/url-to-example-document.oform";
</pre>
                </li>
                <li>
                    <p>Create the key to identify the file</p>
                    <pre>
const key = filename + ".oform";
</pre>
                    <note>Please note that the <em>key</em> field is not passed to the configuration of the editors. This field will be automatically generated as a random number.
                        This allows making all sessions of opening the form independent. So, collaboration on the OFORM file is disabled.
                        That's why anyone can open the form and fill it out without disturbing others.</note>
                </li>
                <li>
                    <p>Add the script initializing the Document Editor with the configuration for the document you want to open and open the editor in the placeholder element:</p>
                    <pre>
this.docEditor = new DocsAPI.DocEditor("placeholder",
{
    "document": {
        "fileType": "oform",
        "title": "Form",
        "url": url
    },
    "documentType": "word"
});
</pre>
                </li>
            </ol>
            <p>The full code fragment looks like this:</p>
            <pre>
&lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;
&lt;button onclick="open_form()"&gt;Open Form&lt;/button&gt;
&lt;div id="placeholder"&gt;&lt;/div&gt;
&lt;script&gt;
    function open_form() {
        if (this.docEditor) {
            this.docEditor.destroyEditor()
        }
        const url = "https://example.com/url-to-example-document.oform";
        const key = filename + ".oform";
        this.docEditor = new DocsAPI.DocEditor("placeholder",
        {
            "document": {
                "fileType": "oform",
                "title": "Form",
                "url": url
            },
            "documentType": "word"
        });
    }
&lt;/script&gt;
</pre>
            <p>Once done, a form can be opened for filling. After filling in the fields (the required ones are highlighted with the red border), you can get a PDF file.
                To do so, click the <b>Save as ...</b> button.</p>
            <img class="screenshot max-width-832" alt="Embed oform" src="<%= Url.Content("~/content/img/editor/embed-oform.png") %>" />
        </div>
    </div>

    <script type="text/javascript">
        $('ul.browser').on('click', 'li:not(.browser tab active)', function() {
            $(this)
            .addClass('active').siblings().removeClass('active')
            .closest('div.container').find('div.content').removeClass('active').eq($(this).index()).addClass('active');
        });
        var loc = window.location.hash;
        if (loc != "") {
            var id = loc.substring(1);;
            $('.browser .tab').removeClass('active');
            $('.browser .tab[id="'+id  +'"]').addClass('active');
            $('.content').removeClass('active');
            $('.content[id="'+id  +'"]').addClass('active');
        }
    </script>

</asp:Content>
