﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("signature/") %>"></a>
    <span class="hdr">浏览器</span>
</h1>
<p class="dscr">在向 ONLYOFFICE 文档服务器执行客户端浏览器请求时，必须将 <em>令牌</em> 添加到参数中以验证数据。</p>

<h2 id="open" class="copy-link">打开文件</h2>

<p id="config" class="copy-link">在 ONLYOFFICE 文档服务器中 <a href="<%= Url.Action("open") %>">打开</a> 文件进行编辑时，必须将 <a href="<%= Url.Action("config/") %>#token">令牌</a> 添加到配置中以验证参数。</p>

<p>
    JSON 格式的 JWT 令牌的 <em>有效负载</em> 必须与 <a href="<%= Url.Action("advanced") %>">config</a>具有相同的结构。
</p>
<note>请注意，从 7.1 版本开始，将严格规范要签名的参数列表。不要忘记将下面列出的所有参数添加到您的签名中。</note>

<pre>
{
    "document": {
        "key": "Khirz6zTPdfd7",
        "permissions": {
            "comment": true,
            "commentGroups": {
                "edit": ["Group2", ""],
                "remove": [""],
                "view": ""
            },
            "copy": true,
            "deleteCommentAuthorOnly": false,
            "download": true,
            "edit": true,
            "editCommentAuthorOnly": false,
            "fillForms": true,
            "modifyContentControl": true,
            "modifyFilter": true,
            "print": true,
            "review": true,
            "reviewGroups": ["Group1", "Group2", ""]
        },
        "url": "https://example.com/url-to-example-document.docx"
    },
    "editorConfig": {
        "callbackUrl": "https://example.com/url-to-callback.ashx",
        "mode": "edit",
        "user": {
            "group": "Group1",
            "id": "78e1e841",
            "name": "Smith"
        }
    }
}
</pre>
<p>
    其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
    有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
</p>

<div class="header-gray">示例令牌</div>
<pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicGVybWlzc2lvbnMiOnsiY29tbWVudCI6dHJ1ZSwiY29tbWVudEdyb3VwcyI6eyJlZGl0IjpbIkdyb3VwMiIsIiJdLCJyZW1vdmUiOlsiIl0sInZpZXciOiIifSwiY29weSI6dHJ1ZSwiZGVsZXRlQ29tbWVudEF1dGhvck9ubHkiOmZhbHNlLCJkb3dubG9hZCI6dHJ1ZSwiZWRpdCI6dHJ1ZSwiZWRpdENvbW1lbnRBdXRob3JPbmx5IjpmYWxzZSwiZmlsbEZvcm1zIjp0cnVlLCJtb2RpZnlDb250ZW50Q29udHJvbCI6dHJ1ZSwibW9kaWZ5RmlsdGVyIjp0cnVlLCJwcmludCI6dHJ1ZSwicmV2aWV3Ijp0cnVlLCJyZXZpZXdHcm91cHMiOlsiR3JvdXAxIiwiR3JvdXAyIiwiIl19LCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZWRpdG9yQ29uZmlnIjp7ImNhbGxiYWNrVXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tY2FsbGJhY2suYXNoeCIsIm1vZGUiOiJlZGl0IiwidXNlciI6eyJncm91cCI6Ikdyb3VwMSIsImlkIjoiNzhlMWU4NDEiLCJuYW1lIjoiU21pdGgifX19.irYst9vmsLoQtC-95A-6W8DnbqGXCbmcxJajfbPh6tQ</pre>


<h2 id="methods" class="copy-link">方法</h2>

