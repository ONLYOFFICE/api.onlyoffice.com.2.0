Toast.

**Interface**: IToast.

See the parameters of this component in [storybook](https://storybook.onlyoffice.io/?path=/docs/components-toast--docs).

![Toast](/assets/images/docspace/toast.png)

To change the toast type, use [ToastType](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/components/IToast.ts) (*success, error, warning, info*).

## Example

``` ts
import {type IToast, ToastType} from "@onlyoffice/docspace-plugin-sdk"

const toast: IToast = {
  type: ToastType.error,
  title: "Wrong file format",
}
```
