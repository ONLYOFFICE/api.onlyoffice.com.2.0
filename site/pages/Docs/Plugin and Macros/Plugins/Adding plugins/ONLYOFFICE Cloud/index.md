---
order: -1
---

You can add a plugin to the **Cloud service** as an **extension**. It can be done for Google Chrome, Opera, or Microsoft Edge browsers.

## Step 1. Creating extensions

1. To create an extension, you need an account on [GitHub](https://github.com/). Sing in to an existing account or create a new one.

2. Fork the plugin marketplace repository: <https://github.com/ONLYOFFICE/onlyoffice.github.io>.

   You get a repository with the following address - `https://github.com/YOUR-USERNAME/ONLYOFFICE/onlyoffice.github.io`.

3. Build your own GitHub Pages site from this repository. Explore the official [GitHub documentation](https://docs.github.com/en/pages/quickstart) to learn how to do it.

4. Clone the fork to your local computer.

5. Add the plugin folder to *onlyoffice.github.io/sdkjs-plugins/content/* and push it to the remote repository.

   ![New folder](/assets/images/plugins/new-folder.png)

6. Open the *onlyoffice.github.io/store/plugin-dev/extension/inject.js* file and assign the path to your plugin on GitHub Pages site to the **URL\_TO\_PLUGIN** variable:

   ``` ts
   const URL_TO_PLUGIN = "https://YOUR-USERNAME.github.io/onlyoffice.github.io/sdkjs-plugins/content/helloworld/"
   ```

The *onlyoffice.github.io/store/plugin-dev/extension* folder is a new extension.

> Please note that when adding an extension to [ONLYOFFICE App Directory](https://www.onlyoffice.com/en/app-directory), the **Title** and **Summary** are filled in automatically with the **name** and **description** parameters from the *manifest.json* file. You cannot change them later in the store.

## Step 2. Uploading extensions to the browser

After your extension is ready, upload it to the browser. Follow the instructions below for the browser you use.

### Installing extensions to Google Chrome

1. Launch your Chrome browser and go to *chrome://extensions/*.

2. Turn on the **Developer mode** and click the **Load unpacked** button:

   ![Chrome developer mode](/assets/images/plugins/chrome-developer-mode.png)

3. Select the created main extension folder:

   ![Chrome extension folder](/assets/images/plugins/chrome-extension-folder.png)

4. The new extension is now available in your browser:

   ![Chrome extension](/assets/images/plugins/chrome-extension.png)

5. Launch ONLYOFFICE Cloud and open any document to check if the new plugin is available in the editors:

   ![Hello world icon](/assets/images/plugins/helloworld_icon.png)

#### Removing extensions from Google Chrome

Click the **Remove** button on the extension tab and, in the opened window, confirm your action:

![Chrome removing extension](/assets/images/plugins/chrome-removing-extension.png)

The plugin will be removed from ONLYOFFICE Cloud after page reload.

### Installing extensions to Opera

1. Launch your Opera browser.

2. Click the extensions icon in the top right corner of the browser window and, in the opened **Extensions** window, click **Manage extensions**:

   ![Opera extensions](/assets/images/plugins/opera-extensions.png)

3. Turn on the **Developer mode** and click the **Load unpacked** button:

   ![Opera develoer mode](/assets/images/plugins/opera-developer-mode.png)

4. Select the created main extension folder:

   ![Opera extension folder](/assets/images/plugins/opera-extension-folder.png)

5. The new extension is now available in your browser:

   ![Opera extension](/assets/images/plugins/opera-extension.png)

6. Launch ONLYOFFICE Cloud and open any document to check if the new plugin is available in the editors:

   ![Hello world icon](/assets/images/plugins/helloworld_icon.png)

#### Removing plugins from Opera

To remove the plugin from the **Plugins** tab in ONLYOFFICE editors, click the **Disable** button on the extension tab or turn off the switcher. You can enable the extension again at any time.

![Opera disabling extension](/assets/images/plugins/opera-disabling-extension.png)

To remove the extension completely from the Opera browser:

1. Click the **Remove** button on the extension tab.

2. In the opened window confirm your action:

   ![Opera removing extension](/assets/images/plugins/opera-removing-extension.png)

The plugin will be removed from ONLYOFFICE Cloud after page reload.

### Installing extensions to Microsoft Edge

1. Launch your Microsoft Edge browser and go to *edge://extensions/*.

2. Go to the **Extensions** tab, turn on the **Developer mode** and click the **Load unpacked** button:

   ![Edge developer mode](/assets/images/plugins/edge-developer-mode.png)

3. Select the created main extension folder:

   ![Edge extension folder](/assets/images/plugins/edge-extension-folder.png)

4. The new extension is now available in your browser:

   ![Edge extension](/assets/images/plugins/edge-extension.png)

5. Launch ONLYOFFICE Cloud and open any document to check if the new plugin is available in the editors:

   ![Hello world icon](/assets/images/plugins/helloworld_icon.png)

#### Removing plugins from Microsoft Edge

To remove the plugin from the **Plugins** tab in ONLYOFFICE editors, disable it by turning off the switcher. You can enable the extension again at any time.

To remove the extension completely from the Microsoft Edge browser, click the **Remove** button on the extension tab and, in the opened window, confirm your action:

![Edge removing extension](/assets/images/plugins/edge-removing-extension.png)

The plugin will be removed from ONLYOFFICE Cloud after page reload.
