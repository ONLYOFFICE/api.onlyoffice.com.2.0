`static CDocBuilderValue CreateUndefined();`

Creates an undefined value. This method returns the current [context](../../CDocBuilderContext/index.md) and calls its [CreateUndefined](../../CDocBuilderContext/CreateUndefined/index.md) method.

> Please note, that for the *.docbuilder* file the *CDocBuilderValue.CreateUndefined* method is not used.

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
CValue oApi = oGlobal["Api"];
CValue oUndefined = oApi.CreateUndefined();
CDocBuilder::Dispose();
```
