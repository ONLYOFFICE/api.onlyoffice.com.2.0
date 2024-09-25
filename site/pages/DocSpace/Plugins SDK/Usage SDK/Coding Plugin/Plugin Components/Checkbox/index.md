Custom checkbox input.

**Interface**: ICheckBox.

See the parameters of this component in [storybook](https://storybook.onlyoffice.io/?path=/docs/components-checkbox--docs).

![Checkbox](/assets/images/docspace/checkbox.png)

## Example

``` ts
import {Actions, type ICheckbox, type IMessage} from "@onlyoffice/docspace-plugin-sdk"

const onChange = () => {
  cbProps.isChecked = !cbProps.isChecked

  const message: IMessage = {
    actions: [Actions.updateProps],
    newProps: cbProps,
  }
  return message
}

const cbProps: ICheckbox = {
  label: "Checkbox",
  title: "Checkbox",
  isChecked: false,
  onChange,
}
```
