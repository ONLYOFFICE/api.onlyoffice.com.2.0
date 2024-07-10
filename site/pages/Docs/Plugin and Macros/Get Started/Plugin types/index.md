The following plugin types can be distinguished:

1. **Visual/non-visual** (marked with the [isVisual](/plugin/config#isVisual) flag in the *config.json*):

   * *Visual plugins* (*"isVisual": true*) open a window or a panel for some action, like [Highlight code](/plugin/example/highlightcode), [Photo editor](/plugin/example/photoeditor), [OCR](/plugin/example/ocr).

     You can run multiple visual plugins at the same time. For each plugin, a separate button will appear on the left toolbar.

     ![Visual plugins](/plugins/visual-plugins.png)

     Starting from version 8.1, plugins can change the toolbar: create their own tabs and fill them, add buttons to the standard tabs. To do this, use the [AddToolbarMenuItem](/plugin/executemethod/common/addtoolbarmenuitem) method.

     ![Toolbar plugins](/plugins/toolbar-plugins.png)

   * *Non-visual (background) plugins* (*"isVisual": false*) provide a button (or buttons) to apply some transformations or manipulations to the document, like [Hello world](/plugin/example/helloworld), [Speech](/plugin/example/speech). To access them, click the **Background Plugins** button on the top toolbar.

     ![Background plugins](/plugins/background-plugins.png)

   * *An input helper* (*"events": \["onInputHelperClear", "onInputHelperInput"]*) plugin is a combo of both visual and non-visual plugins, like [Autocomplete](/plugin/example/autocomplete). It has its own window that appears and disappears when you type text. Its location is tied to the cursor.

2. **System/non-system** (marked with the [isSystem](/plugin/config#isSystem) flag in the *config.json*):

   * *Non-system plugins* (not marked in the *config.json*) start upon clicking the corresponding button, like [Clippy](/plugin/example/clippy), [Thesaurus](/plugin/example/thesaurus), [Translator](/plugin/example/translator).

   * *System plugins* (*"isSystem": true*) work in the background as long as the editors are launched, like [Settings](/plugin/example/settings), [Search and replace on start](/plugin/example/searchandreplaceonstart). You don’t need to run them. And unlike background plugins, they cannot be disabled.

3. **Editor enhancement/UI enhancement/third-party service plugins**:

   * *Editor enhancement plugins* extend the editor functionality and enhance the existing user experience, like [Search and replace](/plugin/example/searchandreplace), [Add comment in cell](/plugin/example/addcommentincell), [Move cursor](/plugin/example/movecursor).

   * *UI enhancement plugins* add custom components and controls to the UI, like [Trackchanges](https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/trackchanges), [Trackchanges off](https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/trackchanges_off).

   * *Third-party service plugins* connect third-party services to the editors, like [Typograf](/plugin/example/typograf), [Zotero](/plugin/example/zotero), [Telegram](/plugin/example/telegram).

4. **OLE object** (marked as *"initDataType": "ole"* flag in the *config.json*):

   * In addition to simple document manipulation or editing, the plugin can embed an *OLE object* which allows a third-party developer to access the document format, i.e. save information from external resources to the resulting file.

     For example, the [YouTube](/plugin/example/youtube) plugin embeds YouTube videos into your document and the [Chess](/plugin/example/chess) plugin embeds a chess board.
