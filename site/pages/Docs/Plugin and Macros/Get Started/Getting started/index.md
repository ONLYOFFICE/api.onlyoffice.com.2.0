---
order: -1
---

Let's see how to build the simplest [Hello world](https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/helloworld) plugin, which inserts the *Hello World!* phrase when you press the button.

## Building a plugin

1. Create a plugin folder. Follow the plugin structure described [here](../../Structure/index.md). The plugin folder must contain three files required for the plugin to work: [config.json](../../Structure/Manifest/index.md), [index.html](../../Structure/Entry%20point/index.md), [pluginCode.js](../../Interacting%20with%20editors/Overview/index.md):

   ![Structure](/assets/images/plugins/plugins-structure.png)

   ### config.json

   ``` json
   {
     "name": "hello world",
     "guid": "asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}",
     "baseUrl": "",
     "variations": [
       {
         "description": "hello world",
         "url": "index.html",
         "icons": ["resources/img/icon.png", "resources/img/icon@2x.png"],
         "isViewer": false,
         "EditorsSupport": ["word"],
         "isVisual": false,
         "isModal": true,
         "isInsideMode": false,
         "initDataType": "none",
         "initData": "",
         "isUpdateOleOnResize": true,
         "buttons": []
       },
       {
         "description": "About",
         "url": "index_about.html",
         "icons": ["resources/img/icon.png", "resources/img/icon@2x.png"],
         "isViewer": false,
         "EditorsSupport": ["word"],
         "isVisual": true,
         "isModal": true,
         "isInsideMode": false,
         "initDataType": "none",
         "initData": "",
         "isUpdateOleOnResize": true,
         "buttons": [
           {
             "text": "Ok",
             "primary": true
           }
         ],

         "size": [392, 147]
       }
     ]
   }
   ```

   ### index.html

   ``` html
   <!DOCTYPE html>
   <html>
   <head>
    <meta charset="UTF-8" />
    <title>Hello world</title>
    <script type="text/javascript" src="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.js"></script>
    <script type="text/javascript" src="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins-ui.js"></script>
    <link rel="stylesheet" href="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.css">
    <script type="text/javascript" src="scripts/helloworld.js"></script>
   </head>
   <body>
   </body>
   </html>
   ```

   ### pluginCode.js

   ``` ts
   // Example insert text into editors (different implementations)
   ((window) => {
     const text = "Hello world!"
     window.Asc.plugin.init = () => {
       const variant = 2

       switch (variant) {
       case 0:
         // serialize command as text
         let sScript = "var oDocument = Api.GetDocument();"
         sScript += "oParagraph = Api.CreateParagraph();"
         sScript += "oParagraph.AddText('Hello world!');"
         sScript += "oDocument.InsertContent([oParagraph]);"
         this.info.recalculate = true
         this.executeCommand("close", sScript)
         break
       case 1:
         // call command without external variables
         this.callCommand(() => {
           const oDocument = Api.GetDocument()
           const oParagraph = Api.CreateParagraph()
           oParagraph.AddText("Hello world!")
           oDocument.InsertContent([oParagraph])
         }, true)
         break
       case 2:
         // call command with external variables
         Asc.scope.text = text // export variable to plugin scope
         this.callCommand(() => {
           const oDocument = Api.GetDocument()
           const oParagraph = Api.CreateParagraph()
           oParagraph.AddText(Asc.scope.text) // or oParagraph.AddText(scope.text);
           oDocument.InsertContent([oParagraph])
         }, true)
         break
       default:
         break
       }
     }

     window.Asc.plugin.button = (id) => {}
   })(window)
   ```

   Use plugin [methods](../../Interacting%20with%20editors/Methods/index.md) and [events](../../Interacting%20with%20editors/Events/index.md) while writing the plugin code. For example, in the **Hello world** plugin, we use the `init` and `button` events, and the `callCommand` and `executeMethod` methods.

   Read the plugin [customization](../../Customization/index.md) section to find out how the plugin can be displayed in the editor: as context menu items, toolbar buttons, windows, left or right panels, input helpers. Choose the option that is suitable for your plugin and customize it following our instructions.

2. Add the ONLYOFFICE [style sheet](../../Structure/Styles/index.md) to the *index.html* file to adjust your plugin to the ONLYOFFICE editor style:

``` html
<link rel="stylesheet" href="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.css">
```

3. [Localize](../../Structure/Localization/index.md) your plugin if needed.

4. Create an informative **About** window for your plugin. Add a short description and the plugin version, the company developer name and link to its website. Follow the instructions [here](../../Structure/Manifest/Variations/index.md) to create an **About** variation in the *config.json* file.

   ![About window](/assets/images/plugins/about-variation.png)

   Don't forget to create the *index_about.html* file for the **About** window.

## Connecting a plugin to the editors

### To desktop editors

1. Pack all the plugin files within the plugin folder into a `zip` archive and change its extension to `.plugin` (all the plugin files and subfolders must be at the archive root).

2. Install a plugin [through the Plugin Manager](../../Tutorials/Installing/ONLYOFFICE%20Desktop%20Editors/index.md#adding-plugins-through-the-plugin-manager).

3. The plugin will appear in the *sdkjs-plugins* directory. The path to the folder depends on the operating system you use:

   - For Linux - `home/<username>/.local/share/onlyoffice/desktopeditors/sdkjs-plugins/`
   - For Windows - `C:\Users\<username>\AppData\Local\ONLYOFFICE\DesktopEditors\data\sdkjs-plugins\`
   - For macOS - `Users/<username>/Library/Application Support/asc.onlyoffice.ONLYOFFICE/sdkjs-plugins/`

   A plugin **GUID** will be used as the folder name. For example, *{07FD8DFA-DFE0-4089-AL24-0730933CC80A}*.

   ![Sdkjs-plugins folder](/assets/images/plugins/sdkjs-plugins-folder.png)

   You can edit the plugin and reload it to see the changes.

   To debug the plugin in the desktop editors, follow the instructions [here](../../Tutorials/Developing/For%20desktop%20editors/index.md#debugging).

### To web editors

1. Start distributing a folder. To do this, open the created folder and run the following commands:

   ``` sh
   npm install http-server -g
   http-server -p <port> --cors
   ```

   where **port** is the port number with ONLYOFFICE Docs installed.

   > CORS requests are needed so that plugin files can be loaded from any server.

2. Open the developer console in any ONLYOFFICE web editor, go to the **Console** tab, choose the **frameEditor** from the drop-down list, and run the following command:

   ``` ts
   Asc.editor.installDeveloperPlugin("https://<documentserver>:<port>/config.json")
   ```

   where **documentserver** is the name of the server, and **port** is the port number with the ONLYOFFICE Docs installed.

   ![Developer console](/assets/images/plugins/developer-console.png)

   > Please note that this is important to open your plugin in the **Plugin Manager** and check how it looks like in the **My Plugins** tab both in the light and dark themes. Improve the plugin display if necessary.

   The plugin will be displayed within the **Plugins** tab. You can edit the plugin and reload it to see the changes.

   To debug the plugin in the web editors, follow the instructions [here](../../Tutorials/Developing/For%20web%20editors/index.md#debugging).
