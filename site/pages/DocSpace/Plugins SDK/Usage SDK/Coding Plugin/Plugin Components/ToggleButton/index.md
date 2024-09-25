Custom toggle button input.

**Interface**: IToggleButton.

See the parameters of this component in [storybook](https://storybook.onlyoffice.io/?path=/docs/components-togglebutton--docs).

![Toggle button](/assets/images/docspace/toggle-button.png)

## Example

``` ts
import {Actions, type IMessage, type IToggleButton} from "@onlyoffice/docspace-plugin-sdk"

const onChange = () => {
  toggleButtonProps.isChecked = !toggleButtonProps.isChecked

  const message: IMessage = {
    actions: [Actions.updateProps],
    newProps: toggleButtonProps,
  }
  return message
}

const libToggleButtonProps: IToggleButton = {
  isChecked: false,
  onChange,
  style: {position: "relative", gap: "0px"},
}
```
