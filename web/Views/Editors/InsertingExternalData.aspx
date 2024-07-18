﻿<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    插入外部数据
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">插入外部数据</span>
    </h1>
    <p class="dscr">下面的参考图和步骤解释了在 ONLYOFFICE 文档服务器中通过外部链接将数据插入电子表格的过程。</p>
    <img alt="插入外部数据" src="<%= Url.Content("~/content/img/editor/inserting-external-data.png") %>" />
    <ol>
        <li>用户将单元格值从源电子表格的 <b>文档编辑器</b> 复制到剪贴板。同时，特殊数据也被复制。</li>
        <li>用户将复制的数据插入到目标电子表格的 <b>文档编辑器</b> 中。</li>
        <li><b>文档编辑器</b> 通过将数据发送到 <b>文档管理器</b>来请求到源文件的链接。</li>
        <li><b>文档管理器</b> 将源电子表格链接发送给 <b>文档编辑器</b>。</li>
        <li><b>文档编辑器</b> 向 <b>文档编辑服务</b> 发送电子表格下载请求。</li>
        <li><b>文档编辑服务</b> 从 <b>文档存储服务</b>下载源电子表格。</li>
        <li><b>文档编辑服务</b> 发送所有必要的数据以显示在目标电子表格的 <b>文档编辑器</b> 中。</li>
    </ol>

    <h2 id="apply" class="copy-link">如何在实践中做到这一点</h2>
    <ol>
        <li>创建将从中复制数据的源电子表格。</li>
        <li>
            <p>在源电子表格的初始化配置中指定 <a href="<%= Url.Action("config/document") %>#referenceData">document.referenceData</a> 参数：</p>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "referenceData": {
            "fileKey": "BCFA2CED",
            "instanceId": "https://example.com",
            "key": "Khirz6zTPdfd7"
        },
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>当用户从源电子表格中复制数据时，剪贴板会收到以下值的列表：</p>
            <ul>
                <li>工作表名称和复制数据的范围，稍后将用于刷新复制的数据；</li>
                <li><a href="<%= Url.Action("config/document") %>#referenceData">document.referenceData</a> 对象，用于检查通过外部链接将数据插入目标电子表格的可用性；</li>
                <li>将用于在编辑器中显示公式的文件名。</li>
            </ul>
        </li>
        <li>创建将插入外部数据的目标电子表格。</li>
        <li>
            <p>在要显示的 <em>“粘贴链接”</em> 和 <em>“更新值”</em> 按钮的目标电子表格的初始化配置中指定 <a href="<%= Url.Action("config/events") %>#onRequestReferenceData">onRequestReferenceData</a>
                事件处理程序：
            </p>
            <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestReferenceData": onRequestReferenceData,
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>如果剪贴板具有在步骤 3 中指定的源电子表格数据，并且目标电子表格在初始化配置中具有 <em>onRequestReferenceData</em> 事件处理程序，
                则 <em>“粘贴链接”</em> 按钮将显示在对话框中。</p>
            <img class="screenshot max-width-550" alt="粘贴链接" src="<%= Url.Content("~/content/img/editor/paste-link.png") %>" />
        </li>
        <li>
            <p>当用户单击 <em>“粘贴链接”</em> 按钮时，公式将插入到当前单元格中，并将 <em>referenceData</em> 对象保存到目标文件中。
                插入的公式显示如下：</p>
            <pre>
='[fileName]sheetName'!cell
</pre>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                    <col class="table-example" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>示例</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>cell</td>
                        <td>从中复制数据的单元格。</td>
                        <td>string</td>
                        <td>E5</td>
                    </tr>
                    <tr class="tablerow">
                        <td>fileName</td>
                        <td>从中复制数据的文件名。</td>
                        <td>string</td>
                        <td>new.xlsx</td>
                    </tr>
                    <tr class="tablerow">
                        <td>sheetName</td>
                        <td>从中复制数据的工作表名称。</td>
                        <td>string</td>
                        <td>Sheet1</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <p>对文件的数据更新请求将发送到文件URL。</p>
            <note>请注意，您可以在单元格中输入指定格式的公式，来自外部文件的数据也会被插入。
                但在这种情况下， <em>onRequestReferenceData</em> 事件将仅使用 <em>path</em> 参数执行。</note>
        </li>
        <li>
            <p>当用户尝试通过单击<em>数据</em>选项卡的<em>外部链接</em>对话框中的<em>更新值</em>按钮来刷新源文件中的数据时，
                调用 <a href="<%= Url.Action("config/events") %>#onRequestReferenceData">onRequestReferenceData</a> 事件。 含有从源文件接收的唯一文件数据的对象、
                文件路径或名称以及文件 URL 在 <em>data</em> 参数中发送。</p>
            <note>要将数据发送到<em>setReferenceData</em>方法，建议首先通过<em>referenceData</em>参数搜索文件。
                    如果没有这样的字段或找不到文件，则使用<em>path</em>或<em>link</em>参数。</note>
            <pre>
