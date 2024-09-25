---
order: -6
---

Use the **execCommand** method of the *window\.AscDesktopEditor* object to execute a command specified in the request.

``` ts
window.AscDesktopEditor.execCommand(command, parameters)
```

## Parameters

| Name       | Type   | Description                                           |
| ---------- | ------ | ----------------------------------------------------- |
| command    | string | Defines a command that must be executed.              |
| parameters | string | Defines the parameters that are passed to the method. |

The following commands are available:

## Commands

| Command                                                    | Description                                                                        |
| ---------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| [open:document](../Opening%20documents/index.md)           | Opens a document.                                                                  |
| [portal:checkpwd](../Encryption/Key%20generation/index.md) | Transfers the information about a password from the login page to the desktop app. |
| [portal:login](../Login%20and%20logout/index.md#login)     | Registers a cloud and adds it to the **Connected clouds** page.                    |
| [portal:logout](../Login%20and%20logout/index.md#logout)   | Removes a cloud from the list on the **Connected clouds** page.                    |
| [portal:uitheme](../Changing%20a%20theme/index.md)         | Changes a theme of the desktop editor tab.                                         |
