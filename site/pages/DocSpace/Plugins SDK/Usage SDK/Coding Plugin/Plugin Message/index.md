---
order: -3
---

Each item which interacts with a user (onClick, onChange, onSelect, etc.) can return a message that is represented as the *IMessage* object with the following parameters:

## actions

Defines a collection of [events](../Events/index.md) that will be processed on the portal side. The specified actions will be performed depending on the set of values.

Type: array of [Actions](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/enums/Actions.ts)

Example: \[Actions.showToast, Actions.closeModal]

## newProps

Defines the properties that update the state of the items which interact with the users. This parameter is used only with [Actions.updateProps](../Events/index.md#updateprops).

Type: [IInput](../Plugin%20Components/Input/index.md), [ICheckbox](../Plugin%20Components/Checkbox/index.md), [IToggleButton](../Plugin%20Components/ToggleButton/index.md), [IButton](../Plugin%20Components/Button/index.md), [ITextArea](../Plugin%20Components/TextArea/index.md), [IComboBox](../Plugin%20Components/ComboBox/index.md)

Example: {IInput}

## toastProps

Defines the properties that display a toast notification after the user actions. This parameter is used only with [Actions.showToast](../Events/index.md#showtoast).

Type: array of [IToast](../Plugin%20Components/Toast/index.md)

Example: \[IToast]

## contextProps

Defines the properties that update the state of the parent or child item after the event was executed.

This parameter is used only with [Actions.updateContext](../Events/index.md#updatecontext) and works in the administator or owner settings block that is embedded in the modal window with the plugin description.

Type: array of objects

Example:

``` ts
[
  {
    name: "accept-button",
    props: {...acceptButtonProps, isDisabled: false},
  },
]
```

### contextProps.name

The item name.

Type: string

Example: "accept-button"

### contextProps.props

The new properties for the parent or child item.

Type: object

Example: {...acceptButtonProps, "isDisabled": false}

## createDialogProps

Defines the properties that display the default dialog box for creating a file/folder managed by the plugin. This parameter is used only with [Actions.showCreateDialogModal](../Events/index.md#showcreatedialogmodal).

Type: [ICreateDialog](../Plugin%20Components/CreateDialog/index.md)

Example: {ICreateDialog}

## modalDialogProps

Defines the properties that display the modal window. This parameter is used only with [Actions.showModal](../Events/index.md#showmodal).

Type: [IModalDialog](../Plugin%20Components/ModalDialog/index.md)

Example: {IModalDialog}

## postMessage

Defines the properties that are used to send a message to a frame. If the frame ID is not specified or the frame with such an ID does not exist, then nothing changes. This parameter is used only with [Actions.sendPostMessage](../Events/index.md#sendpostmessage).

Type: [IPostMessage](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/utils/index.ts)

Example: {IPostMessage}

## settings

Defines a parameter that is used to save and transfer the administrator or owner plugin settings to all the portal users. This parameter is used only with [Actions.saveSettings](../Events/index.md#savesettings).

Type: string

Example: "{settings}"

## Example

``` ts
import {Actions, type IMessage, ToastType} from "@onlyoffice/docspace-plugin-sdk"

const message: IMessage = {
  actions: [Actions.showToast, Actions.closeModal],
  toastProps: [
    {
      type: ToastType.success,
      title: toastTitle,
    },
  ],
}
```