var onRequestReferenceData = function (event) {
    var link = event.data.link;
    var referenceData = event.data.referenceData;
    var path = event.data.path;
    ...
 };
</pre>
            <img class="screenshot max-width-700" alt="更新值" src="<%= Url.Content("~/content/img/editor/update-values.png") %>" />
        </li>
        <li>
            <p>为了刷新源文件中的数据，必须调用 <a href="<%= Url.Action("methods") %>#setReferenceData">setReferenceData</a> 方法。
                调用该方法时必须添加token来验证参数。</p>
            <note>请注意，仅当用户对源文件具有权限时才会执行此方法。</note>
            <pre>
docEditor.setReferenceData({
    "fileType": "xlsx",
    "link": "https://example.com/url-to-file-editor.xlsx",
    "path": "sample.xlsx",
    "referenceData": {
        "fileKey": "BCFA2CED",
        "instanceId": "https://example.com",
        "key": "Khirz6zTPdfd7"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w",
    "url": "https://example.com/url-to-example-document.xlsx"
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
                有关文档服务器服务"客户端-服务器交互"的更多信息，请参阅 "<a href="<%= Url.Action("howitworks") %>">它是如何运作的</a>" 部分。
            </p>
        </li>
    </ol>

    <h2 id="external-links" class="copy-link">使用外部链接</h2>
    <ol>
        <li>
            <p>指定要在文档编辑器初始化的配置脚本中显示的<em>打开源</em>按钮的事件处理程序。
            当用户尝试通过单击<em>打开源</em>按钮打开外部链接时， <a href="<%= Url.Action("config/events") %>#onRequestOpen">onRequestOpen</a> 事件被调用。</p>
            <p>要在新选项卡中打开包含 <em>path</em> 或 <em>referenceData</em> 参数引用的外部文件的编辑器，
                您必须通过调用带有 <em>path</em> 和 <em>windowName</em> 参数的 <a href="https://developer.mozilla.org/en-US/docs/Web/API/Window/open" target="_blank">window.open</a> 方法来传递指向此选项卡的链接。</p>
            <p>具有唯一文件数据、文件路径和新浏览器选项卡名称的对象将在 <em>data</em> 参数中发送。</p>
            <img class="screenshot" alt="open-source" src="<%= Url.Content("~/content/img/editor/open-source.png") %>"/>
            <div class="header-gray">示例</div>
            <pre>
var onRequestOpen = function (event) {
    var path  = event.data.path;
    var referenceData = event.data.referenceData;
    var windowName  = event.data.windowName;
    window.open({
        "path": "https://example.com/external-url.docx",
        "windowName": event.data.windowName
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestOpen": onRequestOpen,
        ...
    },
    ...
});
</pre>
            <p>其中 <b>example.com</b> 是安装<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
            请参阅 <a href="<%= Url.Action("howitworks") %>">工作原理</a> 部分，了解有关文档服务器服务客户端与服务器交互的更多信息。</p>
        </li>
        <li>
            <p>指定要在文档编辑器初始化的配置脚本中显示的<em>更改源</em>按钮的事件处理程序。
            当用户尝试通过单击<em>更改源</em>按钮更改外部链接时，<a href="<%= Url.Action("config/events") %>#onRequestReferenceSource">onRequestReferenceSource</a> 事件被调用。</p>
            <p>具有唯一文件数据和文件路径或名称的对象在 <em>data</em> 参数中发送。</p>
            <p>单击该按钮时，必须调用 <a href="<%= Url.Action("methods") %>#setReferenceSource">setReferenceSource</a> 方法来更改外部数据的来源。
                调用该方法时，必须添加token来验证参数。
                如果未声明事件，则不会显示<em>更改源</em>按钮。</p>
            <note>要将数据发送到<em>setReferenceSource</em>方法，建议首先通过<em>referenceData</em>参数搜索文件。
                如果没有这样的字段或找不到文件，则使用 <em>path</em> 参数。</note>
            <img alt="Change source" class="screenshot" src="<%= Url.Content("~/content/img/editor/change-source.png") %>" />
            <div class="header-gray">示例</div>
            <pre>
var onRequestReferenceSource = function () {
    var referenceData =  event.data.referenceData;
    var path = event.data.path;
    ...

    docEditor.setReferenceSource({
        "fileType": "xlsx",
        "path": "sample.xlsx",
        "referenceData": {
            "fileKey": "BCFA2CED",
            "instanceId": "https://example.com",
            "key": "Khirz6zTPdfd7"
        },
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w",
        "url": "https://example.com/url-to-example-document.xlsx"
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestReferenceSource": onRequestReferenceSource,
        ...
    },
    ...
});
</pre>
        </li>
    </ol>

</asp:Content>
