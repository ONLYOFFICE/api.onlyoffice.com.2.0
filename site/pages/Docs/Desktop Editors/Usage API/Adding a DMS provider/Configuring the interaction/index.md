---
order: -8
---

Once your DMS is [added](../index.md) to the connection list, configure the DMS/Desktop Editors interaction:

- [log in](../Login%20and%20logout/index.md) to your DMS so that it will be displayed in the **Connected clouds** list,
- enable [notifications](../Sending%20notifications/index.md) from the desktop application,
- change the interface [theme](../Changing%20a%20theme/index.md),
- enable end-to-end [encryption](../Encryption/index.md).

Before proceeding further, it’s highly recommended to adjust the DMS elements to be displayed when the document is opened in the desktop application.

Exclude the functionality which is not related to the document manager. Hide such sections like navigation, site header and footer, etc. Remove links to the third-party resources. Other pages will open in the default browser without interacting with the desktop editors.

There are three ways for the desktop application to be recognized:

- *?desktop = true* is added to the parameters of the server request address.
- Starting from version 6.1, the application adds the *AscDesktopEditor $version$* line to the *navigator.userAgent* parameter. For example, *AscDesktopEditor 6.1.0*.
- In JavaScript code there is also a *window\.AscDesktopEditor* object whose methods can send commands and information to the app.
