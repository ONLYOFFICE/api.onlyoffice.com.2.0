---
order: -16
---

The reference figure and the steps below explain the process of mentioning users in comments in ONLYOFFICE Docs.

<img alt="Create mentions" src="/assets/images/editor/mentions-create.png" width="720px">

1. The user sends a request to get a list of users to mention by typing **+** sign in the comment field in the **document editor**.
2. The **document editor** informs the **document manager** about the request.
3. The **document manager** sends the list of users to the **document editor** where this list will be displayed under the comment field.
4. The user types a comment in the comment field in the **document editor** and the comment is added to the document.
5. The **document editor** sends the message, the list of emails and the link action in the document to the **document manager**.

## How this can be done in practice

1. Create an empty *html* file to [Open the document](../Opening%20file/index.md#how-this-can-be-done-in-practice).

2. In the configuration script for Document Editor initialization, specify the event handler for the hint about mentioning users in the comments to be displayed. When the user types the **+** sign, the [onRequestUsers](../../../Usage%20API/Config/Events/index.md#onrequestusers) event is called and the commenter can select other users for mentioning in the comments. The *data.c* parameter with the *mention* operation type is passed in this event.

   <img alt="onRequestUsers" src="/assets/images/editor/onRequestUsers.png" width="309px">

   ``` ts
   function onRequestUsers(event) {
     docEditor.setUsers({
       c: event.data.c,
       users: [
         {
           email: "john@example.com",
           name: "John Smith",
         },
         {
           email: "kate@example.com",
           name: "Kate Cage",
         },
       ],
     })
   }
   
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     events: {
       onRequestUsers,
     },
   })
   ```

3. In order to set the users list under the comment field, the [setUsers](../../../Usage%20API/Methods/index.md#setusers) method must be called:

   ``` ts
   docEditor.setUsers({
     c: "mention",
     users: [
       {
         email: "john@example.com",
         name: "John Smith",
       },
       {
         email: "kate@example.com",
         name: "Kate Cage",
       },
     ],
   })
   ```

   Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

## Opening the comment

<img alt="Open action link" src="/assets/images/editor/actionLink-open.png" width="720px">

1. The user follows the link in the **document manager**.
2. The **document manager** sends the initialization *editorConfig* to the **document editor**.
3. The **document editor** scrolls the document to the comment.

Specify the event handler for the comment message and the list of emails to be sent in the configuration script for Document Editor initialization. When the user adds the comment, the [onRequestSendNotify](../../../Usage%20API/Config/Events/index.md#onrequestsendnotify) event is called. The message and the list of emails are sent in the *data* parameter. The comment data is received in the *data.actionLink* parameter. As in the case of adding an [action link](../Action%20link/index.md#how-this-can-be-done-in-practice) to a bookmark, an *actionLink* object must be used in the configuration as the value for the [editorConfig.actionLink](../../../Usage%20API/Config/Editor/index.md#actionLink) parameter.

> In version 5.4, **onRequestSendNotify** event can only be used if [onRequestUsers](../../../Usage%20API/Config/Events/index.md#onrequestusers) event is set. Starting from version 5.5, there is no such dependency between **onRequestSendNotify** and **onRequestUsers** - both can be set independently.

``` ts
function onRequestSendNotify(event) {
  const ACTION_DATA = event.data.actionLink
  const comment = event.data.message
  const emails = event.data.emails
}

const docEditor = new DocsAPI.DocEditor("placeholder", {
  events: {
    onRequestSendNotify,
  },
})
```

## Sharing settings

When the [onRequestSendNotify](../../../Usage%20API/Config/Events/index.md#onrequestsendnotify) event is called, the software integrators provide access to the file, send notifications to the mentioned users with the action link which allows scrolling to the comment position in the document.

In the case when the [document.info.sharingSettings](../../../Usage%20API/Config/Document/Info/index.md#sharingsettings) field is used in the document initialization but the list of the users from the [onRequestSendNotify](../../../Usage%20API/Config/Events/index.md#onrequestsendnotify) event is different, the [setSharingSettings](../../../Usage%20API/Methods/index.md#setsharingsettings) method must be called.

![Sharing settings](/assets/images/editor/sharing_settings.png)

``` ts
docEditor.setSharingSettings({
  sharingSettings: [
    {
      permissions: "Full Access",
      user: "John Smith",
    },
    {
      isLink: true,
      permissions: "Read Only",
      user: "External link",
    },
  ],
})
```

In the case when the [onRequestSendNotify](../../../Usage%20API/Config/Events/index.md#onrequestsendnotify) event does not provide access to the file, the [mentionShare](../../../Usage%20API/Config/Editor/Customization/index.md#mentionshare) parameter in the customization section of the editor configuration must be set to **false**.

> Please note that it will only be available for the comments if the [onRequestSendNotify](../../../Usage%20API/Config/Events/index.md#onrequestsendnotify) event is set.

<img alt="Mentions" src="/assets/images/editor/mentionShare.png" width="379px">
