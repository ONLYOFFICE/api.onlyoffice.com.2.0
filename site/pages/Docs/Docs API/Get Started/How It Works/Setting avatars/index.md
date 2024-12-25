---
order: -2
---

The reference figure and the steps below explain the process of setting the avatars for the users in ONLYOFFICE Docs.

<img alt="Setting avatars" src="/assets/images/editor/avatars.png" width="720px">

1. The user sends a request to get a list of users and set their avatars in the **document editor**.
2. The **document editor** informs the **document manager** about the request.
3. The **document manager** sends the list of users to the **document editor** where their avatars will be displayed.
4. The user opens the comments or a list of the co-editors in the **document editor** where the users' avatars are displayed near their names.

## How this can be done in practice

1. Create an empty *html* file to [Open the document](../Opening%20file/index.md#how-this-can-be-done-in-practice).

2. To set the current user avatar, use the [editorConfig.user.image](../../../Usage%20API/Config/Editor/index.md#user) field of the initialization config:

   ``` ts
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     editorConfig: {
       user: {
         group: "Group1",
         id: "78e1e841",
         image: "https://example.com/url-to-user-avatar.png",
         name: "John Smith",
       },
     },
   })
   ```

3. In the configuration script for Document Editor initialization, specify the event handler for setting the users' avatars. When the user opens the comments or a list of the co-editors, the [onRequestUsers](../../../Usage%20API/Config/Events/index.md#onrequestusers) event is called with the *data.id* parameter. The *data.c* parameter with the *info* operation type is also passed in this event.

  <img alt="Avatars in comments" src="/assets/images/editor/avatars-comments.png" width="295px">

  <img alt="Co-editors avatars" src="/assets/images/editor/avatars-coediting.png" width="298px">

  ``` ts
  function onRequestUsers(event) {
    const c = event.data.c
    const id = event.data.id
  }

  const docEditor = new DocsAPI.DocEditor("placeholder", {
    events: {
      onRequestUsers,
    },
  })
  ```

4. In order to set the users' avatars, the [setUsers](../../../Usage%20API/Methods/index.md#setUsers) method must be called:

  ``` ts
  docEditor.setUsers({
    c: "info",
    users: [
      {
        email: "john@example.com",
        id: "78e1e841",
        image: "https://example.com/url-to-user-avatar1.png",
        name: "John Smith",
      },
      {
        email: "kate@example.com",
        id: "F89d8069ba2b",
        image: "https://example.com/url-to-user-avatar2.png",
        name: "Kate Cage",
      },
    ],
  })
  ```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.
