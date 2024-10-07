A component that is used to embed a third-party website into a modal window or the settings page.

**Interface**: [IFrame](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/components/IFrame.ts).

## Example

``` ts
import {type IFrame} from "@onlyoffice/docspace-plugin-sdk"

const frameProps: IFrame = {
  width: "100%",
  height: "100%",
  name: "test",
  src: "",
}
```
