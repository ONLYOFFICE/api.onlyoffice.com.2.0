---
order: -8
---

The reference figure and the steps below explain the process of comparing documents in ONLYOFFICE Docs.

<img alt="Comparing documents" src="/assets/images/editor/compare.png" width="720px">

1. The user opens the document for viewing or editing using the **document manager** (found in his/her browser).
2. The **document storage service** sends the document information using the [JavaScript API](../../Basic%20concepts/index.md) to the **document editor** and specifies the possibility to choose the file from the **document manager**.
3. The file is [opened](../Opening%20file/index.md) for editing.
4. The user sends a request to get a list of storage documents for comparing by clicking the *Document from Storage* button in the **document editor**.
5. The **document editor** informs the **document manager** about the request.
6. The **document manager** sends the document to the **document editor** for comparing.

## How this can be done in practice

1. Create an *html* file to [Open the document](../Opening%20file/index.md#how-this-can-be-done-in-practice).

2. Specify the event handler for the *Document from Storage* button to be displayed in the *Compare* options in the configuration script for Document Editor initialization. When the user clicks the button, the [onRequestCompareFile](../../../Usage%20API/Config/Editor/Customization/index.md#onrequestcomparefile) event is called and they can select the document for comparing from the Storage.

   ![onRequestCompareFile](/assets/images/editor/onRequestCompareFile.png)

   ``` ts
   function onRequestCompareFile() {
     docEditor.setRevisedFile({
       fileType: "docx",
       token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8",
       url: "https://example.com/url-to-example-document.docx",
     })
   }
   
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     events: {
       onRequestCompareFile,
     },
   })
   ```

3. In order to select a document for comparing, the [setRevisedFile](../../../Usage%20API/Methods/index.md#setrevisedfile) method must be called. When calling this method, the token must be added to validate the parameters.

   ``` ts
   docEditor.setRevisedFile({
     fileType: "docx",
     token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.t8660n_GmxJIppxcwkr_mUxmXYtE8cg-jF2cTLMtuk8",
     url: "https://example.com/url-to-example-document.docx",
   })
   ```

4. After that the user can accept or reject the changes using the corresponding buttons on the top toolbar.

   ![Accept changes](/assets/images/editor/compare-documents.png)
