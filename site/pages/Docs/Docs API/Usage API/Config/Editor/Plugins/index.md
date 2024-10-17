The plugins section allows to connect the special add-ons to your ONLYOFFICE Docs installation which will help you add additional features to document editors.

## autostart

Defines the array of the identifiers (as entered in [config.json](../../../../../Plugin%20and%20Macros/Structure/Manifest/index.md#guid)) for the plugins, which will automatically start when the editor opens, and the order the plugins will run one-by-one.

Type: array of string

Example: \["asc.{7327FC95-16DA-41D9-9AF2-0E7F449F6800}"]

## options

Defines an object which allows configuring plugins from an external source. The settings can be set for all plugins or for a specific plugin. For example, this object can be used to pass an authorization token to the plugin. You can also use the **SetPluginsOptions** method of the [Automation API](../../../Automation%20API/index.md) to pass the *options* object to the plugin.

Type: object

Example:

``` json
{
  "all": {},
  "pluginGuid": {}
}
```

### options.all

Defines the parameters which will be set for all plugins.

Type: object

Example:

``` json
{
  "all": {
    "keyAll": "valueAll"
  }
}
```

### options.pluginGuid

Defines the parameters which will be set for a specific plugin. The plugin must be specified with the plugin GUID of the *asc.{UUID}* type.

Type: object

Example:

``` json
{
  "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}": {
    "keyYoutube": "valueYoutube"
  }
}
```

## pluginsData

Defines the array of absolute URLs to the plugin configuration files ([config.json](../../../../../Plugin%20and%20Macros/Structure/Manifest/index.md)).

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
      options: {
        "all": {
          keyAll: "valueAll",
        },
        "asc.{38E022EA-AD92-45FC-B22B-49DF39746DB4}": {
          keyYoutube: "valueYoutube",
        },
      },
      pluginsData: [
        "https://example.com/plugins/chess-plugin/config.json",
      ],
      url: "https://example.com/plugins/",
    },
  },
})
```

The **example.com** is the name of the server where **document manager** and **document storage service** are installed and the plugins are placed. See the [How it works](../../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.
