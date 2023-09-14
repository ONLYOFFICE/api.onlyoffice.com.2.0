<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Co-editing
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Co-editing</span>
    </h1>
    <p class="dscr">The reference figure and the steps below explain the process of co-editing a document in ONLYOFFICE Document Server.</p>
    <img alt="Co-editing" src="<%= Url.Content("~/content/img/editor/coedit.jpg") %>" />
    <ol>
        <li>User 1 and user 2 open one and the same document in <b>document editor</b>, i.e. when opening the file one and the same <a href="<%= Url.Action("config/document") %>#key">document.key</a> has been used.</li>
        <li>User 1 makes changes to the opened document.</li>
        <li>The <b>document editor</b> sends changes made by user 1 to the <b>document editing service</b>.</li>
        <li>The <b>document editing service</b> sends the changes made by user 1 to the user 2 <b>document editor</b>.</li>
        <li>Now these changes become visible to user 2.</li>
    </ol>
    <img class="screenshot max-width-832" alt="Co-editing" src="<%= Url.Content("~/content/img/editor/coedit-view.png") %>" />

    <h2 id="apply" class="copy-link">How this can be done in practice</h2>
    <ol>
        <li>Create an empty <em>html</em> file.</li>
        <li>Add the <em>div</em> element as shown below.
            <pre>&lt;div id=&quot;placeholder&quot;&gt;&lt;/div&gt;</pre>
        </li>
        <li>Specify your ONLYOFFICE Document Server link with the JavaScript API that will be used for your website.
            <pre>&lt;script type=&quot;text/javascript&quot; src=&quot;https://documentserver/web-apps/apps/api/documents/api.js&quot;&gt;&lt;/script&gt;</pre>
            Where <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.
        </li>
        <li>Add the script initializing the <b>Document Editor</b> for the <em>div</em> element with the configuration for the document you want to open.
            Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links. Otherwise, an error will occur.
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "user": {
            "id": "78e1e841",
            "name": "John Smith"
        }
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50IFRpdGxlLmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCIsImVkaXRvckNvbmZpZyI6eyJ1c2VyIjp7ImlkIjoiNzhlMWU4NDEiLCJuYW1lIjoiSm9obiBTbWl0aCJ9fX0.6AcBUCbys9kQ7S982Qm4w1romVg86kZ4ECNsxDff5zU"
});
</pre>
            Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        </li>
        <li>Open your <em>html</em> file in the browser.</li>
        <li>Now make a copy of your <em>html</em> file created above.</li>
        <li>Change the script initializing the <b>Document Editor</b> in the copied <em>html</em> file.
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "user": {
            "id": "F89d8069ba2b",
            "name": "Kate Cage"
        }
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50IFRpdGxlLmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCIsImVkaXRvckNvbmZpZyI6eyJ1c2VyIjp7ImlkIjoiRjg5ZDgwNjliYTJiIiwibmFtZSI6IkthdGUgQ2FnZSJ9fX0.rdmhKLzXwXXVTABioKy3R2-HGMBY5u4pbZ_TVhW2rJs"
});
</pre>
            Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        </li>
        <li>Open your copied and edited <em>html</em> file in the browser.</li>
    </ol>

    <h2 id="key-coediting" class="copy-link">Using a key in co-editing</h2>
    <p>
        In order to open a document for editing, the config initialization requires the <a href="<%= Url.Action("config/document") %>#key"><em>key</em></a> parameter which allows the user to reopen the document from the editor cache.
        The key is a text field with a limited length and a number of symbols.
        It is generated by the software integrators and defines the unique document identifier used by the service to recognize the document.
    </p>
    <div class="note">
        The key characters can be used: <b>0-9</b>, <b>a-z</b>, <b>A-Z</b>, <b>-._=</b>.
        The maximal key length is <b>128</b> characters.
    </div>
    <p>
        Therefore, it is important that users have the same key to open the document for co-editing.
        The <b>document editing service</b> identifies the key of another user (or another tab/editing session for <a href="<%= Url.Action("inlineeditors") %>">inline editors</a>) who is trying to open the document, and if that key matches the key of the file, the user is allowed to open it.
        If the key is different, then a new file, which is not related to other files and file versions, is opened.
    </p>
    <p>
        Once the request for saving the file is sent (the <em>status</em> value is equal to <em>2</em>) and the operation completion is successful (the response value is equal <em>{"error":0}</em>), this key can’t be used to open the document for editing.
        The editor is loaded with an <a href="<%= Url.Action("troubleshooting") %>#key">error message</a>.
        However, it can be used for viewing the document from the cache if it exists.
    </p>
    <p>
        If the user saves the document before the editing is finished (the <em>status</em> value is equal to <em>6</em>), the key can’t be changed.
        Otherwise, the co-editing stops.
        Please note that after the force saving procedure the key also can’t be changed for the new users who are just entering the current editing session.
    </p>
    <div id="examples" class="header-gray copy-link">Examples</div>
    <ol>
        <li>
            <p>
                Add the script initializing the <b>Document Editor</b> with <em>key 1</em>.
                The key is unknown and the URL for opening the file is specified.
            </p>
            <p>Be sure to add a <a href="<%= Url.Action("security") %>">token</a> when using local links. Otherwise, an error will occur.</p>
            <p>
                Close the <b>Document Editor</b>.
            </p>
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50LmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifX0.GcpcY8sLCUDqbgqCLvPs6Z0xfBtayOy-GHEXYiZCpfs",
    ...
});
</pre>
            <p>
                Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            </p>
        </li>
        <li>
            <p>
                Add the script initializing the <b>Document Editor</b> with the same <em>key 1</em>.
                The new URL is not used because the key is known and the document is reopened from the editor cache.
            </p>
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document 2.docx",
        "url": "https://example.com/url-to-example-document2.docx"
    },
    "documentType": "word",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50IDIuZG9jeCIsInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQyLmRvY3gifX0.aegFVaZpkqc5bEYmF-PQYf3MMFg7QvAfWeOnfDJeuTg",
    ...
});
</pre>
            <p>
                Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            </p>
        </li>
        <li>
            <p>
                Add the script initializing another <b>Document Editor</b> with <em>key 2</em>.
                The key is unknown and the URL for opening the file is specified.
                Even if this URL and the URL from the first scenario are the same, there are two independent editing sessions.
            </p>
            <p>
                Close the <b>Document Editor</b>.
            </p>
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Mgetl3dYUppf2",
        "title": "Example Document.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJNZ2V0bDNkWVVwcGYyIiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50LmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCJ9.5YvlbNVbXFddzKBdz_qPpqgUX_JrUHBWCGRQ5YgVp_w",
    ...
});
</pre>
            <p>
                Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            </p>
        </li>
        <li>
            <p>
                Add the script initializing another <b>Document Editor</b> with <em>key 1</em>.
