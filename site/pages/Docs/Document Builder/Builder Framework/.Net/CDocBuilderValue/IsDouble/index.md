`bool IsDouble();`

Returns true if the **CDocBuilderValue** object is a double value.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.IsDouble* method is not used.

## Example

### .Net

```cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
bool bDouble = oGlobal.IsDouble();
CDocBuilder.Destroy();
```
