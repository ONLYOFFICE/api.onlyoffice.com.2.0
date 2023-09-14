<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("signature/") %>"></a>
    <span class="hdr">Browser</span>
</h1>
<p class="dscr">When performing the client-side browser requests to ONLYOFFICE Document Server a <em>token</em> must be added to the parameters to validate the data.</p>

<h2 id="open" class="copy-link">Opening file</h2>

<p id="config" class="copy-link">When a file is <a href="<%= Url.Action("open") %>">opened</a> for editing in ONLYOFFICE Document Server, the <a href="<%= Url.Action("config/") %>#token">token</a> must be added to the configuration to validate the parameters.</p>

<p>
    The <em>payload</em> for the JWT token in the JSON format must have the same structure as the <a href="<%= Url.Action("advanced") %>">config</a>.
</p>
<note>Please note that starting from version 7.1, the parameter list to be signed will be strictly regulated. Don't forget to add all the parameters listed below to your signature.</note>

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
    Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
    See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
</p>

<div class="header-gray">Sample token</div>
<pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicGVybWlzc2lvbnMiOnsiY29tbWVudCI6dHJ1ZSwiY29tbWVudEdyb3VwcyI6eyJlZGl0IjpbIkdyb3VwMiIsIiJdLCJyZW1vdmUiOlsiIl0sInZpZXciOiIifSwiY29weSI6dHJ1ZSwiZGVsZXRlQ29tbWVudEF1dGhvck9ubHkiOmZhbHNlLCJkb3dubG9hZCI6dHJ1ZSwiZWRpdCI6dHJ1ZSwiZWRpdENvbW1lbnRBdXRob3JPbmx5IjpmYWxzZSwiZmlsbEZvcm1zIjp0cnVlLCJtb2RpZnlDb250ZW50Q29udHJvbCI6dHJ1ZSwibW9kaWZ5RmlsdGVyIjp0cnVlLCJwcmludCI6dHJ1ZSwicmV2aWV3Ijp0cnVlLCJyZXZpZXdHcm91cHMiOlsiR3JvdXAxIiwiR3JvdXAyIiwiIl19LCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZWRpdG9yQ29uZmlnIjp7ImNhbGxiYWNrVXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tY2FsbGJhY2suYXNoeCIsIm1vZGUiOiJlZGl0IiwidXNlciI6eyJncm91cCI6Ikdyb3VwMSIsImlkIjoiNzhlMWU4NDEiLCJuYW1lIjoiU21pdGgifX19.irYst9vmsLoQtC-95A-6W8DnbqGXCbmcxJajfbPh6tQ</pre>


<h2 id="methods" class="copy-link">Methods</h2>

<ul>
    <li>
        <p><b id="insertImage" class="copy-link">insertImage</b> - when calling the <a href="<%= Url.Action("methods") %>#insertImage">insertImage</a> method to insert an image into the file, the <a href="<%= Url.Action("methods") %>#insertImage-token">token</a> must be added to validate the parameters.</p>

        <p>
            The <em>payload</em> for the JWT token in the JSON format must have the same structure as the method parameter.
            The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:
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
            Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
        </p>

        <div class="header-gray">Sample token</div>
        <pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjIjoiYWRkIiwiaW1hZ2VzIjpbeyJmaWxlVHlwZSI6InBuZyIsInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtaW1hZ2UucG5nIn1dfQ._tPxpJrPbom_f83qgX4_AB9v1cfK2LSQsfomfl7zJ58</pre>
    </li>
    <li>
        <p><b id="setHistoryData" class="copy-link">setHistoryData</b> - when calling the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method to view the document <a href="<%= Url.Action("history") %>">history</a> version in ONLYOFFICE Document Server, the <a href="<%= Url.Action("methods") %>#setHistoryData-token">token</a> must be added to validate the parameters.</p>

        <p>
            The <em>payload</em> for the JWT token in the JSON format must have the same structure as the method parameter.
            The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:
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
            Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
        </p>

        <div class="header-gray">Sample token</div>
        <pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGFuZ2VzVXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tY2hhbmdlcy56aXAiLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicHJldmlvdXMiOnsia2V5IjoiYWY4NkM3ZTcxQ2E4IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tdGhlLXByZXZpb3VzLXZlcnNpb24tb2YtdGhlLWRvY3VtZW50LmRvY3gifSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.7gaOe1_4OvgRLYD0oGk_bMrVdPaLmgZVNIgQCUQdgoE</pre>
    </li>
    <li>
        <p><b id="setMailMergeRecipients" class="copy-link">setMailMergeRecipients</b> - when calling the <a href="<%= Url.Action("methods") %>#setMailMergeRecipients">setMailMergeRecipients</a> method to insert recipient data for mail merge into the file, the <a href="<%= Url.Action("methods") %>#setMailMergeRecipients-token">token</a> must be added to validate the parameters.</p>

        <p>
            The <em>payload</em> for the JWT token in the JSON format must have the same structure as the method parameter.
            The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:
        </p>

        <pre>
{
    "fileType": "xlsx",
    "url": "https://example.com/url-to-example-recipients.xlsx"
}
</pre>
        <p>
            Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
        </p>

        <div class="header-gray">Sample token</div>
        <pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXJlY2lwaWVudHMueGxzeCJ9.P3TjOyX1Tv3xAVRAc8qtNb-uFLD6FH_WErag_rbI6nQ</pre>
    </li>
    <li>
        <p><b id="setReferenceData" class="copy-link">setReferenceData</b> - when calling the <a href="<%= Url.Action("methods") %>#setReferenceData">setReferenceData</a> method to insert data into the spreadsheet by an external link, the <a href="<%= Url.Action("methods") %>#setReferenceData-token">token</a> must be added to validate the parameters.</p>

        <p>
            The <em>payload</em> for the JWT token in the JSON format must have the same structure as the method parameter.
            The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:
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
            Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
        </p>

        <div class="header-gray">Sample token</div>
        <pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w</pre>
    </li>
    <li>
        <p><b id="setRevisedFile" class="copy-link">setRevisedFile</b> - when calling the <a href="<%= Url.Action("methods") %>#setRevisedFile">setRevisedFile</a> method to select a document for comparing, the <a href="<%= Url.Action("methods") %>#setRevisedFile-token">token</a> must be added to validate the parameters.</p>

        <p>
            The <em>payload</em> for the JWT token in the JSON format must have the same structure as the method parameter.
            The parameter list to be signed is not strictly regulated, but we recommend that you specify all the parameter sent:
        </p>

        <pre>
{
    "fileType": "docx",
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
        <p>
            Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
        </p>

        <div class="header-gray">Sample token</div>
        <pre>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8</pre>
    </li>
</ul>