<ul>
    <li>
        <p><b id="insertImage" class="copy-link">insertImage</b> - 调用 <a href="<%= Url.Action("methods") %>#insertImage">insertImage</a> 方法将图像插入文件时，必须添加 <a href="<%= Url.Action("methods") %>#insertImage-token">令牌</a> 以验证参数。</p>

        <p>
            JSON 格式的 JWT 令牌的 <em>有效负载</em> 必须与方法参数具有相同的结构。
            要签名的参数列表没有严格规定，但我们建议您指定所有发送的参数：
        </p>

        <pre>
{
    "c": "add",
    "images": [
        {
            "fileType": "png",
            "url": "https://example.com/url-to-example-image.png"
        }
    ]
}
</pre>
        <p>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
        </p>

        <div class="header-gray">示例令牌</div>
        <pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjIjoiYWRkIiwiaW1hZ2VzIjpbeyJmaWxlVHlwZSI6InBuZyIsInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtaW1hZ2UucG5nIn1dfQ._tPxpJrPbom_f83qgX4_AB9v1cfK2LSQsfomfl7zJ58</pre>
    </li>
    <li>
        <p><b id="setHistoryData" class="copy-link">setHistoryData</b> - 在 ONLYOFFICE 文档服务器中调用 <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> 方法查看文档 <a href="<%= Url.Action("history") %>">历史</a> 版本时，必须添加 <a href="<%= Url.Action("methods") %>#setHistoryData-token">令牌</a> 以验证参数。</p>

        <p>
            JSON 格式的 JWT 令牌的 <em>有效负载</em> 必须与方法参数具有相同的结构。
            要签名的参数列表没有严格规定，但我们建议您指定所有发送的参数：
        </p>

        <pre>
{
    "changesUrl": "https://example.com/url-to-changes.zip",
    "key": "Khirz6zTPdfd7",
    "previous": {
        "key": "af86C7e71Ca8",
        "url": "https://example.com/url-to-the-previous-version-of-the-document.docx"
    },
    "url": "https://example.com/url-to-example-document.docx",
    "version": 2
}
</pre>
        <p>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
        </p>

        <div class="header-gray">示例令牌</div>
        <pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGFuZ2VzVXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tY2hhbmdlcy56aXAiLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicHJldmlvdXMiOnsia2V5IjoiYWY4NkM3ZTcxQ2E4IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tdGhlLXByZXZpb3VzLXZlcnNpb24tb2YtdGhlLWRvY3VtZW50LmRvY3gifSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.7gaOe1_4OvgRLYD0oGk_bMrVdPaLmgZVNIgQCUQdgoE</pre>
    </li>
    <li>
        <p><b id="setMailMergeRecipients" class="copy-link">setMailMergeRecipients</b> - 当调用 <a href="<%= Url.Action("methods") %>#setMailMergeRecipients">setMailMergeRecipients</a> 方法将邮件合并的收件人数据插入文件时，必须添加 <a href="<%= Url.Action("methods") %>#setMailMergeRecipients-token">令牌</a> 以验证参数。</p>

        <p>
            JSON 格式的 JWT 令牌的 <em>有效负载</em> 必须与方法参数具有相同的结构。
            要签名的参数列表没有严格规定，但我们建议您指定所有发送的参数：
        </p>

        <pre>
{
    "fileType": "xlsx",
    "url": "https://example.com/url-to-example-recipients.xlsx"
}
</pre>
        <p>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
        </p>

        <div class="header-gray">示例令牌</div>
        <pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXJlY2lwaWVudHMueGxzeCJ9.P3TjOyX1Tv3xAVRAc8qtNb-uFLD6FH_WErag_rbI6nQ</pre>
    </li>
    <li>
        <p><b id="setReferenceData" class="copy-link">setReferenceData</b> - 当调用 <a href="<%= Url.Action("methods") %>#setReferenceData">setReferenceData</a> 方法通过外部链接将数据插入电子表格时，必须添加<a href="<% = Url.Action("methods") %>#setReferenceData-token">令牌</a> 以验证参数。</p>

        <p>
            JSON 格式的 JWT 令牌的<em>有效负载</em>必须与方法参数具有相同的结构。
             待签名的参数列表没有严格规定，但我们建议您指定所有发送的参数：
        </p>

        <pre>
{
    "fileType": "xlsx",
    "path": "sample.xlsx",
    "referenceData": {
        "fileKey": "BCFA2CED",
        "instanceId": "https://example.com"
    },
    "url": "https://example.com/url-to-example-document.xlsx"
}
</pre>
        <p>
           其中，<b>example.com</b> 是安装了<b>文档管理器</b> 和<b>文档存储服务</b> 的服务器的名称。
             请参阅<a href="<%= Url.Action("howitworks") %>">它是如何工作的</a>部分以了解有关文档服务器服务客户端-服务器交互的更多信息。
        </p>

        <div class="header-gray">示例令牌</div>
        <pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w</pre>
    </li>
    <li>
        <p><b id="setRevisedFile" class="copy-link">setRevisedFile</b> - 当调用 <a href="<%= Url.Action("methods") %>#setRevisedFile">setRevisedFile</a> 方法来选择一个文档进行比较时，必须添加 <a href="<%= Url.Action("methods") %>#setReferenceData-token">令牌</a> 来验证参数。</p>

        <p>
            JSON 格式的 JWT 令牌的 <em>有效负载</em> 必须与方法参数具有相同的结构。
            要签名的参数列表没有严格规定，但我们建议您指定所有发送的参数：
        </p>

        <pre>
{
    "fileType": "xlsx",
    "path": "sample.xlsx",
    "referenceData": {
        "fileKey": "BCFA2CED",
        "instanceId": "https://example.com"
    },
    "url": "https://example.com/url-to-example-document.xlsx"
}
</pre>
        <p>
            其中，<b>example.com</b> 是安装了<b>文档管理器</b> 和<b>文档存储服务</b> 的服务器的名称。
             请参阅<a href="<%= Url.Action("howitworks") %>">它是如何工作的</a>部分以了解有关文档服务器服务的客户端-服务器交互的更多信息。
        </p>

        <div class="header-gray">示例 token</div>
        <pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w</pre>
    </li>
    <li>
        <p><b id="setRevisedFile" class="copy-link">setRevisedFile</b> - 当调用 <a href="<%= Url.Action("methods") %>#setRevisedFile">setRevisedFile</a> 方法选择文档进行比较时， 必须添加<a href="<%= Url.Action ("methods") %>#setRevisedFile-token">令牌</a> 以验证参数。</p>

        <p>
            JSON 格式的 JWT 令牌的<em>有效负载</em>必须与方法参数具有相同的结构。
             待签名的参数列表没有严格规定，但我们建议您指定所有发送的参数：
        </p>

        <pre>
{
    "fileType": "docx",
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
        <p>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
        </p>

        <div class="header-gray">示例令牌</div>
        <pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8</pre>
    </li>
</ul>
