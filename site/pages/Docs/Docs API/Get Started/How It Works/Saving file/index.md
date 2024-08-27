---
order: -20
---

The reference figure and the steps below explain the process of saving a document in ONLYOFFICE Docs.

<img alt="Saving file" src="/assets/images/editor/saving.jpg" width="720px">

1. The user edits the document in the **document editor**.

2. The **document editor** sends the changes to the **document editing service**.

3. The user closes the **document editor**.

4. The **document editing service** watches the end of work with the document and collects the changes sent from the **document editor** into one document.

5. The **document editing service** informs the **document storage service** about the end of the document editing using the *callbackUrl* from [JavaScript API](../../Basic%20concepts/index.md) and returns the link to the modified document.

   > Please note that since version 5.5, [callbackUrl](../../../Usage%20API/Config/Editor/index.md#callbackurl) is selected based on [status](../../../Usage%20API/Callback%20handler/index.md#status) of the request. Starting from version 4.4 to version 5.5, *callbackUrl* is used from the last user who joined the co-editing. Prior to version 4.4, when co-editing, *callbackUrl* is used from the user who first opened the file for editing.

6. The **document storage service** downloads the document file with all the saved changes from the **document editing service** and stores it.

## How this can be done in practice

1. Create a [callback handler](../../../Usage%20API/Callback%20handler/index.md) to save the document from **document editing service**.

2. Create an *html* file to [Open the document](../Opening%20file/index.md#how-this-can-be-done-in-practice).

3. In the configuration script for Document Editor initialization specify the URL to the file with the *Callback handler* in the [parameter line](../../../Usage%20API/Config/Editor/index.md#callbackurl). Be sure to add a [token](../Security/index.md) when using local links. Otherwise, an error will occur.

   ``` ts
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     document: {
       fileType: "docx",
       key: "Khirz6zTPdfd7",
       title: "Example Document Title.docx",
       url: "https://example.com/url-to-example-document.docx",
     },
     documentType: "word",
     editorConfig: {
       callbackUrl: "https://example.com/url-to-callback.ashx",
     },
     token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb2N1bWVudCI6eyJmaWxlVHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3IiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50IFRpdGxlLmRvY3giLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifSwiZG9jdW1lbnRUeXBlIjoid29yZCIsImVkaXRvckNvbmZpZyI6eyJjYWxsYmFja1VybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWNhbGxiYWNrLmFzaHgifX0.vbezS2aM8Xf8qFzIAsO-jrIsi7VLxjRYkIkwh5jLTJU",
   })
   ```
   Where **example.com** is the name of the server where **document manager** and **document storage service** are installed.

4. Open your *html* file in the browser and edit your document.

5. Close the **Document Editor**. Check out your document in about 10 seconds. All changes should be saved, meaning the configuration is correct.

## Save delay

Once the document editing is finished, the **document editing service** informs the **document storage service** about it. The time before this is done is calculated using the conversion time of the edited file into the Office Open XML format (which depends on the file size, complexity and the computer power, and can be performed rather a long time), and conversion start delay time (which is equal to 5 seconds by default). In most common cases the time is about 10 seconds after the editing is finished.

The conversion start delay is necessary to allow to return to the file editing session without the file saving, e.g. when reloading the browser page with the file opened for editing. The default conversion start delay time is defined with the [services.CoAuthoring.server.savetimeoutdelay](https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#services-CoAuthoring-server-savetimeoutdelay) parameter in **ONLYOFFICE Docs** configuration file, which can be found at the following path:

For Linux - */etc/onlyoffice/documentserver/**default.json***.

For Windows - *%ProgramFiles%\ONLYOFFICE\DocumentServer\config\\**default.json***.

If you want to change it, you can use the *local.json* file, where all the edited parameters should be stored. This file is located in the same directory as the *default.json* file and the **whole object structure** for the necessary parameter **must be retained** (see the examples below).

> Please do not edit the contents of the *default.json* file directly. The default values will be restored each time you restart Docker container or upgrade **ONLYOFFICE Docs** to a new version and all your changes will be lost.

### Parameters

| Parameter                                    | Type    | Example | Description                                                                                         |
| -------------------------------------------- | ------- | ------- | --------------------------------------------------------------------------------------------------- |
| services.CoAuthoring.server.savetimeoutdelay | integer | 5000    | Defines the conversion start delay time (measured in milliseconds) after the edited file is closed. |

### Sample local.json configuration

``` json
{
  "services": {
    "CoAuthoring": {
      "server": {
        "savetimeoutdelay": 5000
      }
    }
  }
}
```

## Force saving

**Document editing service** allows to get the current document state before the editing is finished. The process is called *forcesave* in ONLYOFFICE Docs. When forcesave is initiated, **document editing service** performs request to the [callback handler](../../../Usage%20API/Callback%20handler/index.md) with the link to the document as the *url* parameter and with the **6** value for the *status* parameter. The forcesave process can be initiated the following ways:

- By the request to the [document command service](../../../Additional%20API/Command%20service/index.md) with the [forcesave](../../../Additional%20API/Command%20service/forcesave/index.md) value in the *c* parameter. The *forcesavetype* parameter will have the **0** value when sending the request to the **callback handler**.

- Enable the [editorConfig.customization.forcesave](../../../Usage%20API/Config/Editor/Customization/index.md#forcesave) mode setting it to **true** in the editor initialization configuration. In this case each time the user clicks the **Save** button, the forcesave will be done, and the *forcesavetype* parameter will have the **1** value when sending the request to the **callback handler**.

- You can enable [the repeating forcesave start](https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#AutoAssembly) in the **ONLYOFFICE Docs** additional configuration file, which can be either found at (in case you have already created it) or placed to the following path:

  For Linux - */etc/onlyoffice/documentserver/**local.json***.

  For Windows - *%ProgramFiles%\ONLYOFFICE\DocumentServer\config\\**local.json***.

  ### Parameters

  | Parameter                                  | Type    | Example | Description                                                                             |
  | ------------------------------------------ | ------- | ------- | --------------------------------------------------------------------------------------- |
  | services.CoAuthoring.autoAssembly.enable   | boolean | false   | Defines if the automatic forcesaving is enabled or not. The default value is **false**. |
  | services.CoAuthoring.autoAssembly.interval | string  | 5m      | Defines the interval time in minutes for initiating the automatic forcesaving.          |

  ### Sample local.json configuration

  ``` json
  {
    "services": {
      "CoAuthoring": {
        "autoAssembly": {
          "enable": true,
          "interval": "5m"
        }
      }
    }
  }
  ```

  The *forcesavetype* parameter will have the **2** value when sending the request to the **callback handler**.

> Please note that you cannot see the document versions created with the force saving option in the document history. The reason is that ONLYOFFICE Docs [highlights the changes](../Document%20history/index.md#how-this-can-be-done-in-practice) made from the beginning of the current document session, not from the beginning of the document version. And even if several document versions are created during one session, all changes from this session will be highlighted.

## Saving in original format

Starting from version 7.0, the [assemblyFormatAsOrigin](https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#services-CoAuthoring-server-assemblyFormatAsOrigin) server setting is enabled by default to save the assembled file in its original format. It is used to change the file format from OOXML to ODF or to save files with macros.

### Parameters

| Parameter                                          | Type    | Example | Description                                                                                          |
| -------------------------------------------------- | ------- | ------- | ---------------------------------------------------------------------------------------------------- |
| services.CoAuthoring.server.assemblyFormatAsOrigin | boolean | true    | Defines if the assembled file is saved in its original format or not. The default value is **true**. |

### Sample local.json configuration

``` json
{
  "services": {
    "CoAuthoring": {
      "server": {
        "assemblyFormatAsOrigin": true
      }
    }
  }
}
```

> Remember that this setting can crash some integrators which open the documents without prior conversion (for example, in the *.doc* format which is unavailable for saving in ONLYOFFICE Docs). Disable this setting if necessary.
