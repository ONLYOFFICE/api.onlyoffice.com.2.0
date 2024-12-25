---
order: -3
---

Plugin icon image files that are specified in the [config.json](../Manifest/index.md#variationsicons) file as the URL to the icon. This URL allows you to set the rules for theme (name, type), state (normal, hover, active), and scaling in the following format:

``` ini
%parameter_name%(option1|options2|...)
```

For example:

``` ini
"resources/%theme-name%(classic|dark)/%theme-type%(light|dark)/icon%state%(normal|hover)%scale%(default|*).%extension%(png|svg)"
```

The following parameters are available:

## theme-name

The theme name (*classic*, *dark*, etc.)

Type: string

Example: "classic"

## theme-type

The theme type of the plugin icons. It can have the *light* or *dark* values.

Type: string

Example: "light"

## state

The icon state. The following values are available: *normal*, *hover*, *active*.
When this parameter is equal to *normal*, it will be changed with an empty string in the resulting URL. The *hover* and *active* values will be changed *with _hover* and *_active*.

Type: string

Example: "normal"

## scale

All the supported scaling types for the plugin icons. The default value means the same as *100|125|150|175|200*. The *\** value means all other scales.

The document editor chooses the necessary icons in the following way:

1. get the information about the current scaling and find an icon for it;
2. if there is no such an icon in the *config*, take the one which is the closest to the required size and round it up (150% instead of 140%).

Type: string

Example: "default"

## extension

The icon extension. If there is the *svg* extension in the options, it will be used for all unspecified scales and for the *\** value. For the specified extensions, the last of all the listed "non-svg" extensions will be used. If there are no other extensions in the options, then the *svg* extension will be used as well.

Type: string

Example: "svg"

> Please note that all parameters are optional. You can use just the path to the icon. For example, *"resources/icon.svg"*.

This string generates the objects in the old icon format (the [icon2](../Manifest/index.md#variationsicons2) parameter):

``` ts
[
  {
    "theme": "classic",
    "style": "light",
    "100%": {normal: "resources/classic/light/icon.png", hover: "resources/classic/light/icon_hover.png"},
    "125%": {normal: "resources/classic/light/icon@1.25x.png", hover: "resources/classic/light/icon_hover@1.25x.png"},
    "150%": {normal: "resources/classic/light/icon@1.5x.png", hover: "resources/classic/light/icon_hover@1.5x.png"},
    "175%": {normal: "resources/classic/light/icon@1.75x.png", hover: "resources/classic/light/icon_hover@1.75x.png"},
    "200%": {normal: "resources/classic/light/icon@2x.png", hover: "resources/classic/light/icon_hover@2x.png"},
    "*": {normal: "resources/classic/light/icon.svg", hover: "resources/classic/light/icon_hover.svg"},
  },
  {
    "theme": "classic",
    "style": "dark",
    "100%": {normal: "resources/classic/dark/icon.png", hover: "resources/classic/dark/icon_hover.png"},
    "125%": {normal: "resources/classic/dark/icon@1.25x.png", hover: "resources/classic/dark/icon_hover@1.25x.png"},
    "150%": {normal: "resources/classic/dark/icon@1.5x.png", hover: "resources/classic/dark/icon_hover@1.5x.png"},
    "175%": {normal: "resources/classic/dark/icon@1.75x.png", hover: "resources/classic/dark/icon_hover@1.75x.png"},
    "200%": {normal: "resources/classic/dark/icon@2x.png", hover: "resources/classic/dark/icon_hover@2x.png"},
    "*": {normal: "resources/classic/dark/icon.svg", hover: "resources/classic/dark/icon_hover.svg"},
  },
  {
    "theme": "dark",
    "style": "light",
    "100%": {normal: "resources/dark/light/icon.png", hover: "resources/dark/light/icon_hover.png"},
    "125%": {normal: "resources/dark/light/icon@1.25x.png", hover: "resources/dark/light/icon_hover@1.25x.png"},
    "150%": {normal: "resources/dark/light/icon@1.5x.png", hover: "resources/dark/light/icon_hover@1.5x.png"},
    "175%": {normal: "resources/dark/light/icon@1.75x.png", hover: "resources/dark/light/icon_hover@1.75x.png"},
    "200%": {normal: "resources/dark/light/icon@2x.png", hover: "resources/dark/light/icon_hover@2x.png"},
    "*": {normal: "resources/dark/light/icon.svg", hover: "resources/dark/light/icon_hover.svg"},
  },
  {
    "theme": "dark",
    "style": "dark",
    "100%": {normal: "resources/dark/dark/icon.png", hover: "resources/dark/dark/icon_hover.png"},
    "125%": {normal: "resources/dark/dark/icon@1.25x.png", hover: "resources/dark/dark/icon_hover@1.25x.png"},
    "150%": {normal: "resources/dark/dark/icon@1.5x.png", hover: "resources/dark/dark/icon_hover@1.5x.png"},
    "175%": {normal: "resources/dark/dark/icon@1.75x.png", hover: "resources/dark/dark/icon_hover@1.75x.png"},
    "200%": {normal: "resources/dark/dark/icon@2x.png", hover: "resources/dark/dark/icon_hover@2x.png"},
    "*": {normal: "resources/dark/dark/icon.svg", hover: "resources/dark/dark/icon_hover.svg"},
  },
]
```

This format can still be used, but it is deprecated.
