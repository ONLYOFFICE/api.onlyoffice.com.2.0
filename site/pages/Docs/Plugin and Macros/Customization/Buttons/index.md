---
order: -1
---

To process [buttons](../../Structure/Manifest/index.md#variationsbuttons) which are specified in the plugin variations (not in the modal windows / panels), use the **button** method. This function is called when any of the plugin buttons is clicked.

## Parameters

| Name       | Type   | Description                                                                                                                                                                                                                                                                     |
| ---------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| *id*       | number | Defines the button index in the [buttons](../../Structure/Manifest/index.md#variationsbuttons) array of the *config.json* file. If *id == -1*, then the plugin considers that the **Close** window cross button has been clicked or its operation has been somehow interrupted. |
| *windowId* | number | Defines an index of the button from the modal window.                                                                                                                                                                                                                           |

## Example

``` ts
Asc.plugin.button = (id, windowId) => {
  if (!windowId) {
    return
  }

  if (windowId === newWindow.id) {
    console.log("Plugin button")
  }
}
```
