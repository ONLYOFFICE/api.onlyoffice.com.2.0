---
order: -3
---

Now that all the preparation work is done, you can start developing your plugin.

## Step 1. Create a plugin template

Create a plugin template and configure its settings which will be displayed in the DocSpace plugin settings:

1. To create a plugin template, open the terminal and run the following **npx** command:

   ``` sh
   npx create-docspace-plugin
   ```

   > If the npx command is not avaibale, install the *@onlyoffice/docspace-plugin-sdk* npm package globally using the following command:
   > 
   > ``` sh
   > npm i -g @onlyoffice/docspace-plugin-sdk
   > ```

2. Configure the plugin in the terminal by specifying settings in the dialog. All the settings are described [here](../../Creating%20Plugin%20Template/index.md).

   For the **speech-to-text** plugin, you can use the following values:

   | Dialog question                                               | Value                                                                                                                          |
   | ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
   | Plugin name                                                   | speech-to-text                                                                                                                 |
   | Plugin version                                                | 1.0.0                                                                                                                          |
   | Plugin author                                                 | ONLYOFFICE                                                                                                                     |
   | Plugin logo                                                   | logo.png                                                                                                                       |
   | Plugin description                                            | Speech to Text Conversion is a speech recognition software that allows you to recognize and translate spoken speech into text. |
   | Plugin license                                                | Apache-2.0                                                                                                                     |
   | Plugin homepage                                               | `https://github.com/ONLYOFFICE/docspace-plugin`                                                                                |
   | Select scopes (Press \<space> to select, Enter when finished) | API, Settings, Context menu                                                                                                    |

   ![Speech template](/assets/images/docspace/speech-template.png)

   A folder with the plugin template will be placed at the path where you executed the command.

   ![Speech template location](/assets/images/docspace/speech-template-location.png)

   You can change all the specified parameters later in the [package.json](https://github.com/ONLYOFFICE/docspace-plugins/blob/master/speech-to-text/package.json) file.

   You can also create a plugin in any project by adding the *@onlyoffice/docspace-plugin-sdk* npm package as a dependency and specifying all the necessary fields in the *package.json* file.

## Step 2. Configure the plugin entry point

The [index.ts](https://github.com/ONLYOFFICE/docspace-plugins/blob/master/speech-to-text/src/index.ts) plugin entry point will be created automatically in the [src](https://github.com/ONLYOFFICE/docspace-plugins/tree/master/speech-to-text/src) folder during the template creation step. This file is required.

This file contains all the basic methods of the plugin types that you selected in the previous step. You can change this file at any time.

If you create a plugin yourself, without a template, for the plugin entry point, you can use the code from our ready-made plugin samples. It will work perfectly.

## Step 3. Add plugin icons

Create the [assets](https://github.com/ONLYOFFICE/docspace-plugins/tree/master/speech-to-text/assets) folder in the root plugin folder and add there all the plugin icons. The number of icons and their sizes will depend on the plugin types you implement. For the **speech-to-text** plugin, we need the following icons:

- The default plugin type requires a [logo](../../Config/index.md#image) image. It is equal to the *logo* parameter from the *package.json* file. The logo will be displayed in the DocSpace plugin settings. The required icon size is 48x48 px. Otherwise, it will be compressed to this size.

  <img alt="Plugin logo" src="/assets/images/docspace/plugin-logo.png" width="300px">

- The context menu plugin uses an [icon](../../Coding%20Plugin/Plugin%20Items/ContextMenuItem/index.md#icon) on the **Convert to text** button. The required icon size is 16x16 px. Otherwise, it will be compressed to this size.

  ![Convert to text](/assets/images/docspace/convert-to-text.png)

  This icon can be also used for the main button icon. For example, in the **draw\.io** plugin, the same icon is used for the context and main button menu.

  ![Main button icon](/assets/images/docspace/main-button-icon.png)

  The **draw\.io** plugin also uses the specific file icon near the *.drawio* files, which are created with the file plugin type. The preferred icon size for the [table format](../../Coding%20Plugin/Plugin%20Items/FileItem/index.md#filerowicon) is 32x32 px.

  ![File icon](/assets/images/docspace/file-icon.png)

  In this plugin, the same file icon is also used for the [tile view](../../Coding%20Plugin/Plugin%20Items/FileItem/index.md#filetileicon). But it is recommended to add another icon of the 96x96 px size in this case.

  ![File icon tile](/assets/images/docspace/file-icon-tile.png)

## Step 4. Configure the plugin's interface elements

If necessary, define the plugin's UI elements. Consult our [Storybook](https://api.onlyoffice.com/docspace-storybook/) to develop your plugin's UI.

For example, the **draw\.io** plugin contains two main UI elements - the modal window and the diagram editor. Create the files for configuring each element. For your convenience, you can put these files into a separate *DrawIO* folder.

- In the [Dialog.ts](https://github.com/ONLYOFFICE/docspace-plugins/blob/master/draw.io/src/DrawIO/Dialog.ts) file, configure the modal window settings. Specify the [IFrame](../../Coding%20Plugin/Plugin%20Components/IFrame/index.md) UI component that is used to embed the draw\.io website into a modal window:

  ``` ts
  export const frameProps: IFrame = {
    width: "100%",
    height: "100%",
    name: "test-drawio",
    src: "",
  }
  ```

  Create the [IBox](../../Coding%20Plugin/Plugin%20Components/Box/index.md) container to add the iframe to it:

  ``` ts
  const body: IBox = {
    widthProp: "100%",
    heightProp: "100%",

    children: [
      {
        component: Components.iFrame,
        props: frameProps,
      },
    ],
  }
  ```

  Configure the [modal window](../../Coding%20Plugin/Plugin%20Components/ModalDialog/index.md) properties:

  ``` ts
  export const drawIoModalDialogProps: IModalDialog = {
    dialogHeader: "",
    dialogBody: body,
    displayType: ModalDisplayType.modal,
    fullScreen: true,
    onClose: () => {
      const message: IMessage = {
        actions: [Actions.closeModal],
      }
      return message
    },
    onLoad: async () => {
      return {
        newDialogHeader: drawIoModalDialogProps.dialogHeader || "",
        newDialogBody: drawIoModalDialogProps.dialogBody,
      }
    },
    autoMaxHeight: true,
    autoMaxWidth: true,
  }
  ```

- In the [Editor.ts](https://github.com/ONLYOFFICE/docspace-plugins/blob/master/draw.io/src/DrawIO/Editor.ts) file, configure the diagram editor. Create the *DiagramEditor* function with the following parameters:

  | Parameter      | Type    | Example                      | Description                                                       |
  | -------------- | ------- | ---------------------------- | ----------------------------------------------------------------- |
  | ui             | string  | "default"                    | Defines the editor's ui theme.                                    |
  | dark           | string  | "auto"                       | Defines the editor's dark theme.                                  |
  | off            | boolean | false                        | Specifies if the offline mode is active or not.                   |
  | lib            | boolean | false                        | Specifies if the libraries are enabled or not.                    |
  | lang           | string  | "auto"                       | Defines the editor's language.                                    |
  | url            | string  | `https://embed.diagrams.net` | Defines the URL to the editor.                                    |
  | showSaveButton | boolean | true                         | Specifies if the **Save** button will be displayed in the editor. |

  Then specify methods to work with diagrams:

  | Method           | Description                             |
  | ---------------- | --------------------------------------- |
  | startEditing     | Starts the editor with the given data.  |
  | getData          | Returns the diagram's data.             |
  | getTitle         | Returns the diagram's title.            |
  | getFormat        | Returns the diagram's format.           |
  | getFrameId       | Returns the editor's frame ID.          |
  | getFrameUrl      | Returns the URL to the iframe.          |
  | handleMessage    | Handles the given message.              |
  | initializeEditor | Posts the *load* message to the editor. |
  | save             | Saves the given data.                   |

  The full code for the *DiagramEditor* can be found [here](https://github.com/ONLYOFFICE/docspace-plugins/blob/master/draw.io/src/DrawIO/Editor.ts).

## Step 5. Create plugin types

Now that the default plugin is ready, you can start coding other plugin types.

Each plugin type has specific plugin items. Define the [context menu item](../../Coding%20Plugin/Plugin%20Items/ContextMenuItem/index.md) that will be displayed when you right-click on audio or video files:

``` ts
export const contextMenuItem: IContextMenuItem = {
  key: "speech-to-text-context-menu-item",
  label: "Convert to text",
  icon: "speech-to-text-16.png",
  onClick: assemblyAI.speechToText,
  fileType: [FilesType.video],
  withActiveItem: true,
}
```

<img alt="Context menu item" src="/assets/images/docspace/context-menu-item.png" width="400px">

You can add more plugin types. For example, the **draw\.io** plugin can be accessed from the main button menu, so we need to specify the [main button item](../../Coding%20Plugin/Plugin%20Items/MainButtonItem/index.md):

``` ts
const mainButtonItem: IMainButtonItem = {
  key: "draw-io-main-button-item",
  label: "Draw.io",
  icon: "drawio.png",
  onClick: (id: number) => {
    drawIo.setCurrentFolderId(id)

    const message: IMessage = {
      actions: [Actions.showCreateDialogModal],
      createDialogProps: {
        title: "Create diagram",
        startValue: "New diagram",
        visible: true,
        isCreateDialog: true,
        extension: ".drawio",
        onSave: async (e: any, value: string) => {
          await drawIo.createNewFile(value)
        },
        onCancel: (e: any) => {
          drawIo.setCurrentFolderId(null)
        },
        onClose: (e: any) => {
          drawIo.setCurrentFolderId(null)
        },
      },
    }
    return message
  },
  // items: [createItem],
}
```

When the main button item is clicked, the modal window appears where you can type the diagram's name and open an empty *.drawio* file.

![Create diagram](/assets/images/docspace/create-diagram.png)

For the **draw\.io** plugin, you also need to configure the file plugin type which works when the user opens the specific *.drawio* file:

1. Define the [file item](../../Coding%20Plugin/Plugin%20Items/FileItem/index.md) that is represented as a file with the specific extension (*.drawio*) and icon:

   ``` ts
   export const drawIoItem: IFileItem = {
     extension: ".drawio",
     fileTypeName: "Diagram",
     fileRowIcon: "drawio-32.svg",
     fileTileIcon: "drawio-32.svg",
     devices: [Devices.desktop],
     onClick,
   }
   ```

2. Define the *onClick* event which will execute the *editDiagram* method each time the *.drawio* file is opened:

   ``` ts
   const onClick = async (item: File) => {
     return await drawIo.editDiagram(item.id)
   }
   ```

   ![Drawio file](/assets/images/docspace/drawio-file.png)

## Step 6. Create the settings plugin type

Configure the settings plugin type to provide users with the administrator settings.

1. Create a container where the plugin settings will be placed:

   ``` ts
   const descriptionText: TextGroup = {
     component: Components.text,
     props: {
       text: "To generate API token visit https://www.assemblyai.com",
       color: "#A3A9AE",
       fontSize: "12px",
       fontWeight: 400,
       lineHeight: "16px",
     },
   }
   
   const descGroup: BoxGroup = {
     component: Components.box,
     props: {children: [descriptionText]},
   }
   
   const parentBox: IBox = {
     displayProp: "flex",
     flexDirection: "column",
     // marginProp: "16px 0 0 0",
     children: [tokenGroup, descGroup],
   }
   ```

   In the settings description, indicate that it is necessary to generate an API token in order to be able to work with the plugin.

2. Configure the administrator settings with the *ISettings* object:

   ``` ts
   const adminSettings: ISettings = {
     settings: parentBox,
     saveButton: userButtonComponent,
     onLoad: async () => {
       assemblyAI.fetchAPIToken()
   
       tokenInput.value = assemblyAI.apiToken
   
       if (!assemblyAI.apiToken) {
         return {
           settings: parentBox,
         }
       }

       plugin.setAdminPluginSettings(adminSettings)
   
       return {settings: parentBox}
     },
   }
   ```

   Specify the *onLoad* event which defines which plugin settings will be displayed when the settins block is loaded.

Each settings item is determined in separate files ([buttons](https://github.com/ONLYOFFICE/docspace-plugins/blob/master/speech-to-text/src/Settings/Button.ts), [token](https://github.com/ONLYOFFICE/docspace-plugins/blob/master/speech-to-text/src/Settings/Token.ts)).

<img alt="Speech settings" src="/assets/images/docspace/speech-settings.png" width="300px">

## Step 7. Create the main plugin code file

Create a file in the *src* folder with the main plugin code. This file is required.

Refer to the documentation of a third-party service to write this code.

Let's see how the [AssemblyAI.ts](https://github.com/ONLYOFFICE/docspace-plugins/blob/master/speech-to-text/src/AssemblyAI.ts) file is organized in detail:

1. Define the *AssemblyAI* class with all the necessary variables and methods:

   ### Variables and their description

   #### apiURL
   
   Defines the API URL.

   ``` ts
   apiURL = ""
   ```

   #### currentFileId
   
   Defines the current file ID.

   ``` ts
   const currentFileId: numbernull | number = null
   ```

   #### apiToken
   
   Defines the API token.

   ``` ts
   apiToken = ""
   ```

   ### Methods and their description

   #### createAPIUrl
   
   Creates the API URL.

   ``` ts
   createAPIUrl = () => {
     const api = plugin.getAPI()

     this.apiURL = api.origin.replace(/\/+$/, "")

     const params = [api.proxy, api.prefix]

     if (this.apiURL) {
       for (const part of params) {
         if (!part) {
           continue
         }
         const newPart = part.trim().replace(/^\/+/, "")
         if (newPart) {
           if (this.apiURL.length !== 0 && this.apiURL[this.apiURL.length - 1] === "/") {
             this.apiURL += newPart
           } else {
             this.apiURL += `/${newPart}`
           }
         }
       }
     }
   }
   ```

   #### setAPIUrl
   
   Sets the API URL.

   ``` ts
   setAPIUrl = (url: string) => {
     this.apiURL = url
   }
   ```

   #### getAPIUrl
   
   Retuns the API URL.

   ``` ts
   getAPIUrl = () => {
     return this.apiURL
   }
   ```

   #### setAPIToken
   
   Sets the API token.

   ``` ts
   setAPIToken = (apiToken: string) => {
     this.apiToken = apiToken
   }
   ```

   #### getAPIToken
   
   Returns the API token.

   ``` ts
   getAPIToken = () => {
     return this.apiToken
   }
   ```

   #### fetchAPIToken
   
   Fetches the API token.

   ``` ts
   fetchAPIToken = async () => {
     const apiToken = localStorage.getItem("speech-to-text-api-token")
  
     if (!apiToken) {
       return
     }

     this.setAPIToken(apiToken)
     plugin.updateStatus(PluginStatus.active)
   }
   ```

   #### saveAPIToken
   
   Saves the API token.

   ``` ts
   saveAPIToken = (apiToken: string) => {
     localStorage.setItem("speech-to-text-api-token", apiToken)
  
     let status
     if (apiToken) {
       status = PluginStatus.active
     } else {
       status = PluginStatus.hide
     }
     plugin.updateStatus(status)
   }
   ```

   #### setCurrentFileId
   
   Sets the ID to the current file.

   ``` ts
   setCurrentFileId = (id: number | null) => {
     this.currentFileId = id
   }
   ```

   #### uploadFile
   
   Uploads a file which will be transcribed.

   ``` ts
   uploadFile = async (apiToken: string, path: string, data: Blob) => {
     console.log(`Uploading file: ${path}`)
  
     const url = "https://api.assemblyai.com/v2/upload"
  
     try {
       const response = await fetch(url, {
         method: "POST",
         body: data,
         headers: {
           "Content-Type": "application/octet-stream",
           "Authorization": apiToken,
         },
       })
  
       if (response.status === 200) {
         const responseData = await response.json()
         return responseData["upload_url"]
       }
       console.error(`Error: ${response.status} - ${response.statusText}`)
       return null
     } catch (error) {
       console.error(`Error: ${error}`)
       return null
     }
   }
   ```

   #### transcribeAudio
   
   Transcribes the audio file.

   ``` ts
   transcribeAudio = async (apiToken: string, audioUrl: string) => {
     console.log("Transcribing audio... This might take a moment.")
  
     const headers = {
       "authorization": apiToken,
       "content-type": "application/json",
     }
     const response = await fetch("https://api.assemblyai.com/v2/transcript", {
       method: "POST",
       body: JSON.stringify({audioUrl}),
       headers,
     })
  
     const responseData = await response.json()
     const transcriptId = responseData.id
  
     const pollingEndpoint = `https://api.assemblyai.com/v2/transcript/${transcriptId}`
  
     while (true) {
       const pollingResponse = await fetch(pollingEndpoint, {headers})
       const transcriptionResult = await pollingResponse.json()
  
       if (transcriptionResult.status === "completed") {
         return transcriptionResult
       } else if (transcriptionResult.status === "error") {
         throw new Error(`Transcription failed: ${transcriptionResult.error}`)
       } else {
         await new Promise((resolve) => {
           setTimeout(resolve, 3000)
         })
       }
     }
   }
   ```

   #### speechToText
   
   Implements the plugin work.

   ``` ts
   speechToText = async (id: number) => {
     if (!this.apiToken) {
       return
     }

     this.setCurrentFileId(null)
  
     if (!this.apiURL) {
       this.createAPIUrl()
     }

     const response = await fetch(`${this.apiURL}/files/file/${id}`)
     const data = await response.json()
     const {viewUrl, title, folderId, fileExst} = data.response
  
     const file = await fetch(viewUrl)
  
     const fileBlob = await file.blob()
  
     const uploadUrl = await this.uploadFile(this.apiToken, viewUrl, fileBlob)
  
     const transcript = await this.transcribeAudio(this.apiToken, uploadUrl)
  
     const blob = new Blob([transcript.text], {
       type: "text/plain;charset=UTF-8",
     })
  
     const newFile = new File([blob], "blob", {
       type: "",
       lastModified: Date.now(),
     })
  
     const formData = new FormData()
     formData.append("file", newFile)
  
     const newTitle = `${title.replaceAll(fileExst, "")} text`
  
     try {
       const sessionRes = await fetch(
         `${this.apiURL}/files/${folderId}/upload/create_session`,
         {
           method: "POST",
           headers: {
             "Content-Type": "application/json;charset=utf-8",
           },
           body: JSON.stringify({
             createOn: new Date(),
             fileName: `${newTitle}.txt`,
             fileSize: newFile.size,
             relativePath: "",
           }),
         },
       )
       const response = await sessionRes.json()
       const sessionData = response.response.data
  
       const data = await fetch(`${sessionData.location}`, {
         method: "POST",
         body: formData,
       })

       const jsonData = await data.json()
       const {id: fileId} = jsonData.data
  
       return fileId
     } catch (e) {
       console.log(e)
     }

     return {
       actions: [Actions.showToast],
       toastProps: [{type: ToastType.success, title: ""}],
     } as IMessage
   }
   ```

2. Declare the *AssemblyAI* class instance:

   ``` ts
   const assemblyAI = new AssemblyAI()
   ```

3. Export the created plugin instance:

   ``` ts
   export default assemblyAI
   ```
