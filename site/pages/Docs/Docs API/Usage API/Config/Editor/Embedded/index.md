The embedded section is for the **embedded** document type only (see the [config](../../index.md#type) section to find out how to define the **embedded** document type). It allows to change the settings which define the behavior of the buttons in the embedded mode.

## embedUrl

Defines the absolute URL to the document serving as a source file for the document embedded into the web page.

Type: string

Example: `https://example.com/embedded?doc=exampledocument1.docx`

## fullscreenUrl

Defines the absolute URL to the document which will open in full screen mode.

Type: string

Example: `https://example.com/embedded?doc=exampledocument1.docx#fullscreen`

## saveUrl

Defines the absolute URL that will allow the document to be saved onto the user personal computer.

Type: string

Example: `https://example.com/download?doc=exampledocument1.docx`

## shareUrl

Defines the absolute URL that will allow other users to share this document.

Type: string

Example: `https://example.com/view?doc=exampledocument1.docx`

## toolbarDocked

Defines the place for the embedded viewer toolbar, can be either **top** or **bottom**.

Type: string

Example: "top"

![Embedded](/assets/images/editor/embedded.png)

## Example

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  editorConfig: {
    embedded: {
      embedUrl: "https://example.com/embedded?doc=exampledocument1.docx",
      fullscreenUrl: "https://example.com/embedded?doc=exampledocument1.docx#fullscreen",
      saveUrl: "https://example.com/download?doc=exampledocument1.docx",
      shareUrl: "https://example.com/view?doc=exampledocument1.docx",
      toolbarDocked: "top",
    },
  },
})
```
