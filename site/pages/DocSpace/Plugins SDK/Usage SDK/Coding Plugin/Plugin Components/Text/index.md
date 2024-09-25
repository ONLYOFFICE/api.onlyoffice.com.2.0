Plain text.

**Interface**: IText.

See the parameters of this component in [storybook](https://storybook.onlyoffice.io/?path=/docs/components-text--docs).

![Text](/assets/images/docspace/text.png)

## Extra parameters

### text

The text inserted into the component.

Type: string

Example: "Sample for text component"

## Example

``` ts
import {type IText} from "@onlyoffice/docspace-plugin-sdk"

const text: IText = {
  text: "Sample for text component",
  fontWeight: 600,
  fontSize: "13px",
  lineHeight: "20px",
  noSelect: true,
}
```
