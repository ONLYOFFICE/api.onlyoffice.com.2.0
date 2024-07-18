﻿<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    将表单嵌入网页
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">将表单嵌入网页</span>
    </h1>
    <p class="dscr">从 7.0 版开始，ONLYOFFICE Docs 提供了创建、编辑和协作在线表单、填写表单以及将表单保存为 PDF 的可能性。</p>
    <p>ONLYOFFICE 表单提供 PDF 格式，用于从空白或任何现有 DOCX
        文件创建表单模板并用于填写现成的表单。</p>
    <note>
        <p>请注意，从 8.0 版开始，OFORM 格式已弃用。要填写现成的表单，只能使用 PDF 格式。</p>
        <p>从 8.1 版开始，DOCXF 格式已弃用。要创建和编辑表单，只能使用 PDF 格式。</p>
    </note>
    <p>这些说明可帮助您将在线表单添加到您的网站，使其可保存为 PDF 并填写。</p>
    <note>请注意，这些说明仅在禁用 JWT 时才有效。从 7.2 版本开始，JWT 默认启用，因此您需要禁用它。
        有关 token 的更多信息，请参见<a href="<%= Url.Action("signature/") %>">此处</a>。</note>

    <div class="container">
        <ul class="browser">
            <li class="browser tab active copy-link" id="editing">编辑表单</li>
            <li class="browser tab copy-link" id="filling">填写表单</li>
        </ul>
        <div id="editing" class="content active">
            <h2 id="pdf-for-editing" class="copy-link">如何从网站打开 PDF 表单进行编辑</h2>
            <p>要在您的网站上打开DOCXF格式的在线表单进行编辑，请执行以下步骤：</p>
            <ol>
                <li>查找并打开ONLYOFFICE文档的 <em>index.html</em> 文件。</li>
                <li>
                    <p>通过指定API JavaScript文件的路径将其连接到Document Server API：</p>
                    <pre>
&lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;
</pre>
                </li>
                <li>
                    <p>添加<em>按钮</em>元素以打开 PDF 表单：</p>
                    <pre>
&lt;button onclick="open_form_template()"&gt;打开表单模板&lt;/button&gt;
</pre>
                </li>
                <li>
                    <p>在将打开编辑器的位置添加 <em>div</em> 元素：</p>
                    <pre>
&lt;div id="placeholder"&gt;&lt;/div&gt;
</pre>
                </li>
                <li>
                    <p>如果编辑器是打开的，添加脚本以关闭编辑器：</p>
                    <pre>
if (this.docEditor)
    { this.docEditor.destroyEditor()
}
</pre>
                </li>
                <li>
                    <p>创建您需要打开的 PDF 表单的完整 URL 地址：</p>
                    <pre>
const url = "https://example.com/url-to-example-form.pdf";
</pre>
                </li>
                <li>
                    <p>创建key以标识要共同编辑的文件：</p>
                    <pre>
const key = filename + ".pdf";
</pre>
                </li>
                <li>
                    <p>使用要打开的文档的配置，添加初始化文档编辑器的脚本，并在placeholder元素中打开编辑器：</p>
                    <pre>
this.docEditor = new DocsAPI.DocEditor("placeholder",
{
    "document": {
        "fileType": "pdf",
        "key": key,
        "permissions": {
            "edit": true
        },
        "title": "Form Template",
        "url": url
    },
    "documentType": "pdf"
});
</pre>
                </li>
            </ol>
            <p>完整的代码片段如下所示：</p>
            <pre>
&lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;
&lt;button onclick="open_form_template()"&gt;Open Form Template&lt;/button&gt;
&lt;div id="placeholder"&gt;&lt;/div&gt;
&lt;script&gt;
    function open_form_template() {
        if (this.docEditor) {
            this.docEditor.destroyEditor()
        }
        const url = "https://example.com/url-to-example-form.pdf";
        const key = filename + ".pdf";
        this.docEditor = new DocsAPI.DocEditor("placeholder",
        {
            "document": {
                "fileType": "pdf",
                "key": key,
                "permissions": {
                    "edit": true
                },
                "title": "Form Template",
                "url": url
            },
            "documentType": "pdf"
        });
    }
