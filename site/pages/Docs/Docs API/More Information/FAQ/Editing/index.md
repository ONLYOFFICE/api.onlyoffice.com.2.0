---
order: -5
---

## What is the 'Callback handler' and why do I need it?

The **document editing service** informs the **document storage service** about the status of the document editing and sends the response with all the necessary data via the *callbackUrl*, which is specified in the configuration file like this:

  ``` ts
  const docEditor = new DocsAPI.DocEditor("placeholder", {
    editorConfig: {
      callbackUrl: "https://example.com/url-to-callback.ashx",
    },
  })
  ```

Here the `https://example.com/url-to-callback.ashx` is the address of the special handler which can process the response from the **document editing service** and response with the *"error": 0* status code. This handler can be written in the programming language of your choice.

All the parameters which can be sent to the callback handler and their description can be found at [this page](../../../Usage%20API/Callback%20handler/index.md).

There are also examples in several programming languages of how this handler can be implemented: [.Net (C#)](../../../Usage%20API/Callback%20handler/index.md#net-c-document-save-example), [Java](../../../Usage%20API/Callback%20handler/index.md#java-document-save-example), [Node.js](../../../Usage%20API/Callback%20handler/index.md#nodejs-document-save-example), [PHP](../../../Usage%20API/Callback%20handler/index.md#php-document-save-example), [Ruby](../../../Usage%20API/Callback%20handler/index.md#ruby-document-save-example).

## What is the 'document.key' parameter?

The *document.key* parameter is a unique document identifier which helps distinguish the document among the others and univocally identify it by the editing service.

Each time the document is changed, the *document.key* parameter must also be generated anew as the documents with the known key are taken from cache.

More information on this parameter is available [here](../../../Usage%20API/Config/Document/index.md#key).

## How to define the mode that the file should be opened in (viewing or editing)?

To define the document opening mode the *editorConfig.mode* parameter is used. It can acquire two values:

- **edit** is used by default and allows to open the document file for editing (if the corresponding [document.permissions](../../../Usage%20API/Config/Document/Permissions/index.md) parameters are also set to **true**);
- **view** allows to open the document for viewing with the main toolbar and editing disabled.

Set the mode using the *editorConfig* section of the configuration file:

  ``` ts
  const docEditor = new DocsAPI.DocEditor("placeholder", {
    editorConfig: {
      mode: "edit",
    },
  })
  ```

More information on this parameter is available [here](../../../Usage%20API/Config/Editor/index.md#mode).
