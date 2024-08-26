---
order: -2
---

Starting from version 8.1, you can get the viewport settings of the desktop editors. This method is used to set the space between the top panel and the Desktop Editors widget.

``` ts
window.AscDesktopEditor.getViewportSettings()
```

This method returns an object with the following parameters:

``` json
{ 
  "widgetType": "window",
  "captionHeight": 100
}
```

## widgetType

The widget type (*"window"* or *"tab"*).

Type: string

Example: "window"

## captionHeight

The caption height.

Type: integer

Example: 100

You can also subscribe to the *onViewportSettingsChanged* event which is called every time the viewport settings are changed:

``` ts
window.AscDesktopEditor.attachEvent("onViewportSettingsChanged", () => {
  console.log("The viewport settings have been changed.")
})
```