&lt;/script&gt;
</pre>
            <p>完成后，可以打开 PDF 表单进行编辑。编辑此文件后，您可以填写准备好的表格。为此，请单击<b>开始填写</b>按钮。</p>
            <img class="screenshot max-width-832" alt="嵌入 PDF 表单进行编辑" src="<%= Url.Content("~/content/img/editor/embed-pdf-for-editing.png") %>" />
        </div>
        <div id="filling" class="content">
            <h2 id="pdf" class="copy-link">如何从网站打开 PDF 表单进行填写</h2>
            <p>要使 PDF 格式的在线表单可供填写，请按照以下步骤操作：</p>
            <ol>
                <li>查找并打开ONLYOFFICE文档的 <em>index.html</em> 文件。</li>
                <li>
                    <p>通过指定API JavaScript文件的路径将其连接到Document Server API：</p>
                    <pre>
&lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;
</pre>
                </li>
                <li>
                    <p>添加<em>按钮</em>元素以打开 PDF 表单：</p>
                    <pre>
&lt;button onclick="open_form()"&gt;打开表单&lt;/button&gt;
</pre>
                </li>
                <li>
                    <p>在将打开编辑器的位置添加 <em>div</em> 元素：</p>
                    <pre>
&lt;div id="placeholder"&gt;&lt;/div&gt;
</pre>
                </li>
                <li>
                    <p>如果编辑器是打开的，添加脚本以关闭编辑器：</p>
                    <pre>
if (this.docEditor) {
    this.docEditor.destroyEditor()
}
</pre>
                </li>
                <li>
                    <p>创建您需要打开的 PDF 表单的完整 URL 地址：</p>
                    <pre>
const url = "https://example.com/url-to-example-form.pdf";
</pre>
                </li>
                <li>
                    <p>创建用于标识文件的key</p>
                    <pre>
const key = filename + ".pdf";
</pre>
                    <note>请注意，<em>key</em> 字段不会传递给编辑器的配置。此字段将自动生成为随机数。
                        这允许使打开表单的所有会话独立。这样，PDF 表单上的协作被禁用。
                        这就是为什么任何人都可以打开表单并填写而不会打扰其他人的原因。</note>
                </li>
                <li>
                    <p>使用要打开的文档的配置，添加初始化文档编辑器的脚本，并在placeholder元素中打开编辑器：</p>
                    <pre>
this.docEditor = new DocsAPI.DocEditor("placeholder",
{
    "document": {
        "fileType": "pdf",
        "permissions": {
            "edit": false,
            "fillForms": true
        },
        "title": "Form",
        "url": url
    },
    "documentType": "pdf"
});
</pre>
                </li>
            </ol>
            <p>完整的代码片段如下所示：</p>
            <pre>
&lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;
&lt;button onclick="open_form()"&gt;Open Form&lt;/button&gt;
&lt;div id="placeholder"&gt;&lt;/div&gt;
&lt;script&gt;
    function open_form() {
        if (this.docEditor) {
            this.docEditor.destroyEditor()
        }
        const url = "https://example.com/url-to-example-form.pdf";
        const key = filename + ".pdf";
        this.docEditor = new DocsAPI.DocEditor("placeholder",
        {
            "document": {
                "fileType": "pdf",
                "permissions": {
                    "edit": false,
                    "fillForms": true
                },
                "title": "Form",
                "url": url
            },
            "documentType": "pdf"
        });
    }
&lt;/script&gt;
</pre>
            <p>完成后，可以打开 PDF 表单进行填写。填写完所有必填字段后，您可以提交数据。
                为此，请单击<b>完成并提交</b>按钮。</p>
            <img class="screenshot max-width-832" alt="Embed pdf form" src="<%= Url.Content("~/content/img/editor/embed-pdf.png") %>" />
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
