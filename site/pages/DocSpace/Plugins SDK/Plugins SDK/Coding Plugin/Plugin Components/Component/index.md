A component that is used to add components into [Box](../Box/index.md). Only components that are embedded into DOM can be wrapped (toast, modal dialog, etc. cannot be wrapped).

**Interface**: [Component](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/components/Component.ts).

## Extra parameters

### contextName

The context name that updates the component via React context.

Type: string

Example: "acceptButton"

## Example

``` ts
import {Actions, type ButtonGroup, ButtonSize, Components, type IButton, type IMessage, ToastType} from "@onlyoffice/docspace-plugin-sdk"

const onClick = () => {
  const message: IMessage = {
    actions: [Actions.showToast, Actions.updateProps],
    toastProps: [{title: "Data is saved", type: ToastType.success}],
    newProps: {...adminButtonProps, isDisabled: true},
  }
  return message
}

export const adminButtonProps: IButton = {
  onClick,
  size: ButtonSize.normal,
  label: "Save",
  scale: false,
  primary: true,
  isDisabled: true,
}

const buttonComponent: ButtonGroup = {
  component: Components.button,
  props: buttonProps,
  contextName: "acceptButton",
}
```
