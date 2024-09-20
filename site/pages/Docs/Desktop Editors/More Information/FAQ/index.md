---
order: -1
---

## How to install ONLYOFFICE Desktop Editors?

ONLYOFFICE Desktop Editors is available for Windows, Linux and Mac OS. Starting from version 6.1, this application is also supported by ARM-based Apple Silicon Macs.

The simplest way to install this application on your local computer is to download it from our official [website](https://www.onlyoffice.com/download-desktop.aspx).

For some Linux distributions, like Zorin OS, Linux Mint, Linkat, Linspire, etc., the ONLYOFFICE Desktop Editors package is already pre-installed or available on their official stores.

## How to enable debug mode?

To enable [debug mode](../../Usage%20API/Debugging/Running%20in%20debug%20mode%20on%20Windows/index.md), run the desktop editor with *--ascdesktop-support-debug-info* flag.

## How to add plugins to the desktop editors?

Some plugins are installed by default in the desktop editors and displayed within the **Plugins** tab. You can install additional plugins through the plugin manager or the plugin folder. Find out more information [in this section](../../Usage%20API/Adding%20plugins/index.md).

## Can I add my DMS provider to the default connection list?

Yes, you can. Follow the instructions [on this page](../../Usage%20API/Adding%20a%20DMS%20provider/index.md).

In this way, you can add the DMS provider only to your own connection list. If you want to add it for all the users, submit a feature request [on GitHub](https://github.com/ONLYOFFICE/DesktopEditors/issues).

## How to check DMS portal availability?

To check the portal availability, you need to send the GET request. If the portal is available, then the *HTTP\_STATUS\_CODE = 200* response is expected.

These two parameters should be specified in the integration [config](../../Usage%20API/Adding%20a%20DMS%20provider/index.md) to create this request:

- *check.url* - the URL used in the request,

- *check.headers* - the headers added to the *ajax* request.

  ``` json
  {
    "name": "Nextcloud",
    "check": {
      "url": "status.php",
      "headers": {
        "OCS-APIREQUEST": true
      } 
    }
  }
  ```

## How to find out the file status?

Declare the following global function:

``` ts
window.DesktopUpdateFile = function DesktopUpdateFile() {}
```

It will be called by the desktop app to notify the user about the completion of file editing.

## How to check if the document is being opened in the desktop application?

There are three ways for the desktop app to be recognized:

- *?desktop = true* is added to the parameters of the server request address.
- Starting from version 6.1, the application adds the *AscDesktopEditor $version$* line to the *navigator.userAgent* parameter. For example, *AscDesktopEditor 5.6.0*.
- In JavaScript code there is also a *window\.AscDesktopEditor* object the methods of which can send commands and information to the app.

## How to open new windows in the desktop editors?

You can’t open new windows in the desktop editors because it is blocked (for example, for *OAuth*).

To open the document in a new window / tab correctly, you need to use the `window.open("http://url.to.document")` JavaScript command or the *open:document* command of the **execCommand** method. The details on how to open documents in the desktop editors can be found [in this section](../../Usage%20API/Adding%20a%20DMS%20provider/Opening%20documents/index.md).

## How to check if the desktop app supports encryption?

To check if the desktop app supports encryption, call the following command:

``` ts
typeof window.AscDesktopEditor.cloudCryptoCommand === "function"
```

## How to remove all the read keys?

To reset the keys and add new ones, please do the following:

- delete the keys in the DMS database;

- delete the *cloud\_crypto.xml* file from the *sdkjs-plugins* directory. The path to the folder depends on the operating system you use:

  - For Linux - *home/\<username>/.local/share/onlyoffice/desktopeditors/sdkjs-plugins/*
  - For Windows - *C:\Users\\\<username>\AppData\Local\ONLYOFFICE\DesktopEditors\data\sdkjs-plugins\\*
