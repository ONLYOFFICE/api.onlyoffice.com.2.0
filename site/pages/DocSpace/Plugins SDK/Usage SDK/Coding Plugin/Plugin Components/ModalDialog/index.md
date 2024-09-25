Modal dialog.

**Interface**: IModalDialog.

See the parameters of this component in [storybook](https://storybook.onlyoffice.io/?path=/docs/components-modaldialog--docs).

![Modal dialog](/assets/images/docspace/modal-dialog.png)

To change the modal dialog type, use [ModalDisplayType](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/components/IModalDialog.ts) (*modal* or *aside*).

## Extra parameters

### fullScreen

Specifies whether to display the modal dialog body in the full screen mode without paddings.

Type: boolean

Example: true

## Example

``` ts
import {Actions, Components, type IBox, type IFrame, type IMessage, type IModalDialog, type ISkeleton, ModalDisplayType} from "@onlyoffice/docspace-plugin-sdk"

export const frameProps: IFrame = {
  width: "100%",
  height: "100%",
  name: "test-drawio",
  src: "",
}

const skeletonProps: ISkeleton = {
  width: "100%",
  height: "100%",
}

const body: IBox = {
  widthProp: "100vw",
  heightProp: "calc(var(--vh, 1vh) * 100)",

  children: [
    {
      component: Components.iFrame,
      props: frameProps,
    },
  ],
}

const bodySkeleton: IBox = {
  widthProp: "100vw",
  heightProp: "calc(var(--vh, 1vh) * 100)",
  children: [
    {
      component: Components.skeleton,
      props: skeletonProps,
    },
  ],
}

export const drawIoModalDialogProps: IModalDialog = {
  dialogHeader: "",
  dialogBody: body,
  displayType: ModalDisplayType.modal,
  onClose: () => {
    const message: IMessage = {
      actions: [Actions.closeModal],
    }

    return message
  },

  onLoad: async () => {
    return {
      newDialogHeader: drawIoModalDialogProps.dialogHeader,
      newDialogBody: drawIoModalDialogProps.dialogBody,
    }
  },
  autoMaxHeight: true,
  autoMaxWidth: true,
}
```
