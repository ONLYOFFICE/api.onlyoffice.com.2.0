---
order: -9
---

## How to embed a document to a web site?

There are three main appearances of the editors, optimized for different use:

- **desktop**, which is optimized for the display in desktop computer browsers;
- **mobile**, which is optimized for the display in mobile device browsers;
- **embedded**, which is optimized for the embedding the documents into a website page.

You can embed the document with any appearance to your webpage, but it is more logical to use the specific **embedded** display type with only main controls for the editors displayed for the document within a website page.

That is why the *type* should be set to **embedded** and the configuration file will look like this:

  ``` ts
  const docEditor = new DocsAPI.DocEditor("placeholder", {
    type: "embedded",
  })
  ```

Further information about the display type can be found [at this page](../../../Usage%20API/Config/index.md#type).

## How to change the behavior of the buttons in the embedded mode?

The embedded mode allows to display the document with only three control buttons: **Download**, **Share** and **Embed**. You can change the behavior of these buttons the following way:

- *editorConfig.embedded.embedUrl* is the absolute URL to the document with the *type* parameter set to **embedded** in the configuration, which can be used by other users to embed it into their own website page.

- *editorConfig.embedded.saveUrl* is the absolute URL to the document with the *document.permission.download* parameter set to **true**, which can be saved by other users to their own computer in the *DOCX*, *PPTX* or *XLSX* format depending on the file type.

- *editorConfig.embedded.shareUrl* is the absolute URL to the document which can be used by other users to share it with others.

  ``` ts
  const docEditor = new DocsAPI.DocEditor("placeholder", {
    editorConfig: {
      embedded: {
        embedUrl: "https://example.com/embedded?doc=exampledocument1.docx",
        saveUrl: "https://example.com/download?doc=exampledocument1.docx",
        shareUrl: "https://example.com/view?doc=exampledocument1.docx",
      },
    },
  })
  ```

Where the **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

To remove any of these buttons simply do not include the corresponding parameter into the configuration file.

> If you decide to hide the **Download** button (*editorConfig.embedded.saveUrl* parameter), please do not forget to also set the *document.permission.download* parameter in the document configuration to **false** to completely disable the possibility to download the file.

Further information about the embedding parameters can be found [at this page](../../../Usage%20API/Config/Editor/Embedded/index.md).
