A component that is used to embed an image not from the *assets* folder into a modal window or the settings page. The full path to the image must be specified in the *src* parameter.

**Interface**: [IImage](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/components/IImage.ts).

## Example

``` ts
import {type IImage} from "@onlyoffice/docspace-plugin-sdk"

const imageProps: IImage = {
  width: "64px",
  height: "64px",
  alt: "sample",
  src: "image.png",
}
```
