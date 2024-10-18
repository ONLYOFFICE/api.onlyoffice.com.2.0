---
order: -2
---

Plugins can create its own window that appears and disappears when you type text. Its location is tied to the cursor.

![Input helper](/assets/images/plugins/input-helper.png)

## Creating an input helper

To create an input helper, use the **createInputHelper** method.

Parameters: This method doesn't have any parameters.

Returns: This method doesn't return any data.

Example:

``` ts
window.Asc.plugin.init = (text) => {
  if (!window.isInit) {
    window.isInit = true
    window.Asc.plugin.currentContentControl = null
    window.Asc.plugin.createInputHelper()
    window.Asc.plugin.getInputHelper().createWindow()
  }
}
```

## Getting an input helper

To get the [InputHelper object](#inputhelper), use the **getInputHelper** method.

Parameters: This method doesn't have any parameters.

Returns: Type [InputHelper](#inputhelper)

Example:

``` ts
window.Asc.plugin.init = (text) => {
  if (!window.isInit) {
    window.isInit = true
    window.Asc.plugin.currentContentControl = null
    window.Asc.plugin.createInputHelper()
    window.Asc.plugin.getInputHelper().createWindow()
  }
}
```

## Showing an input helper

To show an input helper, use the **ShowInputHelper** method  of *window.Asc.plugin.executeMethod*.

Parameters:

| Name             | Type    | Description                                                                                |
| ---------------- | ------- | ------------------------------------------------------------------------------------------ |
| *guid*           | string  | A string value which specifies a plugin identifier which must be of the *asc.{UUID}* type. |
| *w*              | number  | A number which specifies the window width measured in millimeters.                         |
| *h*              | number  | A number which specifies the window height measured in millimeters.                        |
| *isKeyboardTake* | boolean | Defines if the keyboard is caught (**true**) or not (**false**).                           |

Returns: This method doesn't return any data.

Example:

``` ts
window.Asc.plugin.executeMethod("ShowInputHelper", ["asc.{UUID}", 70, 70, true])
```

## Unshowing an input helper

To unshow an input helper, use the **UnShowInputHelper** method of *window.Asc.plugin.executeMethod*.

Parameters:

| Name      | Type   | Description                                                                                |
| --------- | ------ | ------------------------------------------------------------------------------------------ |
| *guid*    | string | A string value which specifies a plugin identifier which must be of the *asc.{UUID}* type. |
| *isclear* | string | Defines if the input context will be cleared (**true**) or not (**false**).                |

Returns: This method doesn't return any data.

Example:

``` ts
window.Asc.plugin.executeMethod("UnShowInputHelper", ["asc.{UUID}", true])
```

## InputHelper

Class representing an input helper.

### Methods

#### createWindow

Creates an input helper window.

Parameters: This method doesn't have any parameters.

Returns: This method doesn't return any data.

Example:

``` ts
window.Asc.plugin.init = (text) => {
  if (!window.isInit) {
    window.isInit = true
    window.Asc.plugin.currentText = ""
    window.Asc.plugin.createInputHelper()
    window.Asc.plugin.getInputHelper().createWindow()
  }
}
```

#### getItems

Returns an array of the [InputHelperItem](#inputhelperitem) objects that contain all the items from the input helper.

Parameters: This method doesn't have any parameters.

Returns: Type Array.<[InputHelperItem](#inputhelperitem)>

Example:

``` ts
function getInputHelperSize() {
  const size = window.Asc.plugin.getInputHelper().getScrollSizes()
  let width = 150
  let height = size.h
  const inputHelper = window.Asc.plugin.getInputHelper()
  const heightMin = inputHelper.getItemsHeight(Math.min(5, inputHelper.getItems().length))
  if (width > 400) {
    width = 400
  }
  if (height > heightMin) {
    height = heightMin
    width += 30
    return {w: width, h: height}
  }
}
```

#### getScrollSizes

Returns the sizes of the input helper scrolled window. Returns an object with width and height parameters.

Parameters: This method doesn't have any parameters.

Returns: Type number

Example:

``` ts
function getInputHelperSize() {
  const size = window.Asc.plugin.getInputHelper().getScrollSizes()
  let width = 200
  let height = size.h
  const inputHelper = window.Asc.plugin.getInputHelper()
  const heightMin = inputHelper.getItemsHeight(Math.min(5, inputHelper.getItems().length))
  if (width > 400) {
    width = 400
  }
  if (height > heightMin) {
    height = heightMin
    width += 30
    return {w: width, h: height}
  }
}
```

#### setItems

Sets the items to the input helper.

Parameters:

| Name    | Type                                       | Description                                                                                                           |
| ------- | ------------------------------------------ | --------------------------------------------------------------------------------------------------------------------- |
| *items* | Array.<[InputHelperItem](#inputhelperitem) | Defines an array of the [InputHelperItem](#inputhelperitem) objects which contain all the items for the input helper. |

Returns: This method doesn't return any data.

Example:

``` ts
{
  const items = [
    {text: "Name1.Family1", id: "0"},
    {text: "Name2.Family2", id: "1"},
    {text: "Name3.Family3", id: "2"},
    {text: "Name4.Family4", id: "3"},
    {text: "Name5.Family5", id: "4"},
    {text: "Name6.Family6", id: "5"},
    {text: "Name7.Family7", id: "6"},
    {text: "Name8.Family8", id: "7"},
    {text: "Name9.Family9", id: "8"},
    {text: "Name10.Family10", id: "9"},
    {text: "Name11.Family11", id: "10"},
    {text: "Name12.Family12", id: "11"},
    {text: "Name13.Family13", id: "12"},
  ]
  window.Asc.plugin.getInputHelper().setItems(items)
  const sizes = getInputHelperSize()
  window.Asc.plugin.getInputHelper().show(_sizes.w, _sizes.h, true)
}
```

#### show

Shows an input helper.

Parameters:

| Name                | Type    | Description                                              |
| ------------------- | ------- | -------------------------------------------------------- |
| *width*             | number  | The input helper window width measured in millimeters.   |
| *height*            | number  | The input helper window height measured in millimeters.  |
| *isCaptureKeyboard* | boolean | Defines if the keyboard is caught (true) or not (false). |

Returns: This method doesn't return any data.

Example:

``` ts
{
  const items = [
    {text: "Name1.Family1", id: "0"},
    {text: "Name2.Family2", id: "1"},
    {text: "Name3.Family3", id: "2"},
    {text: "Name4.Family4", id: "3"},
    {text: "Name5.Family5", id: "4"},
    {text: "Name6.Family6", id: "5"},
    {text: "Name7.Family7", id: "6"},
    {text: "Name8.Family8", id: "7"},
    {text: "Name9.Family9", id: "8"},
    {text: "Name10.Family10", id: "9"},
    {text: "Name11.Family11", id: "10"},
    {text: "Name12.Family12", id: "11"},
    {text: "Name13.Family13", id: "12"},
  ]
  window.Asc.plugin.getInputHelper().setItems(items)
  const sizes = getInputHelperSize()
  window.Asc.plugin.getInputHelper().show(_sizes.w, _sizes.h, true)
}
```

#### unShow

Hides an input helper.

Parameters: This method doesn't have any parameters.

Returns: This method doesn't return any data.

Example:

``` ts
window.Asc.plugin.executeMethod("SelectContentControl", [window.Asc.plugin.currentContentControl.InternalId], () => {
  window.Asc.plugin.executeMethod("InputText", [item.text])
  window.Asc.plugin.getInputHelper().unShow()
})
```

## InputHelperItem

Defines the input helper item.

Type: object

Properties:

| Name   | Type   | Description     |
| ------ | ------ | --------------- |
| *id*   | string | The item index. |
| *text* | string | The item text.  |

Example:

``` ts
const items = [
  {text: "Name1.Family1", id: "0"},
  {text: "Name2.Family2", id: "1"},
  {text: "Name3.Family3", id: "2"},
  {text: "Name4.Family4", id: "3"},
  {text: "Name5.Family5", id: "4"},
  {text: "Name6.Family6", id: "5"},
  {text: "Name7.Family7", id: "6"},
  {text: "Name8.Family8", id: "7"},
  {text: "Name9.Family9", id: "8"},
  {text: "Name10.Family10", id: "9"},
  {text: "Name11.Family11", id: "10"},
  {text: "Name12.Family12", id: "11"},
  {text: "Name13.Family13", id: "12"},
]
window.Asc.plugin.getInputHelper().setItems(items)
const sizes = getInputHelperSize()
window.Asc.plugin.getInputHelper().show(_sizes.w, _sizes.h, true)
```
