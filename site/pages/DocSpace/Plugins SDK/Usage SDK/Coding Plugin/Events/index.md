---
order: -2
---

The events from the [Actions](../Plugin%20Message/index.md#actions) collection are processed on the portal side. The specified actions are performed depending on the set of values:

## updateProps

The function called when updating the state of the item which action was passed. It does not work if the [newProps](../Plugin%20Message/index.md#newprops) parameter is not passed to the message.

  ``` ts
  const message: IMessage = {
    newProps: {...acceptButton, isDisabled: true},
    actions: [Actions.showToast, Actions.updateStatus, Actions.updateProps],
    toastProps,
  }
  ```

## updateContext

The function called when updating the state of the the parent or child items which were passed. It does not work if the [contextProps](../Plugin%20Message/index.md#contextprops) parameter is not passed to the message.

  ``` ts
  const message: IMessage = {
    actions: [Actions.updateProps, Actions.updateContext],
    newProps: {...nameInputProps, value},
    contextProps: [
      {
        name: "accept-button",
        props: {
          ...acceptButtonProps,
          isDisabled: !value,
        },
      },
    ],
  }
  ```

## updateStatus

The function called when updating the plugin status.

  ``` ts
  const message: IMessage = {
    newProps: {...acceptButton, isDisabled: true},
    actions: [Actions.showToast, Actions.updateProps, Actions.updateStatus],
    toastProps,
  }
  ```

## updateContextMenuItems

The function called when updating all the context menu items.

  ``` ts
  const message: IMessage = {
    actions: [Actions.updateContextMenuItems],
  }
  ```

## updateInfoPanelItems

The function called when updating all the info panel items.

  ``` ts
  const message: IMessage = {
    actions: [Actions.updateInfoPanelItems],
  }
  ```

## updateMainButtonItems

The function called when updating all the main button menu items.

  ``` ts
  const message: IMessage = {
    actions: [Actions.updateMainButtonItems],
  }
  ```

## updateProfileMenuItems

The function called when updating all the profile menu items.

  ``` ts
  const message: IMessage = {
    actions: [Actions.updateProfileMenuItems],
  }
  ```

## updateFileItems

The function called when updating all the file items.

  ``` ts
  const message: IMessage = {
    actions: [Actions.updateFileItems],
  }
  ```

## updateEventListenerItems

The function called when updating all the event listener items.

  ``` ts
  const message: IMessage = {
    actions: [Actions.updateEventListenerItems],
  }
  ```

## showToast

The function called when displaying a toast notification after the user actions. It does not work if the [toastProps](../Plugin%20Message/index.md#toastprops) parameter is not passed to the message.

  ``` ts
  const message: IMessage = {
    newProps: {...acceptButton, isDisabled: true},
    actions: [Actions.showToast, Actions.updateProps, Actions.updateStatus],
    toastProps,
  }
  ```

## showCreateDialogModal

The function called when opening a modal window for creating certain item (file, folder, etc.). It does not work if the [createDialogProps](../Plugin%20Message/index.md#createdialogprops) parameter is not passed to the message.

  ``` ts
  const message: IMessage = {
    actions: [Actions.showCreateDialogModal],
    createDialogProps: {
      title: "Create diagram",
      startValue: "New diagram",
      visible: true,
      isCreateDialog: true,
      extension: ".drawio",
      onSave: async (e: any, value: string) => {
        await drawIo.createNewFile(value)
      },
      onCancel: (e: any) => {
        drawIo.setCurrentFolderId(null)
      },
      onClose: (e: any) => {
        drawIo.setCurrentFolderId(null)
      },
    },
  }
  ```

## showModal

The function called when opening a modal window. It does not work if the [modalDialogProps](../Plugin%20Message/index.md#modaldialogprops) parameter is not passed to the message.

  ``` ts
  const message: IMessage = {
    actions: [Actions.showModal],
    modalDialogProps: openFromUrlProps,
  }
  ```

## closeModal

The function called when closing a modal window.

  ``` ts
  const message: IMessage = {
    actions: [Actions.closeModal],
  }
  ```

## sendPostMessage

The function called when sending a message to a frame. It does not work if the [postMessage](../Plugin%20Message/index.md#postmessage) parameter is not passed to the message or the specified frame is not found.

  ``` ts
  const message: IMessage = {
    actions: [Actions.sendPostMessage],
    postMessage: {
      frameId: this.frameId,
      message: {
        action: "export",
        format: this.format,
        xml: msg.xml,
        spinKey: "export",
      },
    },
  }
  ```

## saveSettings

The function called when saving the data that was transferred in the [settings](../Plugin%20Message/index.md#settings) parameter and returning it in the [setAdminPluginSettingsValue](../Plugin%20Types/SettingsPlugin/index.md#setadminpluginsettingsvalue) method each time the plugin is requested. It functions only when the **Save** button is clicked in the **Settings** block.

  ``` ts
  const message: IMessage = {
    actions: [
      Actions.showToast,
      Actions.updateProps,
      Actions.updateStatus,
      Actions.saveSettings,
    ],
    toastProps: [{title: "Token is saved", type: ToastType.success}],
    newProps: {...userButtonProps, isDisabled: true},
    settings: tokenInput.value,
  }
  ```
