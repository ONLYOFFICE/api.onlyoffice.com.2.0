---
order: -18
---

You can view the history of text documents, spreadsheets or presentations using the **document editor**.

The document history is stored with the document storage service. The **document editor** displays the document history as a version list at the left-side panel. When you select a document version from the list it will be displayed for preview.

The reference figure and the steps below explain the process of viewing the history in ONLYOFFICE Docs.

![Document history](/assets/images/editor/viewing-history.svg)

1. The user clicks the *Version History* button while editing the document within the **document editor**.
2. The **document editor** requests the list of the document versions from the **document storage service**.
3. The **document storage service** sends the list of the document versions with the version number to be displayed.
4. The **document editor** requests the information about the selected document version from the **document storage service**.
5. The **document storage service** sends the link to the selected version of the document.
6. The **document editor** displays the selected document version.
7. When the user clicks another version in the document version list, the **document editor** requests the information about the version to be displayed anew.
8. The user clicks the *Close History* button and the **document editor** hides the list of the document versions.

## How this can be done in practice

1. Create an *html* file to [Open the document](../Opening%20file/index.md#how-this-can-be-done-in-practice).

2. Specify the event handler for opening the [version history](../../../Usage%20API/Config/Events/index.md#onrequesthistory) list in the configuration script for Document Editor initialization. When the [onRequestHistory](../../../Usage%20API/Config/Events/index.md#onrequesthistory) event is called, the [refreshHistory](../../../Usage%20API/Methods/index.md#refreshhistory) method must be executed. This method contains document history for each document version, if the history parameter has been present for each version.

   ``` ts
   function onRequestHistory() {
     docEditor.refreshHistory({
       currentVersion: 2,
       history: [
         {
           created: "2010-07-06 10:13 AM",
           key: "af86C7e71Ca8",
           user: {
             id: "F89d8069ba2b",
             name: "Kate Cage",
           },
           version: 1,
         },
         {
           created: "2010-07-07 3:46 PM",
           key: "Khirz6zTPdfd7",
           user: {
             id: "78e1e841",
             name: "John Smith",
           },
           version: 2,
         },
       ],
     })
   }
   
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     events: {
       onRequestHistory,
     },
   })
   ```

   <img alt="Opening File" src="/assets/images/editor/history_open.png" width="300px">

3. In the configuration script for Document Editor initialization, specify the event handler which will select the [version from history](../../../Usage%20API/Config/Events/index.md#onrequesthistorydata). When the [onRequestHistoryData](../../../Usage%20API/Config/Events/index.md#onrequesthistorydata) event is called, the [setHistoryData](../../../Usage%20API/Methods/index.md#sethistorydata) method must be executed. This method contains the absolute URL to the file of the corresponding version.

   When calling the *setHistoryData* method to view the document history version, the token must be added to validate the parameters.

   ``` ts
   function onRequestHistoryData(event) {
     const version = event.data
     docEditor.setHistoryData({
       fileType: "docx",
       key: "Khirz6zTPdfd7",
       token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.iRcdHve235L5K1e29SmUBkuHcxb63WHRko51WMJlmS0",
       url: "https://example.com/url-to-example-document.docx",
       version: 2,
     })
   }
   
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     events: {
       onRequestHistoryData,
     },
   })
   ```

   ![History](/assets/images/editor/history.png)

4. In the configuration script for Document Editor initialization, specify the event handler which will [restore](../../../Usage%20API/Config/Events/index.md#onrequestrestore) the file version when the user clicks the *Restore* button in the version history. When the [onRequestRestore](../../../Usage%20API/Config/Events/index.md#onrequestrestore) event is called, the [refreshHistory](../../../Usage%20API/Methods/index.md#refreshhistory) method must be executed to initialize version history again. This method contains document history for each document version, if the history parameter has been present for each version.

   ``` ts
   function onRequestRestore(event) {
     const fileType = event.data.fileType
     const url = event.data.url
     const version = event.data.version
   
     docEditor.refreshHistory({
       currentVersion: 2,
       history: [
         {
           created: "2010-07-06 10:13 AM",
           key: "af86C7e71Ca8",
           user: {
             id: "F89d8069ba2b",
             name: "Kate Cage",
           },
           version: 1,
         },
         {
           changes,
           created: "2010-07-07 3:46 PM",
           key: "Khirz6zTPdfd7",
           serverVersion,
           user: {
             id: "78e1e841",
             name: "John Smith",
           },
           version: 2,
         },
       ],
     })
   }
   
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     events: {
       onRequestRestore,
     },
   })
   ```

   ![onRequestRestore](/assets/images/editor/onRequestRestore.png)

5. Open your *html* file in the browser.

6. Open the *Version History* option in the Document Editor menu.

7. Specify the event handler for the *Close History* button to be displayed in the configuration script for Document Editor initialization. When the user is trying to go back to the document from viewing the document version history by clicking the *Close History* button, the [onRequestHistoryClose](../../../Usage%20API/Config/Events/index.md#onrequesthistoryclose) event is called and the version history list is hidden. When the function is called, the editor must be initialized again, in the editing mode.

   ``` ts
   function onRequestHistoryClose() {
     document.location.reload()
   }
   
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     events: {
       onRequestHistoryClose,
     },
   })
   ```

   ![onRequestHistoryClose](/assets/images/editor/onRequestHistoryClose.png)

## Opening the document history with changes highlighting

If the document version was created with the **document editor**, then the document changes can be displayed when viewing the document history. The additional data must be saved to the **document storage service** when [saving](../Saving%20file/index.md) the editing session beside the document versions themselves to achieve that. After editing in **document editor** the information about the changes during the editing session is sent together with the changed document:

> When the server version is updated, the **document editor** does not use the *changes* data to highlight changes in the history. It only returns the changed document in the *changesurl* parameter.

- [history](../../../Usage%20API/Callback%20handler/index.md#history) - this information allows to display the time and the author for each document version when you view the document history in the side panel. Must be sent as a property changes of the object sent as the argument to the [refreshHistory](../../../Usage%20API/Methods/index.md#refreshhistory) method.

  ``` ts
  docEditor.refreshHistory({
    currentVersion: 2,
    history: [
      {
        created: "2010-07-06 10:13 AM",
        key: "af86C7e71Ca8",
        user: {
          id: "F89d8069ba2b",
          name: "Kate Cage",
        },
        version: 1,
      },
      {
        changes,
        created: "2010-07-07 3:46 PM",
        key: "Khirz6zTPdfd7",
        serverVersion,
        user: {
          id: "78e1e841",
          name: "John Smith",
        },
        version: 2,
      },
    ],
  })
  ```

  Where the **changes** is the *changes* from [the history object](../../../Usage%20API/Callback%20handler/index.md#history) returned after saving the document.

  Where the **serverVersion** is the *serverVersion* from [the history object](../../../Usage%20API/Callback%20handler/index.md#history) returned after saving the document.

  > ONLYOFFICE Docs highlights the changes made from the beginning of the current document session, not from the beginning of the document version. And even if several document versions are created during one session, all changes from this session will be highlighted. Therefore, you cannot see the document versions created with the [force saving option](../Saving%20file/index.md#forcesave) in the document history.

- [changesurl](../../../Usage%20API/Callback%20handler/index.md#changesurl) - the absolute URL to the file with the document editing data used to show the changes corresponding to the specific document version. The file must be saved and its address must be sent as changesUrl parameter using the [setHistoryData](../../../Usage%20API/Methods/index.md#sethistorydata) method. The link to the previous document version (*previous.url*) must be added into the object.

  When calling the *setHistoryData* method to view the document history version, the token must be added to validate the parameters.

  ``` ts
  docEditor.setHistoryData({
    changesUrl: "https://example.com/url-to-changes.zip",
    fileType: "docx",
    key: "Khirz6zTPdfd7",
    previous: {
      fileType: "docx",
      key: "af86C7e71Ca8",
      url: "https://example.com/url-to-the-previous-version-of-the-document.docx",
    },
    token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGFuZ2VzVXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tY2hhbmdlcy56aXAiLCJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwicHJldmlvdXMiOnsiZmlsZVR5cGUiOiJkb2N4Iiwia2V5IjoiYWY4NkM3ZTcxQ2E4IiwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tdGhlLXByZXZpb3VzLXZlcnNpb24tb2YtdGhlLWRvY3VtZW50LmRvY3gifSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1kb2N1bWVudC5kb2N4IiwidmVyc2lvbiI6Mn0.ril3Ol3rvYne3g0dG8TdKCiwJ7-7kkYGc6-XWMvp8FU",
    url: "https://example.com/url-to-example-document.docx",
    version: 2,
  })
  ```

  > The *changesurl* request is made in the browser from the added iframe with the **documentserver** domain, where the **documentserver** is the name of the server with the ONLYOFFICE Docs installed. For its correct work the cross-origin HTTP requests must be allowed (CORS). This can be achieved using the *Access-Control-Allow-Origin* header.

  ![changesurl](/assets/images/editor/changesurl.png)