The key is known and the document is reopened from the editor cache.
As this key and the key from the second scenario are the same, the document are opened in the co-editing mode.
            </p>
            <p>
                Get the current document state without closing the document.
                The <a href="<%= Url.Action("config/editor/customization") %>#forcesave">forcesave</a> parameter allows you to do it in the customization section of the editor initialization.
            </p>
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "customization": {
            "forcesave": true 
        }
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50LmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCIsImVkaXRvckNvbmZpZyI6eyJjdXN0b21pemF0aW9uIjp7ImZvcmNlc2F2ZSI6dHJ1ZX19fQ.dlIJqq6tH9ncQmXQV-gCi4Zc7sqYhGS5RwvpiIZGZXA",
    ...
});
</pre>
            <p>
                Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            </p>
        </li>
        <li>
            <p>
                Add the script initializing another <b>Document Editor</b>.
The key is not changed for the new users of the current editing session after the successful procedure of <a href="<%= Url.Action("save") %>#forcesave">force saving</a>.
Therefore, <em>key 1</em> must be used to get to the same co-editing session as the users from the second and the fourth scenarios.
            </p>
            <p>
                Close all the three editing sessions with <em>key 1</em>.
                All changes are successfully saved.
                As the document is saved, the key must be generated anew.
            </p>
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "callbackUrl": "https://example.com/url-to-callback.ashx"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50LmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCIsImVkaXRvckNvbmZpZyI6eyJjYWxsYmFja1VybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWNhbGxiYWNrLmFzaHgifX0.L53bCRlJyvIf-C7bcKYM2WMfmk4FeZIoeDaEpc5IxXA",
    ...
});
</pre>
            <p>
                Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            </p>
        </li>
        <li>
            <p>
                Add the script initializing the <b>Document Editor</b> for viewing the document created.
                <em>Key 1</em> can be used.
            </p>   
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "mode": "view"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50LmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCIsImVkaXRvckNvbmZpZyI6eyJtb2RlIjoidmlldyJ9fQ.wpEk-zrrGq5hKHCm6sAhl_tb51n56th-q-K52Oeq1a4",
    ...
});
</pre>
            <p>
                Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            </p>
        </li>
        <li>
            <p>
                Add the script initializing the <b>Document Editor</b> for editing the document created.
                <em>Key 1</em> cannot be used as it was changed after saving the file.
                An <a href="<%= Url.Action("troubleshooting") %>#key">error</a> occurs.
            </p>
            <p>
                Close the <b>Document Editor</b>.
            </p>
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "mode": "edit"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50LmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCIsImVkaXRvckNvbmZpZyI6eyJtb2RlIjoiZWRpdCJ9fQ.rSc0yYe3_2u7N_uaxZcDQ6vC_d5ZWU5LFkkGSow5UDY",
    ...
});
</pre>
            <p>
                Where <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
            </p>
        </li>
    </ol>

    <h2 id="modes" class="copy-link">Co-editing modes</h2>
    <p>There are two modes to collaborate on documents in real time - <b>Fast</b> and <b>Strict</b>.</p>
    <p>You can change the co-editing mode using the <a href="<%= Url.Action("config/editor") %>#coEditing">editorConfig.coEditing</a> parameter:</p>
    <pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "coEditing": {
            "mode": "fast",
            "change": true
        },
        ...
    },
    ...
});
</pre>
    <h3 id="fast" class="copy-link">Fast mode</h3>
    <p>The <b>Fast</b> mode is used by default and defines the real-time co-editing. All changes are saved automatically and the possibility to redo the last undone operation is not available. This mode displays the user cursors and tooltips with their names when they are editing the text.</p>
    <img class="screenshot max-width-832" alt="Fast mode" src="<%= Url.Content("~/content/img/editor/fast-mode.png") %>" />

    <p></p>
    <h3 id="strict" class="copy-link">Strict mode</h3>
    <p>In the <b>Strict</b> mode, you need to use the <b>Save</b> button to sync the changes made by you and other users. Until you click this button, the changes made by others are hidden. When a document is being edited by several users simultaneously, the edited text is marked with dashed lines of different colors.</p>
    <p>When the user saves the changes by clicking the <b>Save</b> button, the others will receive a note about updates.
        To accept them and save your own changes to show them to other users, click the <img alt="Save updates" title="Save updates" src="<%= Url.Content("~/content/img/editor/save-updates.png") %>" /> button
        in the left upper corner of the top toolbar. The updates will be highlighted.</p>
    <img class="screenshot max-width-832" alt="Strict mode" src="<%= Url.Content("~/content/img/editor/strict-mode.png") %>" />

</asp:Content>
