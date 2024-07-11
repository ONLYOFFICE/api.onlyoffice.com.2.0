The reference figure and the steps below explain the process of comparing documents in ONLYOFFICE Docs.

![Comparing documents](/assets/images/editor/compare.png)

1. The user opens the document for viewing or editing using the **document manager** (found in his/her browser).
2. The **document storage service** sends the document information using the [JavaScript API](/editors/basic) to the **document editor** and specifies the possibility to choose the file from the **document manager**.
3. The file is [opened](/editors/open) for editing.
4. The user sends a request to get a list of storage documents for comparing by clicking the *Document from Storage* button in the **document editor**.
5. The **document editor** informs the **document manager** about the request.
6. The **document manager** sends the document to the **document editor** for comparing.

## How this can be done in practice

1. Create an *html* file to [Open the document](/editors/open#apply).

2. Specify the event handler for the *Document from Storage* button to be displayed in the *Compare* options in the configuration script for Document Editor initialization. When the user clicks the button, the [onRequestCompareFile](/editors/config/events#onRequestCompareFile) event is called and they can select the document for comparing from the Storage.

   ![Comparing files](/assets/images/editor/onRequestCompareFile.png)

   ```
   var onRequestCompareFile = function() {
       docEditor.setRevisedFile({
           "fileType": "docx",
           "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8",
           "url": "https://example.com/url-to-example-document.docx"
       });
   };

   var docEditor = new DocsAPI.DocEditor("placeholder", {
       "events": {
           "onRequestCompareFile": onRequestCompareFile,
           ...
       },
       ...
   });
   ```

3. In order to select a document for comparing, the [setRevisedFile](/editors/methods#setRevisedFile) method must be called. When calling this method, the token must be added to validate the parameters.

   ```
   docEditor.setRevisedFile({
       "fileType": "docx",
       "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8",
       "url": "https://example.com/url-to-example-document.docx"
   });
   ```

4. After that the user can accept or reject the changes using the corresponding buttons on the top toolbar.

   ![Accept changes](/assets/images/editor/compare-documents.png)
