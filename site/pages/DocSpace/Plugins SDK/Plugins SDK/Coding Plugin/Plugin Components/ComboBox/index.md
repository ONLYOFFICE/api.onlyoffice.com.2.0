Custom combo box input.

**Interface**: IComboBox.

See the parameters of this component in [storybook](https://storybook.onlyoffice.io/?path=/docs/components-combobox--docs).

![Combo box](/assets/images/docspace/combobox.png)

To create a combo box option, use [IComboBoxItem](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/components/IComboBox.ts).

## Example

``` ts
import {Actions, type IComboBox, type IComboBoxItem, type IMessage} from "@onlyoffice/docspace-plugin-sdk"

const options: IComboBoxItem[] = [
  {key: "auto", label: "Auto"},
  {key: "en", label: "English"},
  {key: "es", label: "EspaÃ±ol"},
  {key: "eu", label: "Euskara"},
]

const onSelect = (option: IComboBoxItem) => {
  comboBox.selectedOption = option

  const message: IMessage = {
    actions: [Actions.updateProps],
    newProps: langComboBox,
  }
  return message
}

const comboBox: IComboBox = {
  options,
  selectedOption: options[0],
  onSelect,
  scaled: true,
  dropDownMaxHeight: 400,
  directionY: "both",
  scaledOptions: true,
}
```
