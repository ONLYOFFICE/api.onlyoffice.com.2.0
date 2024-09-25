---
order: -5
---

The steps below explain the process of inserting data into the spreadsheet by an external link in ONLYOFFICE Docs.

![Inserting external data](/assets/images/editor/insert-external-data.svg)

1. The user copies the cell value to the clipboard from the **document editor** of the source spreadsheet. At the same time, the special data is also copied.
2. The user inserts the copied data into the **document editor** of the destination spreadsheet.
3. The **document editor** requests a link to the source file by sending the data to the **document manager**.
4. The **document manager** sends the source spreadsheet link to the **document editor**.
5. The **document editor** sends a request to the **document editing service** for spreadsheet downloading.
6. The **document editing service** downloads the source spreadsheet from the **document storage service**.
7. The **document editing service** sends all the necessary data to display in the **document editor** of the destination spreadsheet.

## How this can be done in practice

1. Create a source spreadsheet from where the data will be copied.

2. Specify the [document.referenceData](../../../Usage%20API/Config/Document/index.md#referencedata) parameter in the initialization config of the source spreadsheet:

   ``` ts
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     document: {
       referenceData: {
         fileKey: "BCFA2CED",
         instanceId: "https://example.com",
         key: "Khirz6zTPdfd7",
       },
     },
   })
   ```

3. When the user copies the data from the source spreadsheet, the clipboard receives a list of the following values:

   - the sheet name and the range from where the data was copied which will be used later to refresh the copied data;
   - the [document.referenceData](../../../Usage%20API/Config/Document/index.md#referencedata) object which will be used to check the availability of insering data into the destination spreadsheet by the external link;
   - the file name which will be used to display a formula in the editor.

4. Create a destination spreadsheet where the external data will be inserted.

5. Specify the [onRequestReferenceData](../../../Usage%20API/Config/Events/index.md#onrequestreferencedata) event handler in the initialization config of the destination spreadsheet for the *Paste link* and *Update values* buttons to be displayed:

   ``` ts
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     events: {
       onRequestReferenceData,
     },
   })
   ```

6. If the clipboard has the source spreadsheet data specified in step 3, and the destination spreadsheet has the *onRequestReferenceData* event handler in the initialization config, then the *Paste link* button is displayed in the dialog box.

   <img alt="Paste link" src="/assets/images/editor/paste-link.png" width="550px">

7. When the user clicks the *Paste link* button, the formula is inserted into the current cell, and the *referenceData* object is saved to the destination file. The inserted formula is displayed as follows:

   ``` txt
   ='[fileName]sheetName'!cell
   ```

   | Parameter | Type   | Example   | Description                                    |
   | --------- | ------ | --------- | ---------------------------------------------- |
   | cell      | string | E5        | The cell from where the data was copied.       |
   | fileName  | string | new\.xlsx | The file name from where the data was copied.  |
   | sheetName | string | Sheet1    | The sheet name from where the data was copied. |

   The data update request to the file will be sent to the file URL.

   > Please note that you can enter a formula of the specified format in the cell, and the data from the extrenal file will be inserted as well. But in this case, the *onRequestReferenceData* event will be executed only with the *path* parameter.

8. When the user is trying to refresh data from the source file by clicking the *Update values* button in the *External links* dialog box of the *Data* tab, the [onRequestReferenceData](../../../Usage%20API/Config/Events/index.md#onrequestreferencedata) event is called. An object with the unique file data received from the source file, the file path or name, and the file URL are sent in the *data* parameter.

   > To send the data to the *setReferenceData* method, it is recommended to search for the file by the *referenceData* parameter first. If there is no such a field or a file cannot be found, then the *path* or *link* parameters are used.

   ``` ts
   function onRequestReferenceData(event) {
     const link = event.data.link
     const referenceData = event.data.referenceData
     const path = event.data.path
   }
   ```

<img alt="Update values" src="/assets/images/editor/update-values.png" width="700px">

9. In order to refresh the data from the source file, the [setReferenceData](../../../Usage%20API/Methods/index.md#setreferencedata) method must be called. When calling this method, the token must be added to validate the parameters.

   > Please note that this method is executed only when the user has permissions to the source file.

   ``` ts
   docEditor.setReferenceData({
     fileType: "xlsx",
     path: "sample.xlsx",
     referenceData: {
       fileKey: "BCFA2CED",
       instanceId: "https://example.com",
       key: "Khirz6zTPdfd7",
     },
     token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w",
     url: "https://example.com/url-to-example-document.xlsx",
   })
   ```

   Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

## Working with external links

1. Specify the event handler for the *Open source* button to be displayed in the configuration script for Document Editor initialization. When the user is trying to open an external link by clicking the *Open source* button, the [onRequestOpen](../../../Usage%20API/Config/Events/index.md#onrequestopen) event is called.

   To open the editor with the external file referenced by the *path* or *referenceData* parameters in a new tab, you must pass a link to this tab by calling the [window.open](https://developer.mozilla.org/en-US/docs/Web/API/Window/open) method with the *path* and *windowName* parameters.

   An object with the unique file data, the file path, and a new browser tab name are sent in the *data* parameter.

   <img alt="open-source" src="/assets/images/editor/open-source.png" width="498px">

   Example:

   ``` ts
   function onRequestOpen(event) {
     const path = event.data.path
     const referenceData = event.data.referenceData
     const windowName = event.data.windowName
     window.open({
       path: "https://example.com/external-url.docx",
       windowName: event.data.windowName,
     })
   }
   
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     events: {
       onRequestOpen,
     },
   })
   ```

   Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

2. Specify the event handler for the *Change source* button to be displayed in the configuration script for Document Editor initialization. When the user is trying to change an external link by clicking the *Change source* button, the [onRequestReferenceSource](../../../Usage%20API/Config/Events/index.md#onrequestreferencesource) event is called.

   An object with the unique file data and the file path or name are sent in the *data* parameter.

   When the button is clicked, you must call the [setReferenceSource](../../../Usage%20API/Methods/index.md#setreferencesource) method to change a source of the external data. When calling this method, the token must be added to validate the parameters. If the event is not declared, the *Change source* button will not be displayed.

   > To send the data to the *setReferenceSource* method, it is recommended to search for the file by the *referenceData* parameter first. If there is no such a field or a file cannot be found, then the *path* parameter is used.
   
   <img alt="Change source" src="/assets/images/editor/change-source.png" width="498px">

   Example:

   ``` ts
   function onRequestReferenceSource() {
     const referenceData = event.data.referenceData
     const path = event.data.path
   
     docEditor.setReferenceSource({
       fileType: "xlsx",
       path: "sample.xlsx",
       referenceData: {
         fileKey: "BCFA2CED",
         instanceId: "https://example.com",
         key: "Khirz6zTPdfd7",
       },
       token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxlVHlwZSI6Inhsc3giLCJwYXRoIjoic2FtcGxlLnhsc3giLCJyZWZlcmVuY2VEYXRhIjp7ImZpbGVLZXkiOiJCQ0ZBMkNFRCIsImluc3RhbmNlSWQiOiJodHRwczovL2V4YW1wbGUuY29tIn0sInVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQueGxzeCJ9.UXosmM-E_Cu9j9QGSlcj9FEoSu5m-zCS4b6FxO_2k7w",
       url: "https://example.com/url-to-example-document.xlsx",
     })
   }
   
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     events: {
       onRequestReferenceSource,
     },
   })
   ```
