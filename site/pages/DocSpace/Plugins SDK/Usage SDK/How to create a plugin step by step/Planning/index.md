---
order: -4
---

**Step 1**. Install all the necessary packages and programs

- ONLYOFFICE DocSpace on-premises.

  [Get ONLYOFFICE DocSpace](https://www.onlyoffice.com/download-docspace.aspx?from=api#docspace-enterprise)

  Both [Enterprise](https://helpcenter.onlyoffice.com/installation/docspace-enterprise-index.aspx?from=api) and [Community](https://helpcenter.onlyoffice.com/installation/docspace-community-index.aspx?from=api) versions are available.

- *@onlyoffice/docspace-plugin-sdk* npm package

  To install the *@onlyoffice/docspace-plugin-sdk* npm package globally, use the following command:

  ``` sh
  npm i -g @onlyoffice/docspace-plugin-sdk
  ```

**Step 2**. Design the way your plugin will work

1. Choose the service that allows you to add the necessary functionality to your DocSpace.

   For example, in our plugin samples, we use:

   - [AssemblyAI](https://www.assemblyai.com/) to convert speech from audio and video files into text;
   - [ConvertAPI](https://www.convertapi.com/) to convert documents, spreadsheets, presentations, and forms into *pdf*;
   - [Draw.io](https://www.drawio.com/) to create, edit, and insert professional-looking diagrams.
   > Please make sure that the service documentation is available, check its license, availability of API methods, etc. For some services, the user must obtain an API key to start using the plugin.

2. Think about where to implement the plugin, what the plugin's structure will be, how the user will interact with the plugin's components, etc. Make a list of the required plugin types and items depending on this information. For more information, read the [Plugin types](../../Coding%20Plugin/Plugin%20Types/index.md) and [Plugin items](../../Coding%20Plugin/Plugin%20Items/index.md) sections of the Plugins SDK documentation.

   For example, for the **speech-to-text** plugin, we use the following plugin interfaces:

   - [IPlugin](../../Coding%20Plugin/Plugin%20Types/Plugin/index.md). Required for each plugin. It contains the plugin [status](../../Coding%20Plugin/Plugin%20Types/Plugin/index.md#status) (PluginStatus) variable, used to embed the plugin into the DocSpace.
   - [IApiPlugin](../../Coding%20Plugin/Plugin%20Types/APIPlugin/index.md). Required as we implement a third-party service.
   - [ISettingsPlugin](../../Coding%20Plugin/Plugin%20Types/SettingsPlugin/index.md) and [ISettings](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/settings/ISettings.ts). Used to add settings block for plugin's configuration. The users will access this block from **Settings -> Integration -> Plugins** to adjust the plugin's parameters.
   - [IContextMenuPlugin](../../Coding%20Plugin/Plugin%20Types/ContextMenuPlugin/index.md) and [IContextMenuItem](../../Coding%20Plugin/Plugin%20Items/ContextMenuItem/index.md). Used to implement a context menu action. In the **speech-to-text** plugin, it will be available for video and audio files allowing users to convert content into text.

   The list of interfaces may be longer. For example, in the **draw\.io** plugin:

   - [IMainButtonPlugin](../../Coding%20Plugin/Plugin%20Types/MainButtonPlugin/index.md) and [IMainButtonItem](../../Coding%20Plugin/Plugin%20Items/MainButtonItem/index.md). Used to implement the main button action. In the **draw\.io** plugin, we use the **Action button -> More** menu elements in the **My documents** section or in the selected room to create draw\.io diagrams.
   - [IFilePlugin](../../Coding%20Plugin/Plugin%20Types/FilePlugin/index.md) and [IFileItem](../../Coding%20Plugin/Plugin%20Items/FileItem/index.md). Used to interact with the specified file types. In this case, with the *.drawio* files.

3. Come up with the plugin's structure. All the required files are described [here](../../Plugin%20Structure/index.md). Everything else can be organized as you wish. For example, in the **draw\.io** plugin, we put the code for each plugin type in separate folders, while in the **speech-to-text** plugin, this code is placed in the *src* folder.

   ![Speech plugin structure](/assets/images/docspace/speech-plugin-structure.png)

4. Choose a name for your plugin and write a description for it.
