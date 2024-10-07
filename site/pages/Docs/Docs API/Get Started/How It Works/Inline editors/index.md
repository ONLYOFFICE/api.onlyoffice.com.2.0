---
order: -13
---

The steps below explain the process of connecting several editors to the same html page in ONLYOFFICE Docs.

> Simultaneous work with several editors is available starting from version 5.5.

<img alt="Inline editors" src="/assets/images/editor/inlineEditors.png" width="720px">

1. Create an empty *html* file.

2. Specify your ONLYOFFICE Docs link with the JavaScript API that will be used for your website:

   ``` html
   <script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"></script>
   ```

   Where the **documentserver** is the name of the server with the ONLYOFFICE Docs installed.

3. Add the *div* element as shown below. In order to connect several editors to the same *html* page, each of them can be initialized separately:

   ``` html
   <div id="placeholder1"></div>
   <div id="placeholder2"></div>
   <div id="placeholder3"></div>
   ```

4. Add the script initializing the **Document Editor** for the *div* element with the configuration for the document you want to open. Be sure to add a [token](../Security/index.md) when using local links. Otherwise, an error will occur.

   Each editor has its own initialization script:

   ``` ts
   const documentEditor = new DocsAPI.DocEditor("placeholder1", {
     document: {
       fileType: "docx",
       key: "Khirz6zTPdfd7",
       title: "Example Document Title.docx",
       url: "https://example.com/url-to-example-document.docx",
     },
     documentType: "word",
     token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50IFRpdGxlLmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCJ9.7IpEJxdOvBQ0kJ8l6ZegIV4tX5vsPbZZCDDVmcFROXc",
   })
   const spreadsheetEditor = new DocsAPI.DocEditor("placeholder2", {
     document: {
       fileType: "xlsx",
       key: "af86C7e71Ca8",
       title: "Example Spreadsheet Title.xlsx",
       url: "https://example.com/url-to-example-spreadsheet.xlsx",
     },
     documentType: "cell",
     token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6Inhsc3giLCJrZXkiOiJhZjg2QzdlNzFDYTgiLCJ0aXRsZSI6IkV4YW1wbGUgU3ByZWFkc2hlZXQgVGl0bGUueGxzeCIsInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtc3ByZWFkc2hlZXQueGxzeCJ9LCJkb2N1bWVudFR5cGUiOiJjZWxsIn0.8CklPIjYSEkgM7swGAC7-85ICcq_42be3WTWNOuvhlg",
   })
   const presentationEditor = new DocsAPI.DocEditor("placeholder3", {
     document: {
       fileType: "pptx",
       key: "bv48M5r64Sf9",
       title: "Example Presentation Title.pptx",
       url: "https://example.com/url-to-example-presentation.pptx",
     },
     documentType: "slide",
     token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6InBwdHgiLCJrZXkiOiJidjQ4TTVyNjRTZjkiLCJ0aXRsZSI6IkV4YW1wbGUgUHJlc2VudGF0aW9uIFRpdGxlLnBwdHgiLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXByZXNlbnRhdGlvbi5wcHR4In0sImRvY3VtZW50VHlwZSI6InNsaWRlIn0.FKaDWfJE-OuODhtpq-8Qv6BdDy_evgdpaBw616T7zOs",
   })
   ```

   Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed.

5. In order to finish editing, the [destroyEditor](../../../Usage%20API/Methods/index.md#destroyeditor) method must be called to close the required editor:

   ``` ts
   documentEditor.destroyEditor()
   spreadsheetEditor.destroyEditor()
   presentationEditor.destroyEditor()
   ```

6. Open your *html* file in the browser.
