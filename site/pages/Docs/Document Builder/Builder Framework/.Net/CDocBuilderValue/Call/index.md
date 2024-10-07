`CDocBuilderValue^ Call(sName, p1, p2, p3, p4, p5, p6);`

Calls the specified Document Builder method. See the [Text document API](../../../../../Office%20API/Usage%20API/Text%20Document%20API/index.md), [Spreadsheet API](../../../../../Office%20API/Usage%20API/Spreadsheet%20API/index.md), [Presentation API](../../../../../Office%20API/Usage%20API/Presentation%20API/index.md) or [Form API](../../../../../Office%20API/Usage%20API/Form%20API/index.md) sections for more information which methods are available for various document types.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.Call* method is not used explicitly. The method itself is used instead. See the example below.

## Parameters

| Name    | Type           | Description                                                        |
| ------- | -------------- | ------------------------------------------------------------------ |
| *sName* | String^        | The name of the Document Builder method.                           |
| *p1-p6* | CBuilderValue^ | The parameters that the Document Builder method takes as argumens. |

## Example

### .Net

```cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
CValue oApi = oGlobal["Api"];
CValue oDocument = oApi.Call("GetDocument");
CDocBuilder.Destroy();
```

### .docbuilder

```ts
const oDocument = Api.GetDocument()
```
