Input field for single-line strings.

**Interface**: IInput.

See the parameters of this component in [storybook](https://storybook.onlyoffice.io/?path=/docs/components-textinput--docs).

![Input](/assets/images/docspace/input.png)

To change the input size, use **InputSize** (*base, middle, big, huge, large*), for the input types, use **InputType** (*text* or *password*), and for the autocomplete feature, use **InputAutocomplete** (*on* or *off*). More information can be found [here](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/components/IInput.ts).

## Example

``` ts
import {Actions, type IInput, type IMessage, InputAutocomplete, InputSize, InputType} from "@onlyoffice/docspace-plugin-sdk"

const onChange = (value: string) => {
  input.value = value

  const message: IMessage = {
    actions: [Actions.updateProps],
    newProps: input,
  }
  return message
}

const input: IInput = {
  value: "",
  onChange,
  scale: true,
  size: InputSize.base,
  type: InputType.text,
  autoComplete: InputAutocomplete.off,
}
```
