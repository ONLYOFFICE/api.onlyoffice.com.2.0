---
order: -8
---

[WOPI discovery](https://docs.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/online/discovery) is a process which helps the WOPI server discover a WOPI client by requesting the discovery XML from an online office. WOPI hosts use the discovery XML to specify how to interact with the online office. The requests are sent to the `https://documentserver/hosting/discovery` address where the **documentserver** is the name of the server with the ONLYOFFICE Docs installed.

## WOPI discovery actions

The **action** element of the discovery XML provides the important characteristics of the online office. This element represents:

- available document operations in the online office,
- supported file formats (extensions).

### WOPI actions

| Name       | Description                                                                                                                                                                                                                                       |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| view       | Renders a non-editable view of a document.                                                                                                                                                                                                        |
| edit       | Allows users to edit a document.                                                                                                                                                                                                                  |
| editnew    | Creates a new document using a blank file template appropriate to the file type and opens this file for editing in the online office.                                                                                                             |
| embedview  | Renders a non-editable view of a document that is optimized for embedding in a web page. This action is available starting from version 7.2.                                                                                                      |
| convert    | Converts a document in a [binary format](../Editing%20binary%20documents/index.md) (*doc, ppt, xls*) into a modern format (*docx, pptx, xlsx*) so that it can be edited in the online office. This action is available starting from version 7.3. |
| formsubmit | Supports opening *pdf* files in the form filling mode. In this case, a user might be able to make changes to a *pdf* file even if they didn't have permission to use the *edit* action. This action is available starting from version 8.1.       |

### Attributes

| Name     | Description                                                                      |
| -------- | -------------------------------------------------------------------------------- |
| requires | The WOPI REST endpoints required to use the actions.                             |
| urlsrc   | The URL that you navigate to in order to invoke the action on a particular file. |

### Example

``` xml
<action name="edit" ext="docx" requires="locks,update"
    urlsrc="https://word-edit.officeapps.live.com/we/wordeditorframe.aspx?
ui=en-us&amp;thm=1&amp;"/>
```

**Discovery query parameters** are the parameters that can be exposed by file storage in the *urlsrc* attribute to customize the editor behavior. For example, change a language, theme, or chat.

## WOPI standard

### Parameters

| Name       | Description                                                                                                                                                                                                                                                | Example                                                          |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| ui         | Indicates that the WOPI server includes the preferred UI language in the format described in [\[RFC1766\]](https://datatracker.ietf.org/doc/html/rfc1766.html).                                                                                            | en-us                                                            |
| rs         | Indicates that the WOPI server includes preferred data language in the format described in [\[RFC1766\]](https://datatracker.ietf.org/doc/html/rfc1766.html) for cases where the language can affect data calculation (in spreadsheet editor).             | en-us                                                            |
| thm        | Indicates that the WOPI server includes a value to designate the theme used. The current values are *"1"* to indicate a light-colored theme and *"2"* to indicate a dark-colored theme.                                                                    | 1                                                                |
| dchat      | Indicates that the WOPI server includes the value *"1"* to load a view of the document that does not create or join a chat session.                                                                                                                        | 1                                                                |
| embed      | Indicates that the output of the action will be embedded in a web page (**true**).                                                                                                                                                                         | true                                                             |
| wopisrc    | Indicates that the WOPI server includes the [WOPISrc](../Overview/index.md#wopisrc) value. It tells the WOPI client what URL to call back to when running WOPI operations on a file. This parameter is required.                                           | https\://\<host\_address>/ wopi/files/(file\_id)                 |
| favIconUrl | Indicates that the WOPI server includes a URL to an appropriate favicon for all online office applications. Hosts should use this URL as the favicon for their host page, so that the appropriate application icon appears when the online office is used. | "/web-apps/apps/ documenteditor/main/ resources/img/favicon.ico" |

## Nextcloud specific

### Parameters

| Name | Description                                                                                                                                                                                                                                           | Example |
| ---- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| lang | Indicates that the Nextcloud WOPI server includes the document language in the format described in [\[RFC1766\]](https://datatracker.ietf.org/doc/html/rfc1766.html). This language is used when creating a new document with the **editnew** action. | en-us   |

## Collabora specific

Please pay attention to the *discovery.xml* structure of the Collabora connectors. They open the editor via the MIME-type which is included in the *app* element of the following structure:

``` xml
<app name="application/msword">
    <action default="true" ext="" name="edit" urlsrc="http://159.89.20.129:9980/loleaflet/ba528af/loleaflet.html?"/>
</app>
```

The *app* element like this:

``` xml
<app name="Word" favIconUrl="http://localhost:8000/web-apps/apps/documenteditor/main/resources/img/favicon.ico">
```

is ignored by the Collabora connectors.
