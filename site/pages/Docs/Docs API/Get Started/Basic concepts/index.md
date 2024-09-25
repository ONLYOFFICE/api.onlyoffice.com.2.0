---
order: -8
---

[ONLYOFFICE Docs](../Get%20ONLYOFFICE%20Docs/index.md) is an open-source office suite that includes editors for text documents, spreadsheets, presentations and fillable forms. It provides the following features:

- creating, editing and viewing text documents, spreadsheets, presentations and fillable forms;
- collaborating on files with other teammates in real time.

ONLYOFFICE Docs also supports the **WOPI protocol** that is used to integrate your application with an online office. Further information about WOPI can be found [here](../../Using%20WOPI/Overview/index.md).

**ONLYOFFICE Docs API** is used to let the developers integrate the ONLYOFFICE Document/Spreadsheet/Presentation/Pdf Editors into their own web sites and setup and manage the editors.

The API JavaScript file can normally be found in the following editors folder:

`https://documentserver/web-apps/apps/api/documents/api.js`

Where **documentserver** is the name of the server with the ONLYOFFICE Docs installed.

The target HTML file where the editors are to be embedded need to have a placeholder *div* tag, where all the information about the editor parameters will be passed:

``` html
<div id="placeholder"></div>
<script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"></script>
```

The page code containing the changeable parameters looks the following way:

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", config)
```

Where *config* is an object:

``` ts
const config = {
  document: {
    fileType: "docx",
    key: "Khirz6zTPdfd7",
    title: "Example Document Title.docx",
    url: "https://example.com/url-to-example-document.docx",
  },
  documentType: "word",
  editorConfig: {
    callbackUrl: "https://example.com/url-to-callback.ashx",
  },
}
```

Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

From now the *docEditor* object can be used to call the **document editor** [Methods](../../Usage%20API/Methods/index.md).

The example above includes all the parameters necessary for ONLYOFFICE Docs correct startup. There are additional non-obligatory parameters though which can be changed to achieve different goals with your document (change access rights for the document, display different information about the document, etc.). See the [Advanced parameters](../../Usage%20API/Advanced%20parameters/index.md) section to find out what these parameters are and how you can change them.

To prevent the substitution of important parameters, add an encrypted signature to the requests in the form of [token](../../Additional%20API/Signature/index.md).
