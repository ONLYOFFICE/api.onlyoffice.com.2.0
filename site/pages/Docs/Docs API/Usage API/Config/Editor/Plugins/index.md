The plugins section allows to connect the special add-ons to your ONLYOFFICE Docs installation which will help you add additional features to document editors.

## autostart

Defines the array of the identifiers (as entered in [config.json](../../../../../Plugin%20and%20Macros/Usage%20API/Config/index.md#guid)) for the plugins, which will automatically start when the editor opens, and the order the plugins will run one-by-one.

Type: array of string

Example: \["asc.{7327FC95-16DA-41D9-9AF2-0E7F449F6800}"]

## pluginsData

Defines the array of absolute URLs to the plugin configuration files ([config.json](../../../../../Plugin%20and%20Macros/Usage%20API/Config/index.md)).

Type: array of string

Example: `["https://example.com/plugins/chess-plugin/config.json"]`

## url

Defines the absolute URL to the directory where the plugins are stored. Deprecated since version 4.3, please use the absolute URLs in [pluginsData](#pluginsdata) field.

Type: string

Example: `https://example.com/plugins/`

![Plugins](/assets/images/editor/plugins.png)

## Example

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  editorConfig: {
    plugins: {
      autostart: [
        "asc.{7327FC95-16DA-41D9-9AF2-0E7F449F6800}",
      ],
      pluginsData: [
        "https://example.com/plugins/chess-plugin/config.json",
      ],
      url: "https://example.com/plugins/",
    },
  },
})
```

The **example.com** is the name of the server where **document manager** and **document storage service** are installed and the plugins are placed. See the [How it works](../../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.
