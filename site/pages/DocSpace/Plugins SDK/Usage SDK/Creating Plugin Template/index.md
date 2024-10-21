---
order: -8
---

Before starting plugin development, create a plugin template and configure its settings which will be displayed in the DocSpace plugin settings.

1. Install the *@onlyoffice/docspace-plugin-sdk* npm package globally:

   ``` sh
   npm i -g @onlyoffice/docspace-plugin-sdk
   ```

   Now, the **npx** command is available, which will be used to create a plugin.

2. To create a plugin template, run the following command:

   ``` sh
   npx create-docspace-plugin
   ```

3. Configure the plugin in the terminal specifying the following settings in the dialog:

   | Parameter              | Description                                                                                                                                                                                                                                                                       |
   | ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   | Name                   | A folder with this name will be created for deploying the plugin. This field is required.                                                                                                                                                                                         |
   | Version                | The current plugin version will be displayed in the DocSpace plugin settings. When the page is reloaded, the plugin will be updated to match this version. If the portal already has the plugin of the current version uploaded, no action will occur.                            |
   | Author                 | The plugin author that will be displayed in the DocSpace plugin settings.                                                                                                                                                                                                         |
   | Name of the logo image | The name of the plugin logo image that must be uploaded to the *assets* folder. There is no need to specify the path to this file. The logo will be displayed in the DocSpace plugin settings. The required icon size is 48x48 px. Otherwise, it will be compressed to this size. |
   | Description            | The plugin description that will be displayed in the DocSpace plugin settings.                                                                                                                                                                                                    |
   | License                | The plugin license.                                                                                                                                                                                                                                                               |
   | Homepage               | The plugin homepage. For example, it can be the plugin GitHub repository. This information will be displayed in the DocSpace plugin settings.                                                                                                                                     |

4. Select the plugin scopes from the list by pressing *Space* on the necessary scopes:

   - **API** - the plugin will be provided with the origin, proxy and prefix to make requests to the portal server.
   - **Settings** - the plugin will be able to manage settings for the administrator or owner.
   - **Context menu** - the plugin can be embedded in the context menu of files, folders, rooms, images, video (audio).
   - **Info panel** - the plugin can be embedded as a separate tab in the file info panel.
   - **Main button** - the plugin can be embedded in the main button.
   - **Profile menu** - the plugin can be embedded in the profile menu.
   - **Event listener** - the plugin will be given the access to the portal events.
   - **File** - the plugin will be able to interact with the file list, change the file type and image.

![Creating template](/assets/images/docspace/creating-template.png)

All the specified parameters can be changed later in the *package.json* file.

In the *package.json* file, you can also specify the addresses of the third-party websites to add them to the CSP header and prevent these addresses from being blocked.

You can create a plugin in any project by adding the *@onlyoffice/docspace-plugin-sdk* npm package as the dependency and specifying all the necessary fields in the *package.json* file.

## Example

``` json
{
  "name": "PDF-converter",
  "version": "1.0.0",
  "author": "ONLYOFFICE",
  "scopes": [
    "API",
    "Settings",
    "ContextMenu"
  ],
  "description": "Sample description",
  "pluginName": "PDFConverter",
  "license": "MIT",
  "logo": "logo.png",
  "homepage": "https://github.com/ONLYOFFICE/docspace-plugins/tree/master/pdf-converter",
  "cspDomains": [
    "https://embed.diagrams.net/",
    "https://*.diagrams.net/"
  ]
}
```
