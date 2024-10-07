---
order: -6
---

Each DocSpace plugin is a folder with files. It must contain the following files required for the plugin to work:

- **assets** - a folder for storing plugin images. Nesting is not supported. The following formats are curretly supported: *.jpg, .jpeg, .png, .svg*.

- **dist** - a folder for storing the compiled plugin version.

- **scripts** - a folder for storing script files for building the plugin. The *createZip.js* script is added to this folder. The script is executed when building the plugin to automatically archive it and create the *config.json* file.

- **src** - a folder for the plugin source files.

- **src/index.ts** - the entry point for building the plugin. This file is required. All the necessary functionality is added to this file for the plugin to work in the specified scope. In this file, the plugin is declared in the *window\.Plugins.\[pluginName]* DocSpace scope, where *pluginName* must match the same parameter from the *package.json* file:

  ``` ts
  window.Plugins.PDFConverter = plugin || {}
  ```

- **webpack.config.js** - the webpack configuration file. This file can be edited but this is important that in the *output* parameter, the *fileName* field is equal to *plugin.js* and the *path* field is equal to *dist*:

  ``` ts
  const config = {
    output: {
      filename: "plugin.js",
      path: path.resolve(dirname, "dist"),
    },
  }
  
  ```

- **tsconfig** - the *typescript* configuration file. This file can be edited.

- **package.json** - a file with the information about the plugin and dependencies. This file can be edited and the new dependencies can be added.

- **.prettierrc** - the configuration file for the *prettier* npm package. This file can be edited.
