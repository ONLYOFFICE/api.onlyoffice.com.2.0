---
order: -17
---

The reference figure and the steps below explain the process of working with links in ONLYOFFICE Docs.

<img alt="Action link" src="/assets/images/editor/actionLink-create.png" width="720px">

1. The user sends a request to get a link to the document which contains a bookmark in the **document editor**.
2. The **document editor** sends the request to the **document manager** where the software integrators create the link.
3. The **document manager** sends the link back to the **document editor** where the link is displayed.

## How this can be done in practice

1. Create an *html* file to [Open the document](../Opening%20file/index.md#how-this-can-be-done-in-practice).

2. Specify the event handler for the *Get link* button to be displayed in the bookmark editing menu in the configuration script for Document Editor initialization. When the [onMakeActionLink](../../../Usage%20API/Config/Events/index.md#onmakeactionlink) event is called, the user request is sent to the software integrators which create the link in the document storage service.

   ![onMakeActionLink](/assets/images/editor/onMakeActionLink.png)

   ``` ts
   function onMakeActionLink(event) {
     const ACTION_DATA = event.data
     const link = GENERATE_LINK(ACTION_DATA)
     docEditor.setActionLink(link)
   }
   
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     events: {
       onMakeActionLink,
     },
   })
   ```

3. In order to give the user the link to the document which contains a bookmark, the software integrators send the link to the [setActionLink](../../../Usage%20API/Methods/index.md#setactionlink) method:

   ``` ts
   docEditor.setActionLink(link)
   ```

## Opening the bookmark

<img alt="Open action link" src="/assets/images/editor/actionLink-open.png" width="720px">

1. The user follows the link in the **document manager**.
2. The **document manager** sends the initialization *editorConfig* to the **document editor**.
3. The **document editor** scrolls the document to the bookmark.

When the user follows the link, the **document editor** sends the initialization *editorConfig* to the **document editing service**. The ACTION\_DATA received from the [onMakeActionLink](../../../Usage%20API/Config/Events/index.md#onmakeactionlink) event is specified in the [data.actionLink](../../../Usage%20API/Config/Editor/index.md#actionlink) parameter of the *editorConfig*:

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  editorConfig: {
    actionLink: ACTION_DATA,
  },
})
```

> The link is generated in the same way when [mentioning](../Mentions/index.md#how-this-can-be-done-in-practice) users in the comments.
