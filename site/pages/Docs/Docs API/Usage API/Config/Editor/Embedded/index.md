Description

The embedded section is for the **embedded** document type only (see the [config](/editors/config/#type) section to find out how to define the **embedded** document type). It allows to change the settings which define the behavior of the buttons in the embedded mode.

Example

The **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](/editors/howitworks) section to find out more on ONLYOFFICE Docs service client-server interactions.

Embed Url https\://example.com/embedded?doc=exampledocument1.docx

Fullscreen Url https\://example.com/embedded?doc=exampledocument1.docx#fullscreen

Save Url https\://example.com/download?doc=exampledocument1.docx

Share Url https\://example.com/view?doc=exampledocument1.docx

Toolbar Docked top

Config.js

![Copy](/copy-content.svg) When you copy, you get the HTML code for the whole example. HTML copied.

```
```

Parameters

| Name                                  | Description                                                                                                    | Type   | Example                                                              |
| ------------------------------------- | -------------------------------------------------------------------------------------------------------------- | ------ | -------------------------------------------------------------------- |
| embedUrl                              | Defines the absolute URL to the document serving as a source file for the document embedded into the web page. | string | "https\://example.com/embedded?doc=exampledocument1.docx"            |
| fullscreenUrl                         | Defines the absolute URL to the document which will open in full screen mode.                                  | string | "https\://example.com/embedded?doc=exampledocument1.docx#fullscreen" |
| saveUrl                               | Defines the absolute URL that will allow the document to be saved onto the user personal computer.             | string | "https\://example.com/download?doc=exampledocument1.docx"            |
| shareUrl                              | Defines the absolute URL that will allow other users to share this document.                                   | string | "https\://example.com/view?doc=exampledocument1.docx"                |
| toolbarDocked                         | Defines the place for the embedded viewer toolbar, can be either **top** or **bottom**.                        | string | "top"                                                                |
| ![](/editor/embedded.png) |                                                                                                                |        |                                                                      |
