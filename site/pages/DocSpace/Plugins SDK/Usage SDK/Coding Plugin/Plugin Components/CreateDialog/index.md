Modal dialog for creating certain item (file, folder, etc.). The user gets the full acess to the functionality but cannot control the layout.

**Interface**: [ICreateDialog](https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/components/ICreateDialog.ts).

## Example

``` ts
const createDialogProps = {
  title: "Create diagram",
  startValue: "New diagram",
  visible: true,
  isCreateDialog: true,
  extension: ".drawio",
  onSave: async (e: any, value: string) => {},
  onCancel: (e: any) => {},
  onClose: (e: any) => {},
}
```
