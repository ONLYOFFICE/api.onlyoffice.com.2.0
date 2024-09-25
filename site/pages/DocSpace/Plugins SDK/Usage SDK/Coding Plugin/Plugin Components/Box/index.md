A container that lays out its contents in one direction. Box provides general CSS capabilities like flexbox layout, paddings, background color, border, and animation.

**Interface**: IBox.

See the parameters of this component in [storybook](https://storybook.onlyoffice.io/?path=/docs/components-box--docs).

![Box](/assets/images/docspace/box.png)

## Extra parameters

### children

The box components.

Type: array of [Components](../Component/index.md)

Example: \[inputComponent]

To set borders to the Box component, use a stroke or the [IBorderProp](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/components/IBox.ts) interface.

## Example

``` ts
import {Components, type IBox, type IInput, type InputGroup} from "@onlyoffice/docspace-plugin-sdk"

const nameInputProps: IInput = {
  value: "",
  onChange: () => {},
  scale: true,
  placeholder: "",
}

const inputComponent: InputGroup = {
  component: Components.input,
  props: nameInputProps,
}

const inputBox: IBox = {
  marginProp: "0 0 24px",
  children: [inputComponent],
}
```
