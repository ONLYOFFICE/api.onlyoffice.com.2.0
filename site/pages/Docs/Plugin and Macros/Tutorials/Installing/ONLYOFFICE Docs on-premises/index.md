---
order: -2
---

<iframe src="https://www.youtube.com/embed/R7gvhLvGL44?wmode=transparent" class="video-frame" width="700px" height="400px" frameborder="0" allowfullscreen></iframe>

There are three ways to add plugins: through the *sdkjs-plugins* folder, through the *config.json* file or through the plugin manager.

## Adding plugins through the sdkjs-plugins folder

Put the folder with the plugin code to the **ONLYOFFICE Docs** folder. The path to the folder depends on the operating system you use:

- For Linux - */var/www/onlyoffice/documentserver/sdkjs-plugins/*
- For Windows - *%ProgramFiles%\ONLYOFFICE\DocumentServer\sdkjs-plugins\\*

The plugins will be available to all the users of **ONLYOFFICE Docs on-premises**. [In some cases](https://nodejs.org/docs/latest/api/fs.html#fs_availability), service restart is required.

For debugging, start ONLYOFFICE Docs together with the shared *sdkjs-plugins* folder:

``` sh
docker run -itd -p 80:80 -v /absolutly_path_to_work_dir:/var/www/onlyoffice/documentserver/sdkjs-plugins/plugin onlyoffice/documentserver-ee:latest
```

## Adding plugins through the config.json file

In [ONLYOFFICE Docs config](../../../../Docs%20API/Usage%20API/Config/Editor/Plugins/index.md), add the relative path to the *config.json* file of the created plugin to the *plugins.pluginsData* parameter:

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  editorConfig: {
    plugins: {
      autostart: [
        "asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}",
        "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
      ],
      pluginsData: [
        "https://example.com/plugin1/config.json",
        "https://example.com/plugin2/config.json",
      ],
    },
  },
})
```

where **example.com** is the name of the server where document manager and document storage service are installed and the plugins are placed. See the [How it works](../../../../Docs%20API/Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

`https://example.com/plugin1/config.json` is the path to the plugin.

If there is already a test example in the config, replace the following line */etc/onlyoffice/documentserver-example/local.json* with the path to the necessary plugin config.

See the [ONLYOFFICE Docs API](../../../../Docs%20API/Usage%20API/Config/Editor/Plugins/index.md) documentation for more information on where to find the config and what and how can be changed there.

### Known issues

- In the *index.html* file there is always a default link to the [plugins.js](https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.js) file. Don’t forget to add it to the plugin folder.
- If the plugins placed into the folder and the plugins specified in the config coincide, the latter will be used.
- If you want to upload the plugin to the S3 or Nginx servers, you need to allow cross-domain requests from the address of your document server. Or you can just let everyone use your plugin:

``` sh
add_header 'Access-Control-Allow-Origin' '*';
add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
```

## Adding plugins through the plugin manager

Starting from version 7.2, you can download ready-to-use plugins from **ONLYOFFICE Plugin Marketplace**.

Follow the steps below to add the plugins to the editor using plugin manager:

1. Open the **Plugins** tab.
2. Click **Plugin Manager**.
3. Find the plugin you need and click **Install**.

![Plugins manager](/assets/images/plugins/plugin-manager.png)

The plugin will be added to the opened editors and all the editors you will open afterwords and displayed within the **Plugins** tab.

Starting from version 7.4, the **pluginsmanager** utility can be used to manage the plugins in ONLYOFFICE Docs on-premises. The commands for installing, removing, restoring, updating, etc. are available. For example:

- For **Docker, DEB, and RPM**, the commands are as follows:

  ``` sh
  cd /var/www/onlyoffice/documentserver/server/tools/
  ./pluginsmanager --directory="/var/www/onlyoffice/documentserver/sdkjs-plugins" --install="zotero"
  ```

- For **Windows**, the commands are as follows:

  ``` sh
  cd C:\Program Files\ONLYOFFICE\DocumentServer\bin
  documentserver-pluginsmanager.bat --install="zotero"
  ```

The paths in the examples are default ones, please change them if necessary.

A full list of server commands can be found [here](https://helpcenter.onlyoffice.com/ONLYOFFICE-Editors/Editors-User-Guides/AllEditors/Plugin-manager.aspx#servercommands).

## Removing plugins from ONLYOFFICE Docs on-premises

You can uninstall plugins in four ways:

**Option 1.** Starting from version 7.4, you can use the **pluginsmanager** utility:

- For **Docker, DEB, and RPM**, the commands are as follows:

  ``` sh
  cd /var/www/onlyoffice/documentserver/server/tools/
  ./pluginsmanager --directory="/var/www/onlyoffice/documentserver/sdkjs-plugins" --remove="zotero"
  ```

- For **Windows**, the commands are as follows:

  ``` sh
  cd C:\Program Files\ONLYOFFICE\DocumentServer\bin
  documentserver-pluginsmanager.bat --remove="zotero"
  ```

The paths in the examples are default ones, please change them if necessary.

**Option 2.** Go to the *sdkjs-plugins* folder and remove the corresponding plugin folder from this directory.

The path to the folder depends on the operating system you use:

- For Linux - */var/www/onlyoffice/documentserver/sdkjs-plugins/*
- For Windows - *%ProgramFiles%\ONLYOFFICE\DocumentServer\sdkjs-plugins\\*

**Option 3.** Edit the [ONLYOFFICE Docs config](../../../../Docs%20API/Usage%20API/Config/Editor/Plugins/index.md) by removing the corresponding plugin. The plugin will become unavailable for all portal users upon the editor next start:

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  editorConfig: {
    plugins: {
      autostart: [
        "asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}",
        "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
      ],
      pluginsData: [
        "https://example.com/plugin1/config.json",
        "https://example.com/plugin2/config.json",
      ],
    },
  },
})
```

The plugins will be removed for all the users. [In some cases](https://nodejs.org/docs/latest/api/fs.html#fs_availability), service restart is required.

The table below contains default plugins guids to make it easier for you to find them:

## Default plugins guid’s

|                |                                        |
| -------------- | -------------------------------------- |
| Highlight code | {BE5CBF95-C0AD-4842-B157-AC40FEDD9841} |
| Mendeley       | {BE5CBF95-C0AD-4842-B157-AC40FEDD9441} |
| OCR            | {440EBF13-9B19-4BD8-8621-05200E58140B} |
| Photo editor   | {07FD8DFA-DFE0-4089-AL24-0730933CC80A} |
| Speech         | {D71C2EF0-F15B-47C7-80E9-86D671F9C595} |
| Thesaurus      | {BE5CBF95-C0AD-4842-B157-AC40FEDD9840} |
| Translator     | {7327FC95-16DA-41D9-9AF2-0E7F449F6800} |
| YouTube        | {38E022EA-AD92-45FC-B22B-49DF39746DB4} |
| Zotero         | {BFC5D5C6-89DE-4168-9565-ABD8D1E48711} |

> Please note that after app updating the default plugins will appear again and you will need to uninstall them.

**Option 4.** To uninstall the newly added plugin, proceed in the following way:

1. Open the **Plugins** tab.
2. Go to the **Plugin Manager**.
3. Click the **Remove** button under the corresponding plugin.
