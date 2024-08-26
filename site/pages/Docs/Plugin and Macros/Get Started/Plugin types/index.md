---
order: -2
---

The following plugin types can be distinguished:

1. **Visual/non-visual** (marked with the [isVisual](../../Usage%20API/Config/index.md#isvisual) flag in the *config.json*):

   - *Visual plugins* (*"isVisual": true*) open a window or a panel for some action, like [Highlight code](../../Plugins/Plugin%20examples/Highlight%20code/index.md), [Photo editor](../../Plugins/Plugin%20examples/Photo%20editor/index.md), [OCR](../../Plugins/Plugin%20examples/OCR/index.md).

     You can run multiple visual plugins at the same time. For each plugin, a separate button will appear on the left toolbar.

     <img alt="Visual plugins" src="/assets/images/plugins/visual-plugins.png" width="416px">

     Starting from version 8.1, plugins can change the toolbar: create their own tabs and fill them, add buttons to the standard tabs. To do this, use the AddToolbarMenuItem method.

     ![Toolbar plugins](/assets/images/plugins/toolbar-plugins.png)

   - *Non-visual (background) plugins* (*"isVisual": false*) provide a button (or buttons) to apply some transformations or manipulations to the document, like [Hello world](../../Plugins/Plugin%20examples/Hello%20world/index.md), [Speech](../../Plugins/Plugin%20examples/Speech/index.md). To access them, click the **Background Plugins** button on the top toolbar.

     <img alt="Background plugins" src="/assets/images/plugins/background-plugins.png" width="416px">

   - *An input helper* (*"events": \["onInputHelperClear", "onInputHelperInput"]*) plugin is a combo of both visual and non-visual plugins, like [Autocomplete](../../Plugins/Plugin%20examples/Autocomplete/index.md). It has its own window that appears and disappears when you type text. Its location is tied to the cursor.

2. **System/non-system** (marked with the [isSystem](../../Usage%20API/Config/index.md#issystem) flag in the *config.json*):

   - *Non-system plugins* (not marked in the *config.json*) start upon clicking the corresponding button, like [Clippy](../../Plugins/Plugin%20examples/Clippy/index.md), [Thesaurus](../../Plugins/Plugin%20examples/Thesaurus/index.md), [Translator](../../Plugins/Plugin%20examples/Translator/index.md).
   - *System plugins* (*"isSystem": true*) work in the background as long as the editors are launched, like [Settings](../../Plugins/Plugin%20examples/Settings/index.md), [Search and replace on start](../../Plugins/Plugin%20examples/Search%20and%20replace%20on%20start/index.md). You don’t need to run them. And unlike background plugins, they cannot be disabled.

3. **Editor enhancement/UI enhancement/third-party service plugins**:

   - *Editor enhancement plugins* extend the editor functionality and enhance the existing user experience, like [Search and replace](../../Plugins/Plugin%20examples/Search%20and%20replace/index.md), [Add comment in cell](../../Plugins/Plugin%20examples/Add%20comment%20in%20cell/index.md), [Move cursor](../../Plugins/Plugin%20examples/Move%20cursor/index.md).
   - *UI enhancement plugins* add custom components and controls to the UI, like [Trackchanges](https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/trackchanges), [Trackchanges off](https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/trackchanges_off).
   - *Third-party service plugins* connect third-party services to the editors, like [Typograf](../../Plugins/Plugin%20examples/Typograf/index.md), [Zotero](../../Plugins/Plugin%20examples/Zotero/index.md), [Telegram](../../Plugins/Plugin%20examples/Telegram/index.md).

4. **OLE object** (marked as *"initDataType": "ole"* flag in the *config.json*):

   - In addition to simple document manipulation or editing, the plugin can embed an *OLE object* which allows a third-party developer to access the document format, i.e. save information from external resources to the resulting file.

     For example, the [YouTube](../../Plugins/Plugin%20examples/YouTube/index.md) plugin embeds YouTube videos into your document and the [Chess](../../Plugins/Plugin%20examples/Chess/index.md) plugin embeds a chess board.
