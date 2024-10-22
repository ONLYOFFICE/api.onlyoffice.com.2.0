---
order: -4
---

The *config.json* file is generated based on the data from the *package.json* file.

## author

The plugin author.

Type: string

Example: "ONLYOFFICE"

## cspDomains

The list of all third-party resources that are used in the plugin.

Type: array of strings

Example: `[https://embed.diagrams.net/, https://*.diagrams.net/]`

## description

The description, i.e. what describes your plugin in the best way.

Type: string

Example: "plugin description"

## homePage

The plugin homepage. For example, it can be the plugin GitHub repository.

Type: string

Example: `https://example.com/url-to-plugin-repository`

## image

The name of the logo image. It is equal to the *logo* parameter from the *package.json* file. The required icon size is 48x48 px. Otherwise, it will be compressed to this size.

Type: string

Example: "logo.png"

## license

The plugin license.

Type: string

Example: "MIT"

## name

The plugin name.

Type: string

Example: "plugin name"

## pluginName

The name by which the plugin is registered in the *window* object. It must match the plugin name from the *plugin.js* file.

Type: string

Example: "plugin name"

## scopes

The plugin scopes which are converted from an array into a string.

Type: string

Example: "ContextMenu,InfoPanel,MainButton"

## version

The current plugin version.

Type: string

Example: "1.0.0"

## Example

``` ts
const config = {
  author: "ONLYOFFICE",
  cspDomains: [
    "https://embed.diagrams.net/",
    "https://*.diagrams.net/",
  ],
  description: "plugin description",
  homePage: "https://example.com/url-to-plugin-repository",
  image: "logo.png",
  license: "MIT",
  name: "plugin name",
  pluginName: "plugin name",
  scopes: "ContextMenu,InfoPanel,MainButton",
  version: "1.0.0",
}
```
