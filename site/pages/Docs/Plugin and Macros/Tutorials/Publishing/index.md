---
order: -2
---

If you want your plugin to be available to other users in the ONLYOFFICE Plugin Marketplace, suggest it for publishing:

1. Sing in to an existing [GitHub](https://github.com/) account or create a new one.

2. Fork the plugin marketplace repository: <https://github.com/ONLYOFFICE/onlyoffice.github.io>.

   You get a repository with the following address - `https://github.com/YOUR-USERNAME/ONLYOFFICE/onlyoffice.github.io`.

3. Build your own GitHub Pages site from this repository to test your plugin in the web version later. Explore the official [GitHub documentation](https://docs.github.com/en/pages/quickstart) to learn how to do it.

4. Clone the fork to your local computer.

5. Add a folder for your plugin to *onlyoffice.github.io/sdkjs-plugins/content/*.

   ![New folder](/assets/images/plugins/new-folder.png)

6. Push the plugin folder to the remote repository. 

7. Create a [pull request](https://github.com/ONLYOFFICE/onlyoffice.github.io/pulls) from your fork to `https://github.com/ONLYOFFICE/onlyoffice.github.io`. You can use the **Submit your own plugin** button in the Plugin Manager window.

   ![Submit plugin](/assets/images/plugins/submit-plugin.png)
   
   If your plugin works properly, your pull request will be approved and the plugin will appear in the marketplace.

   You can discuss plugin development, request a feature, or report a bug by posting an issue in the [marketplace repository](https://github.com/ONLYOFFICE/onlyoffice.github.io/issues).
